-- users
INSERT INTO users (Name, Email) VALUES
('alice', 'alice@example.com'),
('bob', 'bob@example.com'),
('charlie', 'charlie@example.com');

-- admin
INSERT INTO admin (Name, Email) VALUES
('admin1', 'admin1@cdb.com'),
('admin2', 'admin2@cdb.com');

-- book
INSERT INTO book (Category, Hash, ISBN, Amount, Publisher, ReleaseDate) VALUES
('Computer Science', 'HASH1234567890AB', '9781234567890', 10, 'TechBooks', '2022-01-15'),
('Literature', 'HASH0987654321CD', '9780987654321', 5, 'LitPress', '2021-09-10');

-- title
INSERT INTO title (BookId, Language) VALUES
(1, 'eng'),
(1, 'zho'),
(2, 'eng');

-- copy
INSERT INTO copy (Hash, OpenDate, ExpireDate, UserId) VALUES
('HASH1234567890AB', '2024-01-01', '2025-01-01', 1),
('HASH0987654321CD', '2024-02-01', '2025-02-01', 2);