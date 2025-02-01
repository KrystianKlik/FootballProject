CREATE OR REPLACE PROCEDURE get_player_by_id(
    p_playerid IN NUMBER,
    p_cursor   OUT SYS_REFCURSOR
)
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
WHERE PlayerID = p_playerid;
END;
/
