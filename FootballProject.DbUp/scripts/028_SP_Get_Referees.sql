CREATE OR REPLACE PROCEDURE list_referees_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT RefereeID, FirstName, LastName, Experience, MatchesOfficiated
FROM Referees
ORDER BY RefereeID;
END;
/