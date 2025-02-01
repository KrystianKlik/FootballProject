CREATE OR REPLACE PROCEDURE update_player(
    p_playerid       IN  NUMBER,
    p_firstname      IN  VARCHAR2,
    p_lastname       IN  VARCHAR2,
    p_dateofbirth    IN  DATE,
    p_position       IN  VARCHAR2,
    p_jerseynumber   IN  INTEGER,
    p_contactinfo    IN  VARCHAR2,
    p_contractstart  IN  DATE,
    p_contractend    IN  DATE,
    p_salary         IN  DECIMAL,
    p_teamid         IN  INTEGER
)
AS
BEGIN
UPDATE Players
SET FirstName      = p_firstname,
    LastName       = p_lastname,
    DateOfBirth    = p_dateofbirth,
    Position       = p_position,
    JerseyNumber   = p_jerseynumber,
    ContactInfo    = p_contactinfo,
    ContractStart  = p_contractstart,
    ContractEnd    = p_contractend,
    Salary         = p_salary,
    TeamID         = p_teamid
WHERE PlayerID = p_playerid;

COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/
