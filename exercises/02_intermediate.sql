-- Bài 1: Liệt kê tên các bài hát và tên thể loại (`genres`) tương ứng.
SELECT tracks.Name AS TrackName,
    genres.Name AS GenreName
FROM tracks
    JOIN genres ON tracks.GenreId = genres.GenreId;
-- Bài 2: Hiển thị tên khách hàng và mã hóa đơn (`invoices`) của họ.
SELECT customers.FirstName,
    customers.LastName,
    invoices.InvoiceId
FROM customers
    JOIN invoices ON invoices.CustomerId = customers.CustomerId;
-- Bài 3: Tìm xem nhân viên nào (`employees`) đang hỗ trợ cho khách hàng nào.
SELECT employees.FirstName AS "Employee First Name",
    employees.LastName AS "Employee Last Name",
    customers.FirstName AS "Customer First Name",
    customers.LastName AS "Customer Last Name"
FROM customers
    JOIN employees ON customers.SupportRepId = employees.EmployeeId;
-- Hoặc
SELECT employees.FirstName || ' ' || employees.LastName AS "Employee Name",
    customers.FirstName || ' ' || customers.LastName AS "Customer Name"
FROM customers
    JOIN employees ON customers.SupportRepId = employees.EmployeeId;