CREATE OR REPLACE PROCEDURE list_players_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT
    PlayerID,
    FirstName,
    LastName,
    DateOfBirth,
    Position,
    JerseyNumber,
    ContactInfo,
    ContractStart,
    ContractEnd,
    Salary,
    TeamID
FROM Players
ORDER BY PlayerID;
END;
/
