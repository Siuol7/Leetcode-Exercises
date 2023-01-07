# Write your MySQL query statement below
SELECT
  A.player_id,
  A.event_date,
  SUM(A.games_played) OVER (
    PARTITION BY
      A.player_id
    ORDER BY
      A.event_date
  ) AS games_played_so_far
FROM
  Activity A;