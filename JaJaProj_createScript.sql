-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-29 17:44:54.509

-- tables
-- Table: Categories
CREATE TABLE Categories (
    catID int NOT NULL AUTO_INCREMENT,
    catName varchar(255) NOT NULL,
    catDescription int NULL,
    CONSTRAINT Categories_pk PRIMARY KEY (catID)
);

-- Table: Comments
CREATE TABLE Comments (
    commentID int NOT NULL AUTO_INCREMENT,
    userID int NOT NULL DEFAULT 0,
    productID int NOT NULL,
    timestamp datetime NOT NULL,
    comment varchar(255) NOT NULL,
    CONSTRAINT Comments_pk PRIMARY KEY (commentID)
);

-- Table: Product_Subcategories
CREATE TABLE Product_Subcategories (
    Subcategories_subcatID int NOT NULL,
    Products_productID int NOT NULL,
    CONSTRAINT Product_Subcategories_pk PRIMARY KEY (Subcategories_subcatID,Products_productID)
);

-- Table: Products
CREATE TABLE Products (
    productID int NOT NULL AUTO_INCREMENT,
    productName varchar(255) NOT NULL,
    productDescription varchar(255) NOT NULL,
    inStock int NOT NULL DEFAULT 1,
    createdDate datetime NULL,
    lastEdited datetime NULL,
    CONSTRAINT productID PRIMARY KEY (productID)
);

-- Table: Purchase_details
CREATE TABLE Purchase_details (
    purchaseID int NOT NULL,
    productID int NOT NULL,
    qty int NOT NULL,
    price decimal(30,30) NOT NULL,
    discount decimal(30,30) NOT NULL,
    CONSTRAINT Purchase_details_pk PRIMARY KEY (purchaseID,productID)
);

-- Table: Purchases
CREATE TABLE Purchases (
    purchaseID int NOT NULL AUTO_INCREMENT,
    date datetime NOT NULL,
    userID int NOT NULL,
    CONSTRAINT Purchases_pk PRIMARY KEY (purchaseID)
);

-- Table: Subcategories
CREATE TABLE Subcategories (
    subcatID int NOT NULL AUTO_INCREMENT,
    subcatName varchar(255) NOT NULL,
    catID int NOT NULL,
    CONSTRAINT subcatID PRIMARY KEY (subcatID)
);

-- Table: User
CREATE TABLE User (
    userID int NOT NULL AUTO_INCREMENT,
    firstName varchar(255) NOT NULL,
    middleName varchar(255) NOT NULL,
    lastName varchar(255) NOT NULL,
    addressLine1 varchar(255) NOT NULL,
    addressLine2 varchar(255) NOT NULL,
    addressLine3 varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    salt varchar(255) NOT NULL,
    dateOfBirth date NOT NULL,
    mobileNo varchar(255) NOT NULL,
    homeNo varchar(255) NOT NULL,
    createdDate datetime NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (userID)
);

-- foreign keys
-- Reference: Comments_Products (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Comments_Products FOREIGN KEY Comments_Products (productID)
    REFERENCES Products (productID);

-- Reference: Comments_User (table: Comments)
ALTER TABLE Comments ADD CONSTRAINT Comments_User FOREIGN KEY Comments_User (userID)
    REFERENCES User (userID);

-- Reference: Purchase_details_Products (table: Purchase_details)
ALTER TABLE Purchase_details ADD CONSTRAINT Purchase_details_Products FOREIGN KEY Purchase_details_Products (productID)
    REFERENCES Products (productID);

-- Reference: Purchase_details_Purchases (table: Purchase_details)
ALTER TABLE Purchase_details ADD CONSTRAINT Purchase_details_Purchases FOREIGN KEY Purchase_details_Purchases (purchaseID)
    REFERENCES Purchases (purchaseID);

-- Reference: Purchases_User (table: Purchases)
ALTER TABLE Purchases ADD CONSTRAINT Purchases_User FOREIGN KEY Purchases_User (userID)
    REFERENCES User (userID);

-- Reference: Subcategories_Categories (table: Subcategories)
ALTER TABLE Subcategories ADD CONSTRAINT Subcategories_Categories FOREIGN KEY Subcategories_Categories (catID)
    REFERENCES Categories (catID);

-- Reference: Table_7_Products (table: Product_Subcategories)
ALTER TABLE Product_Subcategories ADD CONSTRAINT Table_7_Products FOREIGN KEY Table_7_Products (Products_productID)
    REFERENCES Products (productID);

-- Reference: Table_7_Subcategories (table: Product_Subcategories)
ALTER TABLE Product_Subcategories ADD CONSTRAINT Table_7_Subcategories FOREIGN KEY Table_7_Subcategories (Subcategories_subcatID)
    REFERENCES Subcategories (subcatID);

-- End of file.

