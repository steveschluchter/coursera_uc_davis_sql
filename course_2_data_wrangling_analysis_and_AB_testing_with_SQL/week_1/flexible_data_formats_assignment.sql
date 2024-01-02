--EX1
SELECT
date(event_time) AS date,
count(*) as rows
FROM dsv1069.events_201701
GROUP BY date(event_time);


--EX2
SELECT
date(event_time) AS date,
event_name,
count(*)
FROM dsv1069.events_ex2
group by 
date,
event_name;

SELECT
date(event_time) as date,
platform,
count(*)
FROM dsv1069.events_ex2
GROUP BY
    date(event_time)
    platform


--EX3
SELECT SUM(view_events) as event_count FROM dsv1069.item_views_by_category_temp;

SELECT COUNT(DISTINCT(event_id) as event_count)
FROM dsv1068.events
WHERE event_name = 'item_view';



--Ex4
SELECT
date(event_time) AS date,
COUNT(*)
COUNT(event_id)
COUNT(user_id)
FROM dsv1069.raw_events
GROUP BY date(event_time);

--EX5
SELECT
date(event_time) AS date,
COUNT(*) as row_count,
COUNT(event_id) as event_count,
COUNT(user_id) as user_count
FROM dsv1069.raw_events
GROUP BY date(event_time);

SELECT 
    date(event_time) as date,
    platform,
    COUNT(user_id) AS users,
FROM dsv1069.raw_events
WHERE event_time < '2014-01-01'
GROUP BY date(event_time),
         platform;a


SELECT
    COUNT(*),
    FROM dsv1069.order,
    JOIN dsv1069.users
    ON oders.user_id = COALESCE(users.parent_user_id, users.id) -- if users.parent_user_id is available, then use it, else use users.id




