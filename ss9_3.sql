DROP TABLE IF EXISTS Products CASCADE;CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT
);
INSERT INTO Products (category_id, price, stock_quantity)
SELECT 
    (random() * 10 + 1)::int, 
    (random() * 500 + 10)::decimal(10,2),
    (random() * 100)::int
FROM generate_series(1, 1000);
CREATE INDEX idx_products_category_clustered ON Products (category_id);
CLUSTER Products USING idx_products_category_clustered;
CREATE INDEX idx_products_price_nonclustered ON Products (price);
EXPLAIN ANALYZE 
SELECT * FROM Products 
WHERE category_id = 5 
ORDER BY price;