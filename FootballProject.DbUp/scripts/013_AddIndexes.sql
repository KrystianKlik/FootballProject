-- Indeks na TeamID w tabeli Players
CREATE INDEX IF NOT EXISTS idx_players_teamid ON Players(TeamID);

-- Indeks na PlayerID w tabeli PlayerStatistics
CREATE INDEX IF NOT EXISTS idx_playerstats_playerid ON PlayerStatistics(PlayerID);

-- Indeks na SeasonID w tabeli PlayerStatistics
CREATE INDEX IF NOT EXISTS idx_playerstats_seasonid ON PlayerStatistics(SeasonID);

-- Indeks na FromTeamID i ToTeamID w tabeli Transfers
CREATE INDEX IF NOT EXISTS idx_transfers_fromteamid ON Transfers(FromTeamID);
CREATE INDEX IF NOT EXISTS idx_transfers_toteamid ON Transfers(ToTeamID);
