SELECT
    COALESCE(CAST(DATE_PART('year', O_ORDERDATE) AS TEXT), 'Total') AS orderYear,
    DATE_PART('quarter', O_ORDERDATE) AS orderQuarter,
    DATE_PART('month', O_ORDERDATE) AS orderMonth,
    C_NAME AS customer,
    SUM(L_EXTENDEDPRICE * (1 - L_DISCOUNT)) AS totalRevenueLoss
FROM
    LINEITEM 
JOIN
    ORDERS ON LINEITEM.L_ORDERKEY = ORDERS.O_ORDERKEY
JOIN
    CUSTOMER ON CUSTOMER.C_CUSTKEY = ORDERS.O_CUSTKEY
WHERE
    L_RETURNFLAG = 'R'
    AND DATE_PART('year', O_ORDERDATE) = 1994
    AND DATE_PART('quarter', O_ORDERDATE) = 4
    AND C_NAME = 'Customer#000029326'
GROUP BY
    customer,
    ROLLUP(orderYear, orderQuarter, orderMonth)
ORDER BY
    customer,
    COALESCE(CAST(DATE_PART('year', O_ORDERDATE) AS TEXT), 'Total'),
    orderQuarter,
    orderMonth;