CREATE TABLE "Dim_Custumer" (
    CustomerID integer PRIMARY KEY,
    CustomerName varchar(100),
    Phone varchar(15),
    Address varchar(200),
    Email varchar(100)
);
CREATE TABLE DimLocationCustomer (
    "LocationID" integer PRIMARY KEY,
    "Name" varchar(100),
    "County" varchar(100),
    "StateCode" varchar(2),
    "State" varchar(100),
    "Type" varchar(50),
    "Latitude" numeric,
    "Longitude" numeric,
    "AreaCode" varchar(10),
    "Population" integer,
    "Households" integer,
    "MedianIncome" numeric,
    "LandArea" numeric,
    "WaterArea" numeric,
    "TimeZone" varchar(50)
);

CREATE TABLE DimProduct (
    "ProductID" PRIMARY KEY,
    "ProductName" varchar(100),
    "ProductFamily ID" integer,
    Cost numeric,
    "OriginalSalePrice" numeric
);


CREATE TABLE FacTSales (
    "OrderID" serial PRIMARY KEY,
    "ProductID" integer,
    "LocationID" integer,
    "CustomerID" integer,
    "PurchaseDate" date,
    "DeliveryDate" date,
    Discount numeric
);
-- Crear la tabla "Dim_Custumer"
CREATE TABLE "Dim_Custumer" (
    CustomerID integer PRIMARY KEY,
    CustomerName varchar(100),
    Phone varchar(15),
    Address varchar(200),
    Email varchar(100)
);

-- Crear la tabla "DimLocationCustomer"
CREATE TABLE DimLocationCustomer (
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

-- Crear la tabla "DimProduct"
CREATE TABLE DimProduct (
    ProductID integer PRIMARY KEY,
    ProductName varchar(100),
    "ProductFamily ID" integer,
    Cost numeric,
    OriginalSalePrice numeric
);

-- Crear la tabla "FacTSales" con sus claves foráneas
CREATE TABLE FacTSales (
    OrderID serial PRIMARY KEY,
    ProductID integer,
    LocationID integer,
    CustomerID integer,
    PurchaseDate date,
    DeliveryDate date,
    Discount numeric,
    FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
    FOREIGN KEY (LocationID) REFERENCES DimLocationCustomer (LocationID),
    FOREIGN KEY (CustomerID) REFERENCES "Dim_Custumer" (CustomerID)
);
