CREATE DATABASE cdb_db; -- cdb for campus digital bookstore
 
USE cdb_db;

CREATE TABLE users (
    `UserId` INT PRIMARY KEY,
    `Name` VARCHAR(20) NOT NULL UNIQUE,
    `Email` VARCHAR(255) NOT NULL UNIQUE,
    CHECK (CAST(`UserId` AS CHAR) REGEXP '[4-5]([0-9][1-9]|[1-9][0-9])4[0-9][0-3]([0-9][1-9]|[1-9][0-9])'),
    CHECK (`Name` REGEXP '^[A-Za-z一-龥·・\\-()]+$'),
    CHECK (`Email` REGEXP '[0-9a-zA-Z].+\@nfu\.edu\.tw')
);

CREATE TABLE `admin` (
    `AdminId` INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(20) NOT NULL UNIQUE,
    `Email` VARCHAR(255) NOT NULL UNIQUE,
    CHECK (`Name` REGEXP '^[A-Za-z一-龥·・\\-()]+$'),
    CHECK (`Email` REGEXP '[0-9a-zA-Z].+\@nfu\.edu\.tw')
);

CREATE TABLE `book` (
    `BookId` INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Category` VARCHAR(255) NOT NULL,
    `Hash` VARCHAR(16) NOT NULL,
    `ISBN` VARCHAR(13) NOT NULL,
    `Amount` INT(11) UNSIGNED NOT NULL,
    `Publisher` VARCHAR(255) NOT NULL,
    `ReleaseDate` DATE NOT NULL,
    UNIQUE (`Hash`),
    UNIQUE (`ISBN`),
    CHECK (`Category` REGEXP '^[A-Za-z一-龥·・\\-()]+$'),
    CHECK (`Hash` REGEXP '^[A-Fa-f0-9]{16}$'),
    CHECK (`ISBN` REGEXP '^(978|979)[0-9]{10}$'),
    CHECK (`Publisher` REGEXP '^[A-Za-z一-龥·・\\-()]+$')
);

CREATE TABLE `title` (
    `TitleId` INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `BookId` INT(11) UNSIGNED NOT NULL,
    `Language` VARCHAR(3) NOT NULL,
    `TitleName` VARCHAR(255) NOT NULL,
    FOREIGN KEY (`BookId`) REFERENCES `book`(`BookId`) ON DELETE CASCADE,
    CHECK (`Language` REGEXP '^[A-Za-z][a-z]{1,2}$')
);

CREATE TABLE `copy` (
    `CopyId` INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `OpenDate` DATE NOT NULL,
    `ExpireDate` DATE NOT NULL,
    `Owner` INT NOT NULL,
    `Title` INT(11) UNSIGNED NOT NULL,
    FOREIGN KEY (`Owner`) REFERENCES `users`(`UserId`) ON DELETE CASCADE,
    FOREIGN KEY (`Title`) REFERENCES `title`(`TitleId`) ON DELETE CASCADE,
    CHECK (`OpenDate` <= `ExpireDate`)
);

CREATE TABLE `note` (
    `NoteId` INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `LineStart` DECIMAL(5,2) NOT NULL,
    `LineEnd` DECIMAL(5,2) NOT NULL,
    `Copy` INT(11) UNSIGNED NOT NULL,
    FOREIGN KEY (`Copy`) REFERENCES `copy`(`CopyId`) ON DELETE CASCADE,
    CHECK (`LineStart` >= 0 AND `LineStart` <= 300.00),
    CHECK (`LineEnd` >= 0 AND `LineEnd` <= 300.00)
);
