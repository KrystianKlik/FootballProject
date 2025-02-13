CREATE TABLE Teams (
                       TeamID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                       Name VARCHAR(100) NOT NULL,
                       City VARCHAR(100) NOT NULL,
                       StadiumID INTEGER REFERENCES Stadiums(StadiumID) ON DELETE SET NULL,
                       Coach VARCHAR(100),
                       Sponsorship VARCHAR(255)
)