CREATE SCHEMA IF NOT EXISTS bai4;

CREATE TABLE bai4.Sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount NUMERIC
);

INSERT INTO bai4.Sales (customer_id, product_id, sale_date, amount)
VALUES 
    (1, 101, '2024-01-01', 500),
    (1, 102, '2024-01-05', 700),
    (2, 101, '2024-01-10', 300),
    (3, 103, '2024-01-15', 1500),
    (2, 102, '2024-01-20', 200);

CREATE OR REPLACE VIEW bai4.CustomerSales AS
SELECT 
    customer_id, 
    SUM(amount) AS total_amount
FROM bai4.Sales
GROUP BY customer_id;

SELECT * FROM bai4.CustomerSales WHERE total_amount > 1000;

UPDATE bai4.CustomerSales 
SET total_amount = 2000 
WHERE customer_id = 1;
