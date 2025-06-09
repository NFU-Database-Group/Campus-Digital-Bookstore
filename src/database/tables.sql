CREATE DATABASE library;

USE library;

CREATE TABLE `User` (
    `UserId` INT(8) UNSIGNED PRIMARY KEY,
    `Email` VARCHAR(255) NOT NULL,
    `Name` VARCHAR(20) NOT NULL,
    `NickName` VARCHAR(25) NOT NULL,
    `Status` ENUM('pause', 'normal', 'pending') NOT NULL,
    CHECK (
        CAST(`UserId` AS CHAR) REGEXP '^(1|3|4)([0-9][1-9]|[1-9][0-9])(\d{2})(1|2|3)([0-9][1-9]|[1-9][0-9])$'
    ),
    CHECK (
        `Email` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    CHECK (
        `Name` REGEXP '^[A-Za-z\u4e00-\u9fa5·・\\-()]{1,20}$'
    ),
    CHECK (`NickName` REGEXP '^[A-Za-z0-9]{5,25}$'),
    CHECK (`Status` REGEXP 'pause|normal|pending')
);

CREATE TABLE `Admin` (
    `AdminId` INT(8) UNSIGNED PRIMARY KEY,
    `Email` VARCHAR(255) NOT NULL,
    `NickName` VARCHAR(25) NOT NULL,
    CHECK (
        CAST(`AdminId` AS CHAR) REGEXP '^(1|3|4)([0-9][1-9]|[1-9][0-9])(\d{2})(1|2|3)([0-9][1-9]|[1-9][0-9])$'
    ),
    CHECK (
        `Email` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
    ),
    CHECK (`NickName` REGEXP '^[A-Za-z0-9]{5,25}$')
);

CREATE TABLE `Book` (
    `ISBN` VARCHAR(13) PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Publisher` VARCHAR(255) NOT NULL,
    `ReleaseDate` DATE NOT NULL,
    `Amount` INT(11) UNSIGNED NOT NULL,
    `Maintainer` INT(8) UNSIGNED,
    `Hash` VARCHAR(16) NOT NULL,
    UNIQUE (`ISBN`),
    UNIQUE (`Title`),
    UNIQUE (`Hash`),
    FOREIGN KEY (`Maintainer`) REFERENCES `Admin` (`AdminId`),
    CHECK (`Hash` REGEXP '^[A-Fa-f0-9]{16}$'),
    CHECK (
        CAST(`ISBN` AS CHAR) REGEXP '^(978)(957|986|[0-9]{3})([0-9]{2,5})([0-9]{2,5})[0-9]$'
    ),
    CHECK (
        `Publisher` REGEXP '^[A-Za-z\u4e00-\u9fa5·・\\-() ]+$'
    )
);

CREATE TABLE `AccessCopy` (
    `CopyId` INT(11) UNSIGNED PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Owner` INT(8) UNSIGNED NOT NULL,
    `OpenDate` DATE NOT NULL,
    `RentDate` DATE NOT NULL,
    `ExpireDate` DATE NOT NULL,
    FOREIGN KEY (`Owner`) REFERENCES `User` (`UserId`),
    FOREIGN KEY (`Title`) REFERENCES `Book` (`Title`)
);

CREATE TABLE `Recipt` (
    `ReciptId` INT(11) UNSIGNED PRIMARY KEY,
    `BookTitle` VARCHAR(255) NOT NULL,
    `EstDate` DATE NOT NULL,
    `UserId` INT(11) UNSIGNED NOT NULL,
    UNIQUE (`ReciptId`),
    FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`),
    FOREIGN KEY (`BookTitle`) REFERENCES `Book` (`Title`)
);

CREATE TABLE `Announcement` (
    `PostId` INT(11) UNSIGNED PRIMARY KEY,
    `Author` INT(8) UNSIGNED NOT NULL,
    `Permission` ENUM('private', 'public') NOT NULL,
    `AnnounceDate` DATE NOT NULL,
    `Content` VARCHAR(1000),
    UNIQUE (`PostId`),
    FOREIGN KEY (`Author`) REFERENCES `Admin` (`AdminId`),
    CHECK (
        `Content` REGEXP '^[A-Za-z0-9\u4e00-\u9fa5!,.:;?—…─、。〈〉《》「」『』！（），．：；？＿～ ]*$'
    ),
    CHECK (`Permission` REGEXP 'private|public')
);

CREATE TABLE `Comment` (
    `Stars` INT(1) PRIMARY KEY,
    `UserName` INT(11) UNSIGNED NOT NULL,
    `RateDate` INT(8) UNSIGNED NOT NULL,
    FOREIGN KEY (`UserName`) REFERENCES `User` (`UserId`),
    CHECK (CAST(`Stars` AS CHAR) REGEXP '[1-5]')
);