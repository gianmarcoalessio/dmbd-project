SELECT 
    inat.n_name as import_nation,
    ireg.r_name as import_regin,
    enat.n_name as export_nation, 
    ereg.r_name as export_region, 
    SUM(L.l_extendedprice * (1 - L.l_discount)) AS revenue, 
    DATE_PART('month', O.o_orderdate) AS order_month,
    DATE_PART('quarter', O.o_orderdate) AS order_quarter, 
    DATE_PART('year', O.o_orderdate) AS order_year,
    P.p_type AS ptype 
FROM 
    LINEITEM AS L
JOIN 
    ORDERS AS O ON L.l_orderkey = O.o_orderkey
JOIN 
    PART AS P ON P.p_partkey = L.l_partkey
JOIN 
    SUPPLIER AS S ON S.s_suppkey = L.l_suppkey
JOIN 
    CUSTOMER AS C ON C.c_custkey = O.o_custkey
JOIN 
    NATION AS enat ON enat.n_nationkey = S.s_nationkey
JOIN 
    NATION AS inat ON inat.n_nationkey = C.c_nationkey 
JOIN 
    REGION AS ereg ON ereg.r_regionkey = enat.n_regionkey
JOIN 
    REGION AS ireg ON ireg.r_regionkey = inat.n_regionkey
WHERE 
    enat.n_name = 'FRANCE'
    AND inat.n_name != enat.n_name 
    AND P.p_type = 'ECONOMY POLISHED TIN'
GROUP BY 
    ROLLUP(P.p_type),
    ROLLUP(ereg.r_name, enat.n_name), 
    ROLLUP(ireg.r_name, inat.n_name),
    ROLLUP(DATE_PART('year', O.o_orderdate), DATE_PART('quarter', O.o_orderdate), DATE_PART('month', O.o_orderdate));
