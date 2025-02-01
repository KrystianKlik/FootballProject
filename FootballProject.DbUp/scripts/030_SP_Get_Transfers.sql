CREATE OR REPLACE PROCEDURE list_transfers_with_names_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT
    t.TransferID,
    t.TransferDate,
    t.TransferFee,
    t.PlayerID,
    p.FirstName || ' ' || p.LastName AS PlayerName,
    t.FromTeamID,
    ft.Name AS FromTeamName,
    t.ToTeamID,
    tt.Name AS ToTeamName
FROM Transfers t
         LEFT JOIN Players p ON t.PlayerID = p.PlayerID
         LEFT JOIN Teams ft ON t.FromTeamID = ft.TeamID
         LEFT JOIN Teams tt ON t.ToTeamID = tt.TeamID
ORDER BY t.TransferID;
END;
/
