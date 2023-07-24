-- Tabla DimProfession
CREATE TABLE DimProfession (
    ProfessionID integer PRIMARY KEY,
    Name varchar(100)
);

-- Tabla DimLocationEvent
CREATE TABLE DimLocation (
    LocationID integer PRIMARY KEY,
    Name varchar(100),
    County varchar(100),
    StateCode varchar(2),
    State varchar(100),
    Type varchar(50),
    Latitude numeric,
    Longitude numeric,
    AreaCode varchar(10),
    Population integer,
    Households integer,
    MedianIncome numeric,
    LandArea numeric,
    WaterArea numeric,
    TimeZone varchar(50)
);


-- Tabla DimCompany
CREATE TABLE DimCompany (
    CompanyID integer PRIMARY KEY,
    Name varchar(100),
    LocalizationID integer REFERENCES DimLocation(LocationID)
);

-- Tabla DimUsers
CREATE TABLE DimUsers (
    UserID integer PRIMARY KEY,
    CustomerName varchar(100),
    Phone varchar(15),
    Address varchar(200),
    Email varchar(100),
    Age integer,
    Sex varchar(10),
    ProfessionID integer REFERENCES DimProfession(ProfessionID),
    CompanyID integer REFERENCES DimCompany(CompanyID)
);




-- Tabla DimDevice
CREATE TABLE DimDevice (
    DeviceID integer PRIMARY KEY,
    DeviceType varchar(50),
    Brand varchar(100),
    Model varchar(100),
    OperatingSystem varchar(100),
    ReleaseYear integer,
    OtherDetails text
);

-- Tabla DimTypeEvent
CREATE TABLE DimTypeEvent (
    TypeID serial PRIMARY KEY,
    EventType varchar(100),
    EventDescription text,
    EventCategory varchar(50),
    EventIconUrl varchar(200),
    IsInteractive boolean,
    HasAnimation boolean,
    OtherAttributes jsonb
);


-- Tabla FactEvents
CREATE TABLE FactEvents (
    EventID serial PRIMARY KEY,
    UserID integer REFERENCES DimUsers(UserID),
    TypeID integer REFERENCES DimTypeEvent(TypeID),
    DateEvent date,
    LocationEventID integer REFERENCES DimLocation(LocationID),
    DeviceID integer REFERENCES DimDevice(DeviceID)
);