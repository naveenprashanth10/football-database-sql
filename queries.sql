-- 1️⃣ List all players with their teams
SELECT p.player_name, t.team_name
FROM players p
JOIN teams t ON p.team_id = t.team_id;

-- 2️⃣ Total goals scored by each player
SELECT p.player_name, SUM(ps.goals) AS total_goals
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_goals DESC;

-- 3️⃣ Top 5 goal scorers
SELECT p.player_name, SUM(ps.goals) AS goals
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY goals DESC
LIMIT 5;

-- 4️⃣ Team with most goals scored
SELECT t.team_name, SUM(m.home_goals + m.away_goals) AS total_goals
FROM matches m
JOIN teams t ON t.team_id IN (m.home_team_id, m.away_team_id)
GROUP BY t.team_name
ORDER BY total_goals DESC;

-- 5️⃣ Match results with team names
SELECT 
    m.match_id,
    th.team_name AS home_team,
    ta.team_name AS away_team,
    m.home_goals,
    m.away_goals
FROM matches m
JOIN teams th ON m.home_team_id = th.team_id
JOIN teams ta ON m.away_team_id = ta.team_id;

-- 6️⃣ Players who played full match (90 minutes)
SELECT p.player_name, ps.minutes_played
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
WHERE ps.minutes_played = 90;

-- 7️⃣ Average age of players per team
SELECT t.team_name, AVG(p.age) AS avg_age
FROM players p
JOIN teams t ON p.team_id = t.team_id
GROUP BY t.team_name;

-- 8️⃣ Total assists by each player
SELECT p.player_name, SUM(ps.assists) AS total_assists
FROM player_stats ps
JOIN players p ON ps.player_id = p.player_id
GROUP BY p.player_name
ORDER BY total_assists DESC;
