CREATE SCHEMA IF NOT EXISTS bai3;

CREATE TABLE bai3.Products (
    product_id SERIAL PRIMARY KEY,
    category_id INT,
    price NUMERIC,
    stock_quantity INT
);

INSERT INTO bai3.Products (category_id, price, stock_quantity)
SELECT 
    (random() * 50)::INT, 
    (random() * 10000)::NUMERIC, 
    (random() * 100)::INT
FROM generate_series(1, 100000);

CREATE INDEX idx_products_category_id ON bai3.Products (category_id);
CLUSTER bai3.Products USING idx_products_category_id;

CREATE INDEX idx_products_price ON bai3.Products (price);

EXPLAIN ANALYZE 
SELECT * FROM bai3.Products 
WHERE category_id = 10 
ORDER BY price;
