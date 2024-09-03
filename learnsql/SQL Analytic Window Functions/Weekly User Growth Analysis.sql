SELECT
  date,
  active_users,
  LEAD(active_users, 7) OVER(ORDER BY date) AS users_7_days_later
FROM daily_metrics
WHERE website_id = 5
  AND date BETWEEN '2023-09-01' AND '2023-09-14';