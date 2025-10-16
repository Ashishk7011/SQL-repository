CREATE TABLE search_logs (
    log_id INT PRIMARY KEY,
    query VARCHAR(100),
    timestamp DATETIME,
    user_id VARCHAR(10)
);


INSERT INTO search_logs (log_id, query, timestamp, user_id) VALUES
(1, 'data analyst', '2025-06-03 10:00:00', 'U101'),
(2, 'SQL basics', '2025-06-03 11:00:00', 'U102'),
(3, 'data analyst', '2025-06-04 09:30:00', 'U103'),
(4, 'Python', '2025-06-05 14:00:00', 'U101'),
(5, 'data analyst', '2025-06-05 16:00:00', 'U102'),
(6, 'SQL basics', '2025-06-06 10:00:00', 'U101'),
(7, 'Python', '2025-06-06 11:00:00', 'U103'),
(8, 'machine learning', '2025-06-07 10:00:00', 'U101'),
(9, 'data analyst', '2025-06-10 09:00:00', 'U102'),
(10, 'SQL advanced', '2025-06-10 10:00:00', 'U101'),
(11, 'SQL advanced', '2025-06-11 11:00:00', 'U103'),
(12, 'Python', '2025-06-11 12:00:00', 'U102'),
(13, 'data analyst', '2025-06-12 13:00:00', 'U101'),
(14, 'machine learning', '2025-06-13 14:00:00', 'U103'),
(15, 'Python', '2025-06-13 15:00:00', 'U101'),
(16, 'data visualization', '2025-06-14 16:00:00', 'U102');

WITH weekly_counts AS (
    SELECT 
        WEEK(timestamp) AS week_of_year,
        query,
        COUNT(query) AS query_count
    FROM search_logs
    GROUP BY week_of_year, query
)
SELECT 
    week_of_year,
    query,
    query_count, rn from (SELECT 
    week_of_year,
    query,
    query_count,
    ROW_NUMBER() OVER (PARTITION BY week_of_year ORDER BY query_count DESC) AS rn
FROM weekly_counts
ORDER BY week_of_year, rn) as query_ranked
where rn<=3;
