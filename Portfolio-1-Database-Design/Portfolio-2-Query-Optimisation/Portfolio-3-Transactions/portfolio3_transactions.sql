USE emhabu_ecommerce;

-- PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY

-- 1. Check the original Laptop price
SELECT product_name, price
FROM Products
WHERE product_name = 'Laptop';

-- 2. Demonstrate ROLLBACK
START TRANSACTION;

UPDATE Products
SET price = 860000
WHERE product_name = 'Laptop';

-- Check the temporary change
SELECT product_name, price
FROM Products
WHERE product_name = 'Laptop';

-- Cancel the transaction
ROLLBACK;

-- Confirm that the original price is restored
SELECT product_name, price
FROM Products
WHERE product_name = 'Laptop';

-- 3. Transaction isolation level
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT @@transaction_isolation;