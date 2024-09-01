--User Engagement Analysis
--Find previous active users three days
--No value set dafault to -1

SELECT
  day,
  active_users,
  LAG(active_users, 3, '-1') OVER(ORDER BY day) AS previous_active_users
FROM statistics;