CREATE DATABASE library CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE library;

CREATE TABLE `User` (
    `UserId` VARCHAR(8) PRIMARY KEY,
    `Email` VARCHAR(255) NOT NULL,
    `Name` VARCHAR(20) NOT NULL,
    `NickName` VARCHAR(25) NOT NULL,
    `Status` ENUM('pause', 'normal', 'pending') NOT NULL,
    CHECK (
        `UserId` REGEXP '^(1|3|4)([0-9][1-9]|[1-9][0-9])([0-9][0-9])(1|2|3)([0-9][1-9]|[1-9][0-9])$'
    ),
    CHECK (
        `Email` REGEXP '^([A-Za-z0-9._%+-]+)(@)([A-Za-z0-9.-]+)\.([A-Za-z]{2,})$'
    ),
    CHECK (
        `Name` REGEXP '^[A-Za-z一-龥·・\\\-()]+$'
    ),
    CHECK (
        `NickName` REGEXP '^[A-Za-z一-龥·・\\\-()]{5,25}$'
    ),
    CHECK (`Status` REGEXP 'pause|normal|pending')
);

CREATE TABLE `Admin` (
    `AdminId` VARCHAR(8) PRIMARY KEY,
    `Email` VARCHAR(255) NOT NULL,
    `NickName` VARCHAR(25) NOT NULL,
    CHECK (
        `AdminId` REGEXP '^(1|3|4)([0-9][1-9]|[1-9][0-9])([0-9][0-9])(1|2|3)([0-9][1-9]|[1-9][0-9])$'
    ),
    CHECK (
        `Email` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    CHECK (`NickName` REGEXP '^[A-Za-z一-龥·・\\\-()]{5,25}$')
);

CREATE TABLE `Book` (
    `ISBN` VARCHAR(13) PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Publisher` VARCHAR(255) NOT NULL,
    `ReleaseDate` DATE NOT NULL,
    `Amount` INT(11) UNSIGNED NOT NULL,
    `Maintainer` VARCHAR(8) NOT NULL,
    `Hash` VARCHAR(16) NOT NULL,
    UNIQUE (`ISBN`),
    UNIQUE (`Title`),
    UNIQUE (`Hash`),
    FOREIGN KEY (`Maintainer`) REFERENCES `Admin` (`AdminId`),
    CHECK (`Hash` REGEXP '^[A-Fa-f0-9]{16}$'),
    CHECK (
        `ISBN` REGEXP '^(978)(957|986|[0-9]{3})([0-9]{2,5})([0-9]{2,5})[0-9]$'
    ),
    CHECK (
        `Publisher` REGEXP '^[A-Za-z一-龥·・\\-() ]+$'
    )
);

CREATE TABLE `AccessCopy` (
    `CopyId` INT(13) UNSIGNED PRIMARY KEY,
    `ISBN` VARCHAR(13) NOT NULL,
    `Owner` VARCHAR(8) NOT NULL,
    `OpenDate` DATE NOT NULL,
    `RentDate` DATE NOT NULL,
    `ExpireDate` DATE NOT NULL,
    FOREIGN KEY (`Owner`) REFERENCES `User` (`UserId`),
    FOREIGN KEY (`ISBN`) REFERENCES `Book` (`ISBN`)
);

CREATE TABLE `Recipt` (
    `ReciptId` INT(10) UNSIGNED PRIMARY KEY,
    `BookTitle` VARCHAR(255) NOT NULL,
    `EstDate` DATE NOT NULL,
    `UserId` VARCHAR(11) NOT NULL,
    UNIQUE (`ReciptId`),
    FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
    FOREIGN KEY (`BookTitle`) REFERENCES `Book` (`Title`)
);

CREATE TABLE `Announcement` (
    `PostId` INT(10) UNSIGNED PRIMARY KEY,
    `Author` VARCHAR(8) NOT NULL,
    `Permission` ENUM('private', 'public') NOT NULL,
    `AnnounceDate` DATE NOT NULL,
    `Content` VARCHAR(1000),
    UNIQUE (`PostId`),
    FOREIGN KEY (`Author`) REFERENCES `Admin` (`AdminId`),
    CHECK (
        `Content` REGEXP '^[A-Za-z0-9一-龥!,.:;?—…─、。〈〉《》「」『』！（），．：；？＿～\\n ]*$'
    ),
    CHECK (`Permission` REGEXP 'private|public')
);

CREATE TABLE `Comment` (
    `Stars` INT(1) PRIMARY KEY,
    `UserId` VARCHAR(20) NOT NULL,
    `BookISBN` VARCHAR(13) NOT NULL,
    `RateDate` DATE NOT NULL,
    FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
    FOREIGN KEY (`BookISBN`) REFERENCES `Book` (`ISBN`),
    CHECK (CAST(`Stars` AS CHAR) REGEXP '[1-5]')
);