SELECT
    C_NAME AS customer,
    COUNT(DISTINCT L_ORDERKEY) AS returned_orders,
    SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS total_revenue_loss
FROM
    LINEITEM 
JOIN
    ORDERS ON LINEITEM.L_ORDERKEY = ORDERS.O_ORDERKEY
JOIN
    CUSTOMER ON CUSTOMER.C_CUSTKEY = ORDERS.O_CUSTKEY
WHERE
    L_RETURNFLAG = 'R'
    AND DATE_PART('year', O_ORDERDATE) = 1994
    AND DATE_PART('quarter', O_ORDERDATE) IN (3, 4)
GROUP BY
    C_NAME
ORDER BY
    total_revenue_loss DESC
LIMIT 10;