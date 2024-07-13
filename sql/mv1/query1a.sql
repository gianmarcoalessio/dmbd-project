SELECT
    inat.n_name as import_nation,
    ireg.r_name as import_region,
    enat.n_name as export_nation, 
    ereg.r_name as export_region, 
    SUM(revenue) AS total_revenue,
    DATE_PART('year', orderdate) AS order_year,
    DATE_PART('quarter', orderdate) AS order_quarter,
    DATE_PART('month', orderdate) AS order_month,
    ptype
FROM
    mv_q1
JOIN 
    nation AS enat ON enat.n_nationkey = export_nation
JOIN 
    nation AS inat ON inat.n_nationkey = import_nation
JOIN 
    region AS ereg ON ereg.r_regionkey = export_region
JOIN 
    region AS ireg ON ireg.r_regionkey = import_region
WHERE
    enat.n_name = 'FRANCE'
    AND ptype = 'ECONOMY POLISHED TIN'
GROUP BY
    ROLLUP(ptype),
    ROLLUP(ereg.r_name, enat.n_name),
    ROLLUP(ireg.r_name, inat.n_name),
    ROLLUP(order_year, order_quarter, order_month);