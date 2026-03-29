CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO Sales (customer_id, product_id, sale_date, amount) VALUES 
(1, 101, '2026-03-01', 500.00),
(1, 102, '2026-03-05', 600.00),
(2, 101, '2026-03-10', 300.00),
(3, 103, '2026-03-15', 1500.00),
(2, 102, '2026-03-20', 200.00);

CREATE VIEW CustomerSales AS
SELECT customer_id, SUM(amount) AS total_amount
FROM Sales
GROUP BY customer_id;

SELECT * FROM CustomerSales WHERE total_amount > 1000;

UPDATE CustomerSales 
SET total_amount = 2000 
WHERE customer_id = 1;