Source Tables:
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(20),
    ZipCode VARCHAR(10)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(100),
    Manager VARCHAR(50)
);



CREATE TABLE Src_Time (
    TimeID INT PRIMARY KEY,
    Date_Time DATE,
    Month INT,
    Quarter INT,
    Year INT
);

DWH (Core) Tables:

-- Create Fact Sales Table
CREATE TABLE FactSales (
    SaleID INT PRIMARY KEY,
    CustomerSurrogateKey INT,
    ProductSurrogateKey INT,
    StoreSurrogateKey INT,
    TimeSurrogateKey INT,
    SaleAmount NUMBER(10, 2),
    LastModified TIMESTAMP,
    FOREIGN KEY (CustomerSurrogateKey) REFERENCES DimCustomers(SurrogateKey),
    FOREIGN KEY (ProductSurrogateKey) REFERENCES DimProducts(SurrogateKey),
    FOREIGN KEY (StoreSurrogateKey) REFERENCES DimStores(SurrogateKey),
    FOREIGN KEY (TimeSurrogateKey) REFERENCES DimTime(SurrogateKey)
);



CREATE TABLE DimCustomers (
    SurrogateKey INT PRIMARY KEY,
    CustomerID INT,
    FirstName VARCHAR2(50),
    LastName VARCHAR2(50),
    Email VARCHAR2(100),
    Phone VARCHAR2(20),
    Address VARCHAR2(200),
    City VARCHAR2(50),
    State VARCHAR2(20),
    ZipCode VARCHAR2(10),
    StartDate DATE,
    EndDate DATE,
    chge_current_ind CHAR(1),
    LastModified TIMESTAMP
);


CREATE TABLE DimProducts (
    SurrogateKey INT PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR2(100),
    Category VARCHAR2(50),
    Price NUMBER(10, 2),
    StartDate DATE,
    EndDate DATE,
    chge_current_ind CHAR(1),
    LastModified TIMESTAMP
);

CREATE TABLE DimStores (
    SurrogateKey INT PRIMARY KEY,
    StoreID INT,
    StoreName VARCHAR2(100),
    Location VARCHAR2(100),
    Manager VARCHAR2(50),
    StartDate DATE,
    EndDate DATE,
    chge_current_ind CHAR(1),
    LastModified TIMESTAMP
);


CREATE TABLE DimTime (
    SurrogateKey INT PRIMARY KEY,
    TimeID INT,
    Date_Time DATE,
    Month INT,
    Quarter INT,
    Year INT,
    StartDate DATE,
    EndDate DATE,
    chge_current_ind CHAR(1),
    LastModified TIMESTAMP
);
