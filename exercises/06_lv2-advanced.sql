-- Bài 6: Khách hàng "lặng im": Tìm tất cả các khách hàng chưa từng thực hiện bất kỳ hóa đơn nào (invoices).
SELECT customers.CustomerId,
    customers.FirstName,
    customers.LastName
FROM customers
    LEFT JOIN invoices ON invoices.CustomerId = customers.CustomerId
WHERE invoices.InvoiceId IS NULL;
-- Bài 7: Sự phổ biến của Album: Tìm các album (albums) có tổng số bài hát nhiều hơn 20 bài.
SELECT albums.AlbumId,
    albums.Title,
    COUNT(tracks.TrackId) AS TotalTracks
FROM albums
    JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.AlbumId,
    albums.Title
HAVING COUNT(tracks.TrackId) > 20;
-- Bài 8: So sánh doanh thu: Liệt kê tên quốc gia và doanh thu của quốc gia đó, chỉ hiển thị các quốc gia có doanh thu cao hơn doanh thu trung bình của tất cả các quốc gia.
SELECT invoices.BillingCountry AS Country,
    SUM(invoices.Total) AS TotalRevenue
FROM invoices
GROUP BY invoices.BillingCountry
HAVING SUM(invoices.Total) > (
        SELECT AVG(TotalRevenue)
        FROM (
                SELECT SUM(invoices.Total) AS TotalRevenue
                FROM invoices
                GROUP BY invoices.BillingCountry
            ) AS AvgRevenue
    );
-- Bài 9: Phân loại thời lượng: Sử dụng CASE WHEN để phân loại bài hát:
-- "Short": Dưới 3 phút.
-- "Medium": Từ 3 đến 5 phút.
-- "Long": Trên 5 phút.
-- (Đếm số lượng bài hát trong mỗi nhóm).
SELECT CASE
        WHEN tracks.Milliseconds < 3 * 60000 THEN "Short"
        WHEN tracks.Milliseconds BETWEEN 3 * 60000 AND 5 * 60000 THEN "Medium"
        ELSE "Long"
    END AS "Classify",
    COUNT(tracks.TrackId) AS TotalTracks
FROM tracks
GROUP BY CASE
        WHEN tracks.Milliseconds < 3 * 60000 THEN "Short"
        WHEN tracks.Milliseconds BETWEEN 3 * 60000 AND 5 * 60000 THEN "Medium"
        ELSE "Long"
    END;