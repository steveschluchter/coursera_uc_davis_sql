SELECT 
    dates_rollup.date,
    COALESCE(SUM(orders), 0) AS orders,
    COALESCE(SUM(items_ordered), 0) AS items_ordered
    COUNT(*) AS rows -- how many rows are being collapsed into the 7 day rollup
FROM
    dsv1069.dates_rollup
LEFT OUTER JOIN
(
SELECT 
    date(orders.paid_at) as day,
    COUNT(DISTINCT invoice_id) AS orders,
    COUNT(DISTINCT line_item_id) as line_items
FROM dsv1069.orders
GROUP BY 
    date(paid_at)
)  daily_orders
ON
    daily_orders.day >= dates_rollup.date
AND
    dates_rollup.d7_ago < daily_orders.day
GROUP BY
    dates_rollup.date;