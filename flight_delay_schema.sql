CREATE TABLE Flights (
    DAY_OF_MONTH int,
    DAY_OF_WEEK int,
    OP_UNIQUE_CARRIER varchar,
    OP_CARRIER_AIRLINE_ID int,
    OP_CARRIER varchar,
    TAIL_NUM varchar,
    OP_CARRIER_FL_NUM int,
    ORIGIN_AIRPORT_ID int,
    ORIGIN_AIRPORT_SEQ_ID int,
    ORIGIN varchar,
    DEST_AIRPORT_ID int,
    DEST_AIRPORT_SEQ_ID int,
    DEST varchar,
    DEP_TIME float,
    DEP_DEL15 float,
    DEP_TIME_BLK varchar,
    ARR_TIME float,
    ARR_DEL15 float,
    CANCELLED float,
    DIVERTED float,
    DISTANCE float
);

CREATE TABLE Arrival_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
);

CREATE TABLE Departure_Airports (
    airport varchar PRIMARY KEY,
    airport_name varchar
);

CREATE TABLE Airlines (
    carrier varchar PRIMARY KEY,
    carrier_name varchar
);

ALTER TABLE Flights
ADD FOREIGN KEY (DEST) REFERENCES Arrival_Airports(airport);

ALTER TABLE Flights
ADD FOREIGN KEY (ORIGIN) REFERENCES Departure_Airports(airport);

ALTER TABLE Flights
ADD FOREIGN KEY (OP_UNIQUE_CARRIER) REFERENCES Airlines(carrier);

