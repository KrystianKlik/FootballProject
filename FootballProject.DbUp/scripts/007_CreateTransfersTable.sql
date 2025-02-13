CREATE TABLE  Transfers (
     TransferID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
     PlayerID INTEGER REFERENCES Players(PlayerID) ON DELETE CASCADE,
    FromTeamID INTEGER REFERENCES Teams(TeamID) ON DELETE SET NULL,
    ToTeamID INTEGER REFERENCES Teams(TeamID) ON DELETE SET NULL,
    TransferDate DATE,
    TransferFee DECIMAL(15, 2)
    )