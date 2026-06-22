-- Luyện tập SQL - Database
-- Lấy top 5 user có nhiều bài viết nhất:
SELECT users.user_id,
    users.username,
    COUNT(posts.post_id) AS quantity_post
FROM users
    JOIN posts ON users.user_id = post.user_id
GROUP BY users.user_id,
    users.username
ORDER BY quantity_post DESC
LIMIT 5;
-- Lấy sản phẩm bán chạy nhất (products, order_details)
SELECT p.id,
    p.name,
    SUM(o.quantity) AS total_sold
FROM products p
    JOIN order_details o ON p.id = o.product_id
GROUP BY p.id,
    p.name
ORDER BY total_sold DESC
LIMIT 1;
-- Lấy doanh thu từng tháng (oders)
SELECT YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(revenue) AS total_revenue
FROM orders
GROUP BY YEAR(order_date),
    MONTH(order_date)
ORDER BY order_year ASC,
    order_month ASC;