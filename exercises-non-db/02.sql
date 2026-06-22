-- 5 bài khởi động 
-- Liệt kê 10 khách hàng mới nhất theo created_at (customers)
SELECT c.id,
    c.name,
    c.email,
    c.created_at
FROM customers c
ORDER BY c.created_at DESC
LIMIT 10;
-- Đếm số sản phẩm đang kinh doanh (không discontinued).
-- Kết quả: active_product_count.(Products)
SELECT COUNT(*) AS active_product_count
FROM products
WHERE discontinued = FALSE;
Lấy top 5 sản phẩm có unit_price cao nhất.Kết quả: id,
name,
unit_price.(Products)
SELECT id,
    name,
    unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;
-- Tìm tất cả đơn hàng ở trạng thái paid trong tháng hiện tại.
-- Kết quả: id, customer_id, order_date, status.(Orders)
SELECT id,
    customer_id,
    order_date,
    status
FROM orders
WHERE status = ‘ paid ’
    AND MONTH(created_at) = MONTH(CURRENT_DATE)
    AND YEAR(created_at) = YEAR(CURRENT_DATE);
-- Liệt kê các dòng chi tiết đơn hàng của order_id = :id với tổng tiền dòng = quantity * unit_price * (1 - discount / 100).
-- Kết quả: product_id, quantity, unit_price, discount, line_total.
SELECT product_id,
    quantity,
    unit_price,
    discount,
    (quantity * unit_price * (1 - discount / 100.0)) AS line_total
FROM order_details
WHERE order_id = :id;