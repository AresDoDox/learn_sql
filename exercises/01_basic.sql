-- Bài 1: Liệt kê tên và email của tất cả khách hàng (`customers`).
SELECT FirstName,
    LastName,
    Email
FROM customers;
-- Bài 2: Lấy danh sách các quốc gia mà khách hàng đang sinh sống (loại bỏ trùng lặp).
SELECT DISTINCT Country
FROM Customers;
-- Bài 3: Lấy 10 bài hát (`tracks`) có tên bắt đầu bằng chữ "A".
SELECT *
FROM tracks
WHERE Name LIKE 'A%'
LIMIT 10;