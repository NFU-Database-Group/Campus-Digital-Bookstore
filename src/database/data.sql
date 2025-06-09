-- users
INSERT INTO `users` (`UserId`, `Name`, `Email`) VALUES
(41143281, 'Alice', '41143281@nfu.edu.tw'),
(41143282, '陳小明', '41143282@nfu.edu.tw');

-- (12345678, 'Bob', '41143283@nfu.edu.tw') CONSTRAINT `CONSTRAINT_1` failed (UserId)
-- (41143284, '王大明@123', '41143284@nfu.edu.tw') CONSTRAINT `CONSTRAINT_2` failed (Name)
-- (41143285, '王大明', '41143284@npu.edu.tw') CONSTRAINT `CONSTRAINT_3` failed (Email)

-- admin
INSERT INTO `admin` (`Name`, `Email`) VALUES
('陳小明', '41143282@nfu.edu.tw');

-- (41143284, '王大明@123', '41143284@nfu.edu.tw') CONSTRAINT `CONSTRAINT_1` failed (Name)
-- (41143285, '王大明', '41143284@npu.edu.tw') CONSTRAINT `CONSTRAINT_2` failed (Email)

-- book
INSERT INTO `book` (`Category`, `Hash`, `ISBN`, `Amount`, `Publisher`, `ReleaseDate`) VALUES
('科學', '1234567890abcdef', '9781234567890', 5, '科學出版社', '2023-01-01'),
('文學', 'fedcba0987654321', '9791234567890', 3, '文學出版社', '2022-12-31');

-- ('科學', 'abca123764feab22', '1231231231231', 7, '科學出版社', '2022-09-09') CONSTRAINT `CONSTRAINT_3` failed (ISBN)

-- title
INSERT INTO `title` (`BookId`, `Language`, `TitleName`) VALUES
(1, 'zh', '科學探索'),
(1, 'en', 'Scientific Exploration'),
(2, 'zh', '文學之旅'),
(2, 'en', 'Literary Journey');

-- ('1', 'zh-TW', '科學探索') Too long (Language)
-- ('1', 'zh@', '科學探索') CONSTRAINT `CONSTRAINT_1` failed (Language)

-- copy
INSERT INTO `copy` (`OpenDate`, `ExpireDate`, `Owner`, `Title`) VALUES
('2025-06-04', '2025-06-18', 41143281, 1),
('2025-06-02', '2025-06-16', 41143282, 2);

-- ('2025-06-04', '2025-06-02', 41143281, 1) CONSTRAINT `CONSTRAINT_1` failed (OpenDate <= ExpireDate)

-- note
INSERT INTO `note` (`LineStart`, `LineEnd`, `Copy`) VALUES
(1.0, 2.0, 1),
(3.5, 4.5, 2);

-- (-1.0, 2.0, 2) CONSTRAINT `CONSTRAINT_1` failed (Copy)
-- (1.0, -2.0, 1) CONSTRAINT `CONSTRAINT_2` failed (LineStart < LineEnd)
