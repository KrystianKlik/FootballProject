CREATE OR REPLACE PROCEDURE insert_player(
    p_firstname      IN  VARCHAR2,
    p_lastname       IN  VARCHAR2,
    p_dateofbirth    IN  DATE,
    p_position       IN  VARCHAR2,
    p_jerseynumber   IN  INTEGER,
    p_contactinfo    IN  VARCHAR2,
    p_contractstart  IN  DATE,
    p_contractend    IN  DATE,
    p_salary         IN  DECIMAL,
    p_teamid         IN  INTEGER,
    p_new_playerid   OUT NUMBER
)
AS
BEGIN
INSERT INTO Players (
    FirstName, LastName, DateOfBirth, Position, JerseyNumber,
    ContactInfo, ContractStart, ContractEnd, Salary, TeamID
) VALUES (
             p_firstname, p_lastname, p_dateofbirth, p_position, p_jerseynumber,
             p_contactinfo, p_contractstart, p_contractend, p_salary, p_teamid
         )
    RETURNING PlayerID INTO p_new_playerid;

COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/