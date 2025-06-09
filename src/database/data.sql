INSERT INTO
    `User` (`UserId`, `Name`, `Email`, `NickName`, `Status`)
VALUES
    (
        41143181,
        'Alice',
        '41143281@nfu.edu.tw',
        'BlackGhost',
        'normal'
    ),
    (
        31143282,
        '藍小明',
        'joemama@yahoo.net',
        'YAAAATAIOOO',
        'pause'
    ),
    (
        11143382,
        '黃柏蒜',
        'mango+123@gmail.com',
        'Mango123',
        'pending'
    );

-- (12345678, 'Bob', '41143283@nfu.edu.tw') CONSTRAINT `CONSTRAINT_1` failed (UserId)
-- (41143284, '王大明@123', '41143284@nfu.edu.tw') CONSTRAINT `CONSTRAINT_2` failed (Name)
-- (41143285, '王大明', '41143284@npu.edu.tw') CONSTRAINT `CONSTRAINT_3` failed (Email)
INSERT INTO
    `Admin` (`AdminId`, `Email`, `NickName`)
VALUES
    (1, '41143282@nfu.edu.tw', '超級管理員');

-- (41143284, '王大明@123', '41143284@nfu.edu.tw') CONSTRAINT `CONSTRAINT_1` failed (Name)
-- (41143285, '王大明', '41143284@npu.edu.tw') CONSTRAINT `CONSTRAINT_2` failed (Email)
INSERT INTO
    `Book` (
        `ISBN`,
        `Title`,
        `Publisher`,
        `ReleaseDate`,
        `Amount`,
        `Maintainer`,
        `Hash`
    )
VALUES
    (
        '9789573255087',
        '資料結構與演算法設計',
        '旗標',
        '2019-08-15',
        5,
        1,
        'A1B2C3D4E5F6A7B8'
    ),
    (
        '9789863123417',
        '資料庫系統概論',
        '高立',
        '2020-03-10',
        3,
        1,
        'B2C3D4E5F6A7B8C9'
    ),
    (
        '9789574836514',
        '現代作業系統',
        '東華',
        '2018-11-20',
        4,
        1,
        'C3D4E5F6A7B8C9D0'
    ),
    (
        '9789866735831',
        '人工智慧導論',
        '深智數位',
        '2021-06-01',
        2,
        1,
        'D4E5F6A7B8C9D0E1'
    ),
    (
        '9789575032051',
        '程式設計入門',
        '碁峰',
        '2017-01-05',
        7,
        1,
        'E5F6A7B8C9D0E1F2'
    );

-- ('科學', 'abca123764feab22', '1231231231231', 7, '科學出版社', '2022-09-09') CONSTRAINT `CONSTRAINT_3` failed (ISBN)
-- ('1', 'zh-TW', '科學探索') Too long (Language)
-- ('1', 'zh@', '科學探索') CONSTRAINT `CONSTRAINT_1` failed (Language)
INSERT INTO
    `AccessCopy` (
        `CopyId`,
        `ISBN`,
        `Owner`,
        `OpenDate`,
        `RentDate`,
        `ExpireDate`
    )
VALUES
    (
        1,
        '9789573255087',
        1001,
        '2024-06-01',
        '2024-06-01',
        '2024-06-14'
    ),
    (
        2,
        '9789863123417',
        1002,
        '2024-06-02',
        '2024-06-02',
        '2024-06-16'
    ),
    (
        3,
        '9789574836514',
        1003,
        '2024-06-03',
        '2024-06-03',
        '2024-06-10'
    ),
    (
        4,
        '9789866735831',
        1004,
        '2024-06-04',
        '2024-06-04',
        '2024-06-18'
    ),
    (
        5,
        '9789575032051',
        1005,
        '2024-06-05',
        '2024-06-05',
        '2024-06-19'
    );

-- ('2025-06-04', '2025-06-02', 41143281, 1) CONSTRAINT `CONSTRAINT_1` failed (OpenDate <= ExpireDate)
