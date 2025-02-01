CREATE OR REPLACE PROCEDURE list_player_statistics_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT
    ps.PlayerStatisticID,
    ps.PlayerID,
    p.FirstName || ' ' || p.LastName AS PlayerName,
    ps.SeasonID,
    s.StartDate,
    s.EndDate,
    ps.Goals,
    ps.Assists,
    ps.MinutesPlayed,
    ps.YellowCards,
    ps.RedCards
FROM PlayerStatistics ps
         LEFT JOIN Players p ON ps.PlayerID = p.PlayerID
         LEFT JOIN Seasons s ON ps.SeasonID = s.SeasonID
ORDER BY ps.PlayerStatisticID;
END;
/
