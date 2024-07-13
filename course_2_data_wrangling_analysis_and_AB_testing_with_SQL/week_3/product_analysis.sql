SELECT
    COUNT(DISTINCT user_id) AS users_who_reordered
FROM 
    (
    SELECT
        user_id,
        item_id,
        COUNT(DISTINCT line_item_id) AS times_user_ordered
    FROM 
    dsv1069.orders
   GROUP BY
    user_id,
    item_id
    ) user_level_orders
    WHERE times_user_ordered > 1;



SELECT 
COUNT(DISTINCT(user_id))
FROM
    (
    SELECT
    user_id,
    COUNT(invoice_id) AS order_count
FROM 
    dsv1069.orders
GROUP BY
    user_id
) user_level
WHERE order_count > 1;
