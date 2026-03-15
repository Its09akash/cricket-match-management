CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    age INT,
    role VARCHAR(20),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    match_date DATE,
    venue VARCHAR(50),
    team1_id INT,
    team2_id INT,
    winner_team_id INT
);

CREATE TABLE scorecard (
    score_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    runs INT,
    balls INT,
    wickets INT
);
