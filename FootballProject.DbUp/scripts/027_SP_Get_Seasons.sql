CREATE OR REPLACE PROCEDURE list_seasons_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN p_cursor FOR
    SELECT SeasonID, StartDate, EndDate
    FROM Seasons
    ORDER BY SeasonID;
END;
/