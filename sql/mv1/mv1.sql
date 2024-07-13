CREATE MATERIALIZED VIEW mv_q1 AS
SELECT
    inat.n_nationkey as import_nation,
    ireg.r_regionkey as import_region,
    enat.n_nationkey as export_nation, 
    ereg.r_regionkey as export_region, 
    O.o_orderdate AS orderdate,
    P.p_type AS ptype,
    L.l_extendedprice * (1 - L.l_discount) AS revenue
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
    inat.n_nationkey != enat.n_nationkey;
