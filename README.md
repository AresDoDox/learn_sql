# Lộ trình luyện tập SQL với Chinook Database

Chào mừng đến với lộ trình thực hành SQL của tôi. Dự án này sử dụng **Chinook Database** để luyện tập từ các câu lệnh cơ bản đến các kỹ thuật phân tích dữ liệu nâng cao.

## Giai đoạn 1: Làm quen (Cơ bản)
**Mục tiêu:** Nắm vững cấu trúc truy vấn đơn giản và lọc dữ liệu.
* **Từ khóa:** `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`.
* **Bài tập:**
    1. Liệt kê tên và email của tất cả khách hàng (`customers`).
    2. Lấy danh sách các quốc gia mà khách hàng đang sinh sống (loại bỏ trùng lặp).
    3. Lấy 10 bài hát (`tracks`) có tên bắt đầu bằng chữ "A".

## Giai đoạn 2: Kết nối dữ liệu (Intermediate)
**Mục tiêu:** Hiểu mối quan hệ giữa các bảng và cách kết nối chúng.
* **Từ khóa:** `INNER JOIN`, `LEFT JOIN`, `Alias`.
* **Bài tập:**
    1. Liệt kê tên các bài hát và tên thể loại (`genres`) tương ứng.
    2. Hiển thị tên khách hàng và mã hóa đơn (`invoices`) của họ.
    3. Tìm xem nhân viên nào (`employees`) đang hỗ trợ cho khách hàng nào.

## Giai đoạn 3: Tổng hợp dữ liệu (Aggregations)
**Mục tiêu:** Thực hiện các phép tính toán thống kê.
* **Từ khóa:** `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`.
* **Bài tập:**
    1. Đếm tổng số bài hát trong mỗi thể loại (`genres`).
    2. Tính tổng doanh thu (`total`) của hóa đơn theo từng quốc gia.
    3. Tìm các quốc gia có tổng doanh thu hóa đơn lớn hơn 50$.

## Giai đoạn 4: Nâng cao (Advanced)
**Mục tiêu:** Giải quyết các bài toán logic phức tạp.
* **Từ khóa:** `Subqueries`, `CASE WHEN`, `UNION`.
* **Bài tập:**
    1. Tìm các bài hát có giá (`UnitPrice`) cao hơn giá trung bình của tất cả các bài hát.
    2. Phân loại hóa đơn: Nếu tổng tiền > 10$ thì ghi là "High", ngược lại "Low".
    3. Tìm khách hàng đã chi tiêu nhiều nhất (kết hợp `ORDER BY` và `LIMIT`).

---
*Ghi chú: Luôn tham khảo sơ đồ ERD của Chinook để hiểu mối quan hệ khóa chính/khóa ngoại.*

https://www.sqlitetutorial.net/sqlite-sample-database/

Để run file và thực thi câu lệnh SQL: Cài extension SQLite (của alexcvzz) trên VS Code. Sau khi viết xong câu lệnh trong file .sql, bạn nhấn Ctrl + Shift + P (hoặc Cmd + Shift + P trên Mac) và chọn SQLite: Run Query. Kết quả sẽ hiện ra ngay trong VS Code.

## Bài tập thực hành nâng cao (Chinook Database)

Sau khi đã nắm vững kiến thức nền tảng, đây là các bài tập giúp bạn tư duy sâu hơn về phân tích dữ liệu và tối ưu truy vấn.

### Cấp độ 1: Phân tích dữ liệu (Intermediate+)
1. **Top nghệ sĩ:** Tìm 5 nghệ sĩ (`artists`) có nhiều bài hát (`tracks`) nhất trong thư viện.
2. **Khách hàng tiềm năng:** Tìm 5 khách hàng đã chi tiêu nhiều tiền nhất (tổng `Total` từ `invoices`).
3. **Hành vi mua sắm:** Tính doanh thu trung bình của mỗi hóa đơn (`invoices`).
4. **Khoảng thời gian:** Tìm tất cả các bài hát có thời lượng (`Milliseconds`) dài hơn thời lượng trung bình của tất cả bài hát.
5. **Thể loại yêu thích:** Tìm thể loại (`genres`) nào mang lại tổng doanh thu cao nhất.

### Cấp độ 2: Tư duy Logic & Kết hợp (Advanced)
6. **Khách hàng "lặng im":** Tìm tất cả các khách hàng chưa từng thực hiện bất kỳ hóa đơn nào (`invoices`).
7. **Sự phổ biến của Album:** Tìm các album (`albums`) có tổng số bài hát nhiều hơn 20 bài.
8. **So sánh doanh thu:** Liệt kê tên quốc gia và doanh thu của quốc gia đó, chỉ hiển thị các quốc gia có doanh thu cao hơn doanh thu trung bình của tất cả các quốc gia.
9. **Phân loại thời lượng:** Sử dụng `CASE WHEN` để phân loại bài hát:
    * "Short": Dưới 3 phút.
    * "Medium": Từ 3 đến 5 phút.
    * "Long": Trên 5 phút.
    * (Đếm số lượng bài hát trong mỗi nhóm).

### Cấp độ 3: Thử thách chuyên gia (Expert)
10. **Doanh thu theo năm:** Trích xuất năm (`Year`) từ cột `InvoiceDate` và tính tổng doanh thu cho từng năm.
11. **Xu hướng thể loại:** Tìm thể loại nào bán chạy nhất trong năm 2013.
12. **Nhân viên xuất sắc:** Tìm tên của nhân viên bán hàng mang về nhiều doanh thu nhất thông qua các khách hàng họ hỗ trợ.
13. **Bài hát không bán được:** Liệt kê danh sách tất cả các bài hát chưa bao giờ xuất hiện trong bất kỳ hóa đơn nào (`invoice_items`).