EXPLAIN ANALYZE 
SELECT
    EXTRACT(YEAR FROM o_orderdate) AS year,
    EXTRACT(QUARTER FROM o_orderdate) AS quarter,
    EXTRACT(MONTH FROM o_orderdate) AS month,
    customer_name,
    SUM(revenue_loss) AS revenue_loss
FROM 
    mv_query3
WHERE
    customer_name = 'Customer#000307258' 
    AND EXTRACT(QUARTER FROM o_orderdate) = 4 
GROUP BY ROLLUP(
    EXTRACT(YEAR FROM o_orderdate),
    EXTRACT(QUARTER FROM o_orderdate),
    EXTRACT(MONTH FROM o_orderdate), 
    customer_name
)
ORDER BY
    year, quarter, month, customer_name; 
