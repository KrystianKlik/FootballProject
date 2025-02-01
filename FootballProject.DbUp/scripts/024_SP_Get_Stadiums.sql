CREATE OR REPLACE PROCEDURE list_stadiums_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT StadiumId, Name, Capacity, Location
FROM stadiums
ORDER BY StadiumId;
END;
/