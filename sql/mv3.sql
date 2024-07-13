-- Da testare di Alice (da aggiungere qualche modifica per copyright)
CREATE MATERIALIZED VIEW mv_q3 AS
SELECT
    o_orderdate,
    l_extendedprice * (1 - l_discount) AS revenue,
    c_name
FROM
    orders
JOIN 
    lineitem ON l_orderkey = o_orderkey
JOIN 
    customer ON c_custkey = o_custkey
WHERE
    l_returnflag = 'R';