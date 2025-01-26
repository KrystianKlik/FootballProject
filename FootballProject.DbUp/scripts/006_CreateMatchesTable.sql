CREATE TABLE IF NOT EXISTS Matches (
   MatchID SERIAL PRIMARY KEY,
   MatchDate TIMESTAMP NOT NULL,
   HomeTeamID INTEGER REFERENCES Teams(TeamID) ON DELETE CASCADE,
    AwayTeamID INTEGER REFERENCES Teams(TeamID) ON DELETE CASCADE,
    HomeScore INTEGER DEFAULT 0,
    AwayScore INTEGER DEFAULT 0,
    StadiumID INTEGER REFERENCES Stadiums(StadiumID) ON DELETE SET NULL,
    RefereeID INTEGER REFERENCES Referees(RefereeID) ON DELETE SET NULL
    );
