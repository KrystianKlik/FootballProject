CREATE TABLE IF NOT EXISTS Referees (
    RefereeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Experience VARCHAR(100),
    MatchesOfficiated INTEGER DEFAULT 0
    );