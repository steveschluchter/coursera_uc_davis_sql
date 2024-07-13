SELECT
    DISTINCT parameter_value AS test_id
FROM 
    dsv1069.events
WHERE event_name = 'test_assignment'
AND
    parameter_name = 'test_id';

SELECT
    parameter_value    AS test_id,
    DATE(event_time)   AS day,
    COUNT(*)           AS event_rows
FROM
    dsv1069.events
WHERE
    event_name = 'test_assignment'
GROUP BY
    test_id,
    day;

SELECT
user_id,
COUNT(DISTINCT test_assignment) as assignments
FROM
( SELECT
    event_id,
    event_time,
    user_id,
    platform
    MAX(CASE WHEN parameter_name = 'test_id'
        THEN CAST(parameter_value) AS INT)
        ELSE NULL
        END) AS test_id,
    MAX(CASE WHEN parameter_name = 'test_assignment',
        THEN parameter_value
        ELSE NULL
        END) AS test_assignment
  FROM
    dsv1069.events
  WHERE event_name = 'test_assignment'
  GROUP BY
     event_id,
     event_time,
     user_id,
     platform
ORDER BY
     event_id
     )
     test_events
GROUP BY
    user_id
ORDER BY
    assignments DESC;
