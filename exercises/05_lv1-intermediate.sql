-- Bài 1: Top nghệ sĩ: Tìm 5 nghệ sĩ (artists) có nhiều bài hát (tracks) nhất trong thư viện.
SELECT artists.ArtistId,
    artists.Name,
    COUNT(tracks.TrackId) AS TotalTracks
FROM artists
    JOIN albums ON artists.ArtistId = albums.ArtistId
    JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY artists.ArtistId
ORDER BY TotalTracks DESC
LIMIT 5;
-- Bài 2: Khách hàng tiềm năng: Tìm 5 khách hàng đã chi tiêu nhiều tiền nhất (tổng Total từ invoices).
SELECT customers.CustomerId,
    customers.FirstName,
    customers.LastName,
    SUM(invoices.Total) AS TotalSpent
FROM customers
    JOIN invoices ON invoices.CustomerId = customers.CustomerId
GROUP BY customers.CustomerId,
    customers.FirstName,
    customers.LastName
ORDER BY TotalSpent DESC
LIMIT 5;
-- Bài 3: Hành vi mua sắm: Tính doanh thu trung bình của mỗi hóa đơn (invoices).
SELECT ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceId),
        2
    ) AS AvgRevenuePerInvoice
FROM invoice_items;
-- Bài 4: Khoảng thời gian: Tìm tất cả các bài hát có thời lượng (Milliseconds) dài hơn thời lượng trung bình của tất cả bài hát.
SELECT tracks.TrackId,
    tracks.Name,
    tracks.Milliseconds
FROM tracks
WHERE tracks.Milliseconds > (
        SELECT AVG(tracks.Milliseconds)
        FROM tracks
    );
-- Bài 5: Thể loại yêu thích: Tìm thể loại (genres) nào mang lại tổng doanh thu cao nhất.
SELECT genres.GenreId,
    genres.Name,
    ROUND(
        SUM(invoice_items.Quantity * invoice_items.UnitPrice),
        2
    ) AS TotalRevenue
FROM genres
    JOIN tracks ON tracks.GenreId = genres.GenreId
    JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
GROUP BY genres.Name,
    genres.GenreId
ORDER BY TotalRevenue DESC
LIMIT 1;