-- Bài 1: Tìm các bài hát có giá (`UnitPrice`) cao hơn giá trung bình của tất cả các bài hát.
SELECT tracks.Name,
    tracks.UnitPrice
FROM tracks
WHERE tracks.UnitPrice > (
        SELECT AVG(tracks.UnitPrice)
        FROM tracks
    );
-- Bài 2: Phân loại hóa đơn: Nếu tổng tiền > 10$ thì ghi là "High", ngược lại "Low".
SELECT invoices.InvoiceId,
    invoices.Total,
    CASE
        WHEN invoices.Total > 10 THEN "High"
        ELSE "Low"
    END AS "Classify"
FROM invoices;
-- Bài 3: Tìm khách hàng đã chi tiêu nhiều nhất (kết hợp `ORDER BY` và `LIMIT`).
SELECT customers.CustomerId,
    customers.FirstName,
    customers.LastName,
    SUM(invoices.Total) AS Total
FROM customers
    JOIN invoices ON invoices.CustomerId = customers.CustomerId
GROUP BY customers.CustomerId
ORDER BY Total DESC
LIMIT 1;