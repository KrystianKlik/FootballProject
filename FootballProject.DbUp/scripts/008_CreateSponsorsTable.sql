CREATE TABLE IF NOT EXISTS Sponsors (
    SponsorID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SponsorshipType VARCHAR(100),
    ContractDetails VARCHAR(255)
);