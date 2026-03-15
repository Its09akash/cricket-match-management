--1) top Scorer (Orange cap)
select p.player_name, sum(s.runs) as total_runs
from players p
join scorecard s on p.player_id=s.player_id
group by p.player_name
order by total_runs Desc
limit 1;

--2) Best Bowler (Purple Cap)
Select p.player_name, Sum(s.wickets) as total_wickets
from players p
join scorecard s on p.player_id=s.player_id
Group by p.player_name
order by total_wickets desc
limit 1;

--3) Total Rus by each Player
SELECT p.player_name, SUM(s.runs) AS total_runs
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
GROUP BY p.player_name
ORDER BY total_runs DESC;

--4) Player strike rate
SELECT p.player_name,
SUM(s.runs) AS runs,
SUM(s.balls) AS balls,
ROUND((SUM(s.runs)*100.0)/SUM(s.balls),2) AS strike_rate
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
GROUP BY p.player_name;

--5) match winners
SELECT m.match_id, t.team_name AS winner
FROM matches m
JOIN teams t ON m.winner_team_id = t.team_id;

--6) Matches Won By Each Team
SELECT t.team_name, COUNT(*) AS wins
FROM matches m
JOIN teams t ON m.winner_team_id = t.team_id
GROUP BY t.team_name;

--7) Players in Each team
SELECT t.team_name, COUNT(p.player_id) AS total_players
FROM teams t
JOIN players p ON t.team_id = p.team_id
GROUP BY t.team_name;

--8) Highest Individual Score
SELECT p.player_name, MAX(s.runs) AS highest_score
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
GROUP BY p.player_name
ORDER BY highest_score DESC
LIMIT 1;

-- 9) Most wicket in a match
SELECT p.player_name, MAX(s.wickets) AS wicket
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
GROUP BY p.player_name
ORDER BY wicket DESC
LIMIT 1;

--10) Total matches Played
SELECT COUNT(*) AS total_matches
FROM matches;

--11) Matches Played By Each Team
SELECT t.team_name, COUNT(*) AS matches_played
FROM matches m
JOIN teams t ON t.team_id = m.team1_id OR t.team_id = m.team2_id
GROUP BY t.team_name;

--12)Average runs By playes 
SELECT p.player_name, AVG(s.runs) AS avg_runs
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
GROUP BY p.player_name;

--13) Players with More than 50 Runs
SELECT p.player_name, s.runs
FROM players p
JOIN scorecard s ON p.player_id = s.player_id
WHERE s.runs > 50;

--14) matches played in Each Venus
SELECT venue, COUNT(*) AS matches
FROM matches
GROUP BY venue;

--15) Team With Most Wins
SELECT t.team_name, COUNT(*) AS wins
FROM matches m
JOIN teams t ON m.winner_team_id = t.team_id
GROUP BY t.team_name
ORDER BY wins DESC
LIMIT 1;	
