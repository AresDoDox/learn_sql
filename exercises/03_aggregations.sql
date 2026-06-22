-- Bài 1: Đếm tổng số bài hát trong mỗi thể loại (`genres`).
SELECT genres.Name,
    COUNT(*) AS TotalTracks
FROM tracks
    JOIN genres ON genres.GenreId = tracks.GenreId
GROUP BY genres.Name;
-- Bài 2: Tính tổng doanh thu (`total`) của hóa đơn theo từng quốc gia.
SELECT invoices.BillingCountry,
    SUM(invoices.Total) AS Total
FROM invoices
GROUP BY invoices.BillingCountry;
-- Bài 3: Tìm các quốc gia có tổng doanh thu hóa đơn lớn hơn 50$.
SELECT invoices.BillingCountry,
    SUM(invoices.Total) AS Total
FROM invoices
GROUP BY invoices.BillingCountry
HAVING SUM(invoices.Total) > 50;