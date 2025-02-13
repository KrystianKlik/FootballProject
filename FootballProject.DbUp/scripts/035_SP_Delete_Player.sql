CREATE OR REPLACE PROCEDURE delete_player(
    p_playerid IN NUMBER
)
AS
BEGIN
DELETE FROM Players
WHERE PlayerID = p_playerid;

COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END;
/
