CREATE DATABASE bookscatalog;
USE bookscatalog;

CREATE TABLE Authors (
    Id int NOT NULL AUTO_INCREMENT,
    FirstName varchar(20) NULL,
    LastName varchar(20) NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Categories (
    Id int NOT NULL AUTO_INCREMENT,
    Name varchar(30) NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Locations (
    Id int NOT NULL AUTO_INCREMENT,
    Name varchar(30) NULL,
    Country varchar(20) NULL,
    City varchar(20) NULL,
    Address varchar(60) NULL,
    Phone varchar(20) NULL,
    Email varchar(40) NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Books (
    Id int NOT NULL AUTO_INCREMENT,
    Name varchar(30) NULL,
    ImageUrl varchar(500) NULL,
    Description varchar(500) NULL,
    PublishDate datetime NOT NULL,
    AuthorId int NULL,
    PRIMARY KEY (Id),
    CONSTRAINT FK_Books_Authors_AuthorId FOREIGN KEY (AuthorId) REFERENCES Authors (Id) ON DELETE RESTRICT
);

CREATE TABLE BookCategories (
    Id int NOT NULL AUTO_INCREMENT,
    BookId int NULL,
    CategoryId int NULL,
    PRIMARY KEY (Id),
    CONSTRAINT FK_BookCategories_Books_BookId FOREIGN KEY (BookId) REFERENCES Books (Id) ON DELETE RESTRICT,
    CONSTRAINT FK_BookCategories_Categories_CategoryId FOREIGN KEY (CategoryId) REFERENCES Categories (Id) ON DELETE RESTRICT
);

CREATE TABLE LocationBooks (
    Id int NOT NULL AUTO_INCREMENT,
    BookId int NULL,
    LocationId int NULL,
    PRIMARY KEY (Id),
    CONSTRAINT FK_LocationBooks_Books_BookId FOREIGN KEY (BookId) REFERENCES Books (Id) ON DELETE RESTRICT,
    CONSTRAINT FK_LocationBooks_Locations_LocationId FOREIGN KEY (LocationId) REFERENCES Locations (Id) ON DELETE RESTRICT
);

CREATE INDEX IX_BookCategories_BookId ON BookCategories (BookId);

CREATE INDEX IX_BookCategories_CategoryId ON BookCategories (CategoryId);

CREATE INDEX IX_Books_AuthorId ON Books (AuthorId);

CREATE INDEX IX_LocationBooks_BookId ON LocationBooks (BookId);

CREATE INDEX IX_LocationBooks_LocationId ON LocationBooks (LocationId);