BEGIN
EXECUTE IMMEDIATE 'CREATE INDEX idx_players_teamid ON Players(TeamID)';
EXECUTE IMMEDIATE 'CREATE INDEX idx_playerstats_playerid ON PlayerStatistics(PlayerID)';
EXECUTE IMMEDIATE 'CREATE INDEX idx_playerstats_seasonid ON PlayerStatistics(SeasonID)';
EXECUTE IMMEDIATE 'CREATE INDEX idx_transfers_fromteamid ON Transfers(FromTeamID)';
EXECUTE IMMEDIATE 'CREATE INDEX idx_transfers_toteamid ON Transfers(ToTeamID)';
END;
/