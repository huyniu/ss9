SET session_replication_role = 'replica';
DROP INDEX IF EXISTS idx_customer_id;
INSERT INTO Orders (customer_id, order_date, total_amount)
SELECT 
    (random() * 100)::int, -- Chỉnh lại số nhỏ cho dễ tìm
    CURRENT_DATE - (random() * 365 || ' days')::interval, 
    (random() * 1000)::decimal(10,2)
FROM generate_series(1, 10000);
SET session_replication_role = 'origin';
EXPLAIN ANALYZE 
SELECT * FROM Orders WHERE customer_id = 50;
CREATE INDEX idx_customer_id ON Orders (customer_id);
EXPLAIN ANALYZE 
SELECT * FROM Orders WHERE customer_id = 50;