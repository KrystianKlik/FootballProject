CREATE TABLE IF NOT EXISTS Stadiums (
    StadiumID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Capacity INTEGER,
    Location VARCHAR(255)
    );