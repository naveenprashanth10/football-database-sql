-- =========================
-- DATABASE: FOOTBALL DATA
-- =========================

CREATE TABLE leagues (
    league_id SERIAL PRIMARY KEY,
    league_name VARCHAR(100) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL,
    league_id INT,
    FOREIGN KEY (league_id) REFERENCES leagues(league_id)
);

CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    age INT,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    home_goals INT,
    away_goals INT,
    FOREIGN KEY (home_team_id) REFERENCES teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES teams(team_id)
);

CREATE TABLE player_stats (
    stat_id SERIAL PRIMARY KEY,
    player_id INT,
    match_id INT,
    goals INT DEFAULT 0,
    assists INT DEFAULT 0,
    minutes_played INT,
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
);
