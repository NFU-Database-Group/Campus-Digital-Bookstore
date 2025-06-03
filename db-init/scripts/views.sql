CREATE VIEW student_view AS
SELECT
    u.UserId,
    u.Name AS UserName,
    u.Email AS UserEmail,
    a.CopyId,
    a.OpenDate,
    a.ExpireDate,
    a.Owner,
    b.BookId,
    t.TitleName AS BookTitle,
    b.Category,
    b.Publisher,
    b.ReleaseDate,
    m.LineStart AS Start,
    m.LineEnd AS End
FROM
    users u
    LEFT JOIN copy a ON u.UserId = a.Owner
    LEFT JOIN book b ON a.Title = b.BookId
    LEFT JOIN title t ON b.BookId = t.TitleId
    LEFT JOIN note m ON a.CopyId = m.Copy;

CREATE VIEW admin_view AS
SELECT
    u.UserId,
    u.Name AS UserName,
    u.Email AS UserEmail,
    a.CopyId,
    a.OpenDate,
    a.ExpireDate,
    a.Owner,
    b.BookId,
    b.Category,
    b.Publisher,
    b.Amount,
    b.ReleaseDate
FROM
    users u
    LEFT JOIN copy a ON u.UserId = a.Owner
    LEFT JOIN Book b ON a.Title = b.BookId
    LEFT JOIN Title t ON b.BookId = t.TitleId;

CREATE USER 'student_user' @'localhost' IDENTIFIED BY 'test_student_0000';

GRANT
SELECT
    ON cdb_db.student_view TO 'student_user' @'localhost';

GRANT
SELECT
    ON cdb_db.admin_view TO 'admin_user' @'localhost';
