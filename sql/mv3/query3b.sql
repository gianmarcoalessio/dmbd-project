SELECT
    COALESCE(CAST(DATE_PART('year', o_orderdate) AS TEXT), 'Total') AS orderYear,
    DATE_PART('quarter', o_orderdate) AS orderQuarter,
    DATE_PART('month', o_orderdate) AS orderMonth,
    c_name AS customer,
    SUM(revenue) AS totalRevenueLoss
FROM
    mv_q3
WHERE
    DATE_PART('year', o_orderdate) = 1994
    AND DATE_PART('quarter', o_orderdate) = 4
    AND c_name = 'Customer#000371519'
GROUP BY
    customer,
    ROLLUP(orderYear, orderQuarter, orderMonth)
ORDER BY
    customer,
    COALESCE(CAST(DATE_PART('year', o_orderdate) AS TEXT), 'Total'),
    orderQuarter,
    orderMonth;