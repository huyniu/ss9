-- 1. Tạo bảng Users (Nếu chưa có)
CREATE TABLE IF NOT EXISTS Users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    username VARCHAR(100)
);

-- 2. Chèn dữ liệu mẫu để có cái mà tra cứu
INSERT INTO Users (email, username) 
VALUES 
('huy_dh13c3@example.com', 'DinhQuocHuy'),
('example@example.com', 'Student_Test'),
('admin@database.com', 'Admin_User');

-- 3. Xóa Index cũ (nếu có) để tránh lỗi "already exists"
DROP INDEX IF EXISTS idx_users_email_hash;

-- 4. Tạo Hash Index trên cột email (Yêu cầu 1)
CREATE INDEX idx_users_email_hash 
ON Users USING HASH (email);

-- 5. Truy vấn và kiểm tra kế hoạch thực hiện (Yêu cầu 2)
EXPLAIN ANALYZE 
SELECT * FROM Users WHERE email = 'example@example.com';