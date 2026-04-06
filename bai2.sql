CREATE SCHEMA IF NOT EXISTS bai2;

CREATE TABLE bai2.Users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    username VARCHAR(100)
);

INSERT INTO bai2.Users (email, username)
SELECT 
    'user' || i || '@example.com', 
    'username_' || i
FROM generate_series(1, 100000) AS i;

CREATE INDEX idx_users_email_hash ON bai2.Users USING hash (email);

EXPLAIN ANALYZE 
SELECT * FROM bai2.Users WHERE email = 'user50000@example.com';
