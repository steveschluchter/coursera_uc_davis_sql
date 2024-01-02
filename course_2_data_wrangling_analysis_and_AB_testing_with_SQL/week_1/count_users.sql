SELECT 
    id,
    parent_user_id,
    merged_at
FROM dsv1069.users
ORDER BY parent_user_id ASC;

SELECT 
    date(created_at) AS day,
    COUNT(*) AS users
FROM dsv1069.users
GROUP By date(created_at);

SELECT
    date(deleted_at) AS day,
    COUNT(*) AS deleted_users
FROM dsv1069.users
WHERE deleted_at is NOT NULL
GROUP BY 
    date(deleted_at);