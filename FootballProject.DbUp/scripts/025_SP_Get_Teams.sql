CREATE OR REPLACE PROCEDURE list_teams_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT TeamID, Name, City, StadiumID, Coach, Sponsorship
FROM teams
ORDER BY TeamID;
END;
/