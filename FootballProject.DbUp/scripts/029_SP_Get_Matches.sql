CREATE OR REPLACE PROCEDURE list_matches_with_names_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT
    m.MatchID,
    m.MatchDate,
    m.HomeTeamID,
    ht.Name AS HomeTeamName,
    m.AwayTeamID,
    at.Name AS AwayTeamName,
    m.HomeScore,
    m.AwayScore,
    m.StadiumID,
    s.Name AS StadiumName,
    m.RefereeID,
    r.FirstName || ' ' || r.LastName AS RefereeName
FROM Matches m
         LEFT JOIN Teams ht ON m.HomeTeamID = ht.TeamID
         LEFT JOIN Teams at ON m.AwayTeamID = at.TeamID
    LEFT JOIN Stadiums s ON m.StadiumID = s.StadiumID
    LEFT JOIN Referees r ON m.RefereeID = r.RefereeID
ORDER BY m.MatchID;
END;
/