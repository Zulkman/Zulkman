
CREATE TABLE Hub_Athlete (
    Athlete_Key SERIAL PRIMARY KEY,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

CREATE TABLE Hub_Sport (
    Sport_Key SERIAL PRIMARY KEY,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

CREATE TABLE Hub_Competition (
    Competition_Key SERIAL PRIMARY KEY,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);


CREATE TABLE Link_Athlete_Competition (
    Link_Key SERIAL PRIMARY KEY,
    Athlete_Key INT REFERENCES Hub_Athlete(Athlete_Key),
    Competition_Key INT REFERENCES Hub_Competition(Competition_Key),
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

CREATE TABLE Link_Sport_Competition (
    Link_Key SERIAL PRIMARY KEY,
    Sport_Key INT REFERENCES Hub_Sport(Sport_Key),
    Competition_Key INT REFERENCES Hub_Competition(Competition_Key),
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

-- Сателлиты

CREATE TABLE Satellite_Athlete_Details (
    Satellite_Key SERIAL PRIMARY KEY,
    Athlete_Key INT REFERENCES Hub_Athlete(Athlete_Key),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

CREATE TABLE Satellite_Competition_Details (
    Satellite_Key SERIAL PRIMARY KEY,
    Competition_Key INT REFERENCES Hub_Competition(Competition_Key),
    Name VARCHAR(100) NOT NULL,
    DateHeld DATE NOT NULL,
    Venue VARCHAR(100) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);

CREATE TABLE Satellite_Sport_Details (
    Satellite_Key SERIAL PRIMARY KEY,
    Sport_Key INT REFERENCES Hub_Sport(Sport_Key),
    Name VARCHAR(50) NOT NULL,
    Load_Date TIMESTAMP NOT NULL,
    Record_Source VARCHAR(50) NOT NULL
);
