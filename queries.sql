-- 1️ Players with their teams
SELECT p.player_name, t.team_name
FROM players p
JOIN teams t ON p.team_id = t.team_id;


-- 2️ Total goals by each player
SELECT p.player_name, SUM(ps.goals) AS total_goals
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_goals DESC;


-- 3️ Top 5 goal scorers
SELECT p.player_name, SUM(ps.goals) AS goals
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY goals DESC
LIMIT 5;


-- 4️ Match results with team names
SELECT 
    m.match_id,
    th.team_name AS home_team,
    ta.team_name AS away_team,
    m.home_goals,
    m.away_goals
FROM matches m
JOIN teams th ON m.home_team_id = th.team_id
JOIN teams ta ON m.away_team_id = ta.team_id;


-- 5️ Players who played full 90 minutes
SELECT p.player_name, ps.minutes_played
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
WHERE ps.minutes_played = 90;


-- 6️ Average age of players per team
SELECT t.team_name, ROUND(AVG(p.age), 1) AS avg_age
FROM players p
JOIN teams t ON p.team_id = t.team_id
GROUP BY t.team_name;


-- 7️ Total assists by each player
SELECT p.player_name, SUM(ps.assists) AS total_assists
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_assists DESC;
