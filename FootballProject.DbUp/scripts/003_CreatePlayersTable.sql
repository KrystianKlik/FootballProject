CREATE TABLE  Players (
    PlayerID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Position VARCHAR(50),
    JerseyNumber INTEGER,
    ContactInfo VARCHAR(255),
    ContractStart DATE,
    ContractEnd DATE,
    Salary DECIMAL(15, 2),
    TeamID INTEGER REFERENCES Teams(TeamID) ON DELETE SET NULL
)