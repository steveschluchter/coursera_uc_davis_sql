/*Error Codes Assignment

Exercise 1*/



SELECT id, email_address
FROM dsv1069.users
WHERE deleted_at IS NULL;



/*Exercise 2*/


SELECT count(*) as count, category
FROM dsv1069.items
GROUP BY category;


--Exercise 3

SELECT *
FROM
    dsv1069.users u
RIGHT JOIN
    dsv1069.orders o
ON
   u.id = o.user_id;

--Exercise 4

SELECT COUNT(DISTINCT( event_id))
FROM dsv1069.events
WHERE event_name = 'view_item';

--Exercise 5

SELECT  
COUNT(DISTINCT(item_id)) AS item_count
FROM dsv1069.orders
INNER JOIN dsv1069.items
ON orders.item_id = items.id;

--Exercise 6

SELECT users.id AS user_id, MIN(orders.paid_at) as min_paid_at
FROM dsv1069.orders
LEFT OUTER JOIN
    dsv1069.users
ON 
    orders.user_id = users.id
GROUP BY users.id;

--Exercise 7
SELECT 
(CASE WHEN first_view is NULL THEN false
     ELSE true END) AS has_viewed_profile_page,
COUNT(user_id) AS users
FROM
    (
    SELECT 
       users.id AS user_id,
       MIN(event_time) AS first_view
       FROM dsv1069.users
       LEFT OUTER JOIN
       dsv1069.events
       ON
           events.user_id = users.id
       AND events.event_name = 'view_user_profile'
       GROUP BY
           users.id
           ) first_profile_views
      GROUP BY (CASE WHEN first_view IS NULL THEN false
          ELSE true END)

