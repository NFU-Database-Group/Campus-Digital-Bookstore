-- User
INSERT INTO
    `User` (`UserId`, `Name`, `Email`, `NickName`, `Status`)
VALUES
    (41143181, 'Alice', '41143281@nfu.edu.tw', 'BlackGhost', 'normal'),
    (31143282, '藍小明', 'joemama@yahoo.net', 'YAAAATAIOOO', 'pause'),
    (11143382, '黃柏蒜', 'mango+123@gmail.com', 'MangoKing', 'pending');
-- (12345678, 'Bob', '41143283@nfu.edu.tw', 'aaa', 'normal') CONSTRAINT `CONSTRAINT_1` failed (UserId)
-- (41143284, '王大明@123', '41143284@nfu.edu.tw', 'bbb', 'normal') CONSTRAINT `CONSTRAINT_2` failed (Name)
-- (41143285, '王大明', '41143284@npu.edu.tw', 'ccc', 'normal') CONSTRAINT `CONSTRAINT_3` failed (Email)

-- Admin
INSERT INTO
    `Admin` (`AdminId`, `Email`, `NickName`)
VALUES
    ('11143382', '41143282@nfu.edu.tw', '超級管理員');
-- (41143284, '41143284@nfu.edu.tw', '王大明@123') CONSTRAINT `CONSTRAINT_1` failed (Name)
-- (41143285, '41143284@npu.edu.tw', '王大明') CONSTRAINT `CONSTRAINT_2` failed (Email)

-- Book
INSERT INTO
    `Book` (`ISBN`, `Title`, `Publisher`, `ReleaseDate`, `Amount`, `Maintainer`, `Hash`)
VALUES
    ('9789573255087', '資料結構與演算法設計', '旗標', '2019-08-15', 5, 11143382, 'A1B2C3D4E5F6A7B8'),
    ('9789863123417', '資料庫系統概論', '高立', '2020-03-10', 3, 11143382, 'B2C3D4E5F6A7B8C9'),
    ('9789574836514', '現代作業系統', '東華', '2018-11-20', 4, 11143382, 'C3D4E5F6A7B8C9D0'),
    ('9789866735831', '人工智慧導論', '深智數位', '2021-06-01', 2, 11143382, 'D4E5F6A7B8C9D0E1'),
    ('9789575032051', '程式設計入門', '碁峰', '2017-01-05', 7, 11143382, 'E5F6A7B8C9D0E1F2');
-- ('9789573255', '資料結構與演算法設計', '旗標', '2019-08-15', 5, 11143382, 'A1B2C3D4E5F6A7B8') CONSTRAINT `CONSTRAINT_2` failed (ISBN)
-- ('9789574836514', '現代作業系統', '東華@?!', '2018-11-20', 4, 11143382, 'C3D4E5F6A7B8C9D0') CONSTRAINT `CONSTRAINT_3` failed (Publisher)

-- AccessCopy
INSERT INTO
    `AccessCopy` (`CopyId`, `ISBN`, `Owner`, `OpenDate`, `RentDate`, `ExpireDate`)
VALUES
    (1, '9789573255087', 41143181, '2024-06-01', '2024-06-01', '2024-06-14'),
    (2, '9789863123417', 41143181, '2024-06-02', '2024-06-02', '2024-06-16'),
    (3, '9789574836514', 41143181, '2024-06-03', '2024-06-03', '2024-06-10'),
    (4, '9789866735831', 41143181, '2024-06-04', '2024-06-04', '2024-06-18'),
    (5, '9789575032051', 41143181, '2024-06-05', '2024-06-05', '2024-06-19');
-- (6, '9789573255087', 31143282, '2024-06-06', '2024-06-06', '2024-06-20') CONSTRAINT `CONSTRAINT_1` failed (Owner)

-- Recipt
INSERT INTO
    `Recipt` (`ReciptId`, `BookTitle`, `EstDate`, `UserId`)
VALUES
    (1, '資料結構與演算法設計', '2024-06-15', 41143181),
    (2, '資料庫系統概論', '2024-06-16', 41143181),
    (3, '現代作業系統', '2024-06-17', 41143181),
    (4, '人工智慧導論', '2024-06-18', 41143181),
    (5, '程式設計入門', '2024-06-19', 41143181);
-- (6, '資料結構與演算法設計', '2024-06-20', 31143282) CONSTRAINT `CONSTRAINT_1` failed (UserId)

-- Announcement
INSERT INTO
    `Announcement` (`PostId`, `Author`, `Permission`, `AnnounceDate`, `Content`)
VALUES
    (1, '11143382', 'public', '2024-06-10', '歡迎來到校園數位書城！新書上架，敬請期待。'),
    (2, '11143382', 'private', '2024-06-12', '系統維護通知：6月15日凌晨將進行系統維護，請提前完成操作。'),
    (3, '11143382', 'public', '2024-06-13', '暑期活動開跑！參加活動有機會獲得精美禮品，詳情請見網站公告。');
-- (4, '11143382', 'private', '2024-06-14', '重要通知：請所有使用者更新個人資料，以便於後續聯絡ΦΧΨΩαβγδε') CONSTRAINT `CONSTRAINT_1` failed (Content)

-- Comment
INSERT INTO
    `Comment` (`Stars`, `UserId`, `BookISBN`, `RateDate`)
VALUES
    (5, 41143181, '9789573255087', '2024-06-15'),
    (4, 31143282, '9789863123417', '2024-06-16'),
    (3, 11143382, '9789574836514', '2024-06-17'),
    (2, 41143181, '9789866735831', '2024-06-18');
-- (6, 41143181, '9789575032051', '2024-06-19') CONSTRAINT `CONSTRAINT_1` failed (Stars)
