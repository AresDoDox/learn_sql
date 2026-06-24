-- Bài 10: Doanh thu theo năm: Trích xuất năm (Year) từ cột InvoiceDate và tính tổng doanh thu cho từng năm.
-- SELECT YEAR(invoices.InvoiceDate) AS InvoiceYear,
--     SUM(invoices.Total) AS TotalRevenue
-- FROM invoices
-- GROUP BY YEAR(invoices.InvoiceDate);
-- Hoặc với SQLite sử dụng hàm strftime
SELECT strftime('%Y', invoices.InvoiceDate) AS InvoiceYear,
    SUM(invoices.Total) AS TotalRevenue
FROM invoices
GROUP BY strftime('%Y', invoices.InvoiceDate);
-- Bài 11: Xu hướng thể loại: Tìm thể loại nào bán chạy nhất trong năm 2013.
SELECT genres.Name,
    SUM(invoice_items.Quantity) AS TotalSales
FROM genres
    JOIN tracks ON tracks.GenreId = genres.GenreId
    JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
    JOIN invoices ON invoices.InvoiceId = invoice_items.InvoiceId
WHERE invoices.InvoiceDate LIKE '2013%'
GROUP BY genres.Name
ORDER BY TotalSales DESC
LIMIT 1;
-- Bài 11.b: Tìm thể loại nào bán có tổng doanh thu cao nhất nhất trong năm 2013
SELECT genres.Name,
    SUM(invoice_items.UnitPrice * invoice_items.Quantity) AS TotalRevenue
FROM genres
    JOIN tracks ON tracks.GenreId = genres.GenreId
    JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
    JOIN invoices ON invoices.InvoiceId = invoice_items.InvoiceId
WHERE invoices.InvoiceDate BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY genres.Name
ORDER BY TotalRevenue DESC
LIMIT 1;
-- Bài 12: Nhân viên xuất sắc: Tìm tên của nhân viên bán hàng mang về nhiều doanh thu nhất thông qua các khách hàng họ hỗ trợ.
SELECT employees.EmployeeId,
    employees.FirstName,
    employees.LastName,
    SUM(invoices.Total) AS TotalRevenue
FROM employees
    JOIN customers ON customers.SupportRepId = employees.EmployeeId
    JOIN invoices ON invoices.CustomerId = customers.CustomerId
GROUP BY employees.EmployeeId
ORDER BY TotalRevenue DESC
LIMIT 1;
-- Bài 13: Bài hát không bán được: Liệt kê danh sách tất cả các bài hát chưa bao giờ xuất hiện trong bất kỳ hóa đơn nào (invoice_items).
SELECT tracks.TrackId,
    tracks.Name
FROM tracks
    LEFT JOIN invoice_items ON invoice_items.trackId = tracks.TrackId
WHERE invoice_items.TrackId IS NULL;