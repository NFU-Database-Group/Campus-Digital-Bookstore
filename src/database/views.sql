-- ===========================================
-- 建立帳號（如已建立則跳過）
-- ===========================================
CREATE USER IF NOT EXISTS 'student_user' @'localhost' IDENTIFIED BY 'test_student_0000';

CREATE USER IF NOT EXISTS 'admin_user' @'localhost' IDENTIFIED BY 'test_admin_0000';

-- ===========================================
-- 學生 view：僅能看到公開公告
-- ===========================================
CREATE OR REPLACE VIEW view_student_dashboard AS
SELECT
    u.UserId,
    u.Name AS UserName,
    u.NickName,
    u.Email,
    u.Status,
    ac.CopyId,
    ac.ISBN,
    b.Title AS BookTitle,
    b.Publisher,
    b.ReleaseDate,
    b.Amount,
    ac.OpenDate,
    ac.RentDate,
    ac.ExpireDate,
    r.ReciptId,
    r.EstDate,
    c.Stars AS CommentStars,
    c.RateDate,
    ann.PostId AS AnnouncementId,
    ann.AnnounceDate,
    ann.Content AS Announcement,
    ann.Permission AS AnnPermission
FROM
    `User` u
    LEFT JOIN AccessCopy ac ON u.UserId = ac.Owner
    LEFT JOIN Book b ON ac.ISBN = b.ISBN
    LEFT JOIN Recipt r ON u.UserId = r.UserId
    AND b.Title = r.BookTitle
    LEFT JOIN Comment c ON u.UserId = c.UserId
    AND ac.ISBN = c.BookISBN
    LEFT JOIN Announcement ann ON ann.Permission = 'public';

-- ===========================================
-- 管理員 view：可看到所有公告（含 private）
-- ===========================================
CREATE OR REPLACE VIEW view_admin_dashboard AS
SELECT
    u.UserId,
    u.Name AS UserName,
    u.NickName,
    u.Email,
    u.Status,
    ac.CopyId,
    ac.ISBN,
    b.Title AS BookTitle,
    b.Publisher,
    b.ReleaseDate,
    b.Amount,
    ac.OpenDate,
    ac.RentDate,
    ac.ExpireDate,
    r.ReciptId,
    r.EstDate,
    c.Stars AS CommentStars,
    c.RateDate,
    ann.PostId AS AnnouncementId,
    ann.AnnounceDate,
    ann.Content AS Announcement,
    ann.Permission AS AnnPermission
FROM
    `User` u
    LEFT JOIN AccessCopy ac ON u.UserId = ac.Owner
    LEFT JOIN Book b ON ac.ISBN = b.ISBN
    LEFT JOIN Recipt r ON u.UserId = r.UserId
    AND b.Title = r.BookTitle
    LEFT JOIN Comment c ON u.UserId = c.UserId
    AND ac.ISBN = c.BookISBN
    LEFT JOIN Announcement ann ON TRUE;

-- ===========================================
-- 常用分組（GROUP BY）及 HAVING 查詢 view
-- ===========================================
-- 每個學生借書數量
CREATE OR REPLACE VIEW view_user_borrow_count AS
SELECT
    u.UserId,
    u.Name,
    COUNT(ac.CopyId) AS BorrowCount
FROM
    `User` u
    LEFT JOIN AccessCopy ac ON u.UserId = ac.Owner
GROUP BY
    u.UserId,
    u.Name;

-- 借書超過2次的學生
CREATE OR REPLACE VIEW view_user_borrow_gt2 AS
SELECT
    u.UserId,
    u.Name,
    COUNT(ac.CopyId) AS BorrowCount
FROM
    `User` u
    LEFT JOIN AccessCopy ac ON u.UserId = ac.Owner
GROUP BY
    u.UserId,
    u.Name
HAVING
    COUNT(ac.CopyId) > 2;

-- 每本書被借閱次數
CREATE OR REPLACE VIEW view_book_borrow_count AS
SELECT
    b.Title,
    COUNT(ac.CopyId) AS BorrowCount
FROM
    Book b
    LEFT JOIN AccessCopy ac ON b.ISBN = ac.ISBN
GROUP BY
    b.Title;

-- 每位管理員管理書籍數量
CREATE OR REPLACE VIEW view_admin_book_count AS
SELECT
    a.AdminId,
    a.NickName,
    COUNT(b.ISBN) AS BookCount
FROM
    Admin a
    LEFT JOIN Book b ON a.AdminId = b.Maintainer
GROUP BY
    a.AdminId,
    a.NickName;

-- 每本書的平均評分
CREATE OR REPLACE VIEW view_book_avg_rating AS
SELECT
    b.Title,
    AVG (c.Stars) AS AvgRating,
    COUNT(c.Stars) AS RatingCount
FROM
    Book b
    JOIN Comment c ON b.ISBN = c.BookISBN
GROUP BY
    b.Title
HAVING
    COUNT(c.Stars) > 0;

-- ===========================================
-- 權限設定（學生、管理員只可查各自的 view）
-- ===========================================
GRANT
SELECT
    ON library.view_student_dashboard TO 'student_user' @'localhost';

GRANT
SELECT
    ON library.view_admin_dashboard TO 'admin_user' @'localhost';

GRANT
SELECT
    ON library.view_user_borrow_count TO 'student_user' @'localhost',
    'admin_user' @'localhost';

GRANT
SELECT
    ON library.view_user_borrow_gt2 TO 'student_user' @'localhost',
    'admin_user' @'localhost';

GRANT
SELECT
    ON library.view_book_borrow_count TO 'student_user' @'localhost',
    'admin_user' @'localhost';

GRANT
SELECT
    ON library.view_admin_book_count TO 'student_user' @'localhost',
    'admin_user' @'localhost';

GRANT
SELECT
    ON library.view_book_avg_rating TO 'student_user' @'localhost',
    'admin_user' @'localhost';

FLUSH PRIVILEGES;
