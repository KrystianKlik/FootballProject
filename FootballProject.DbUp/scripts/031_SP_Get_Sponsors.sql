CREATE OR REPLACE PROCEDURE list_sponsors_cursor(p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
OPEN p_cursor FOR
SELECT SponsorID, Name, SponsorshipType, ContractDetails
FROM Sponsors
ORDER BY SponsorID;
END;
/