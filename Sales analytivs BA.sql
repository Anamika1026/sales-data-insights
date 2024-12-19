USE SalesAnalytics;
 
SHOW TABLES FROM salesanalytics;

SHOW FULL TABLES FROM salesanalytics WHERE TABLE_TYPE = 'VIEW';

CREATE TABLE Sales_Data (
    order_id INT PRIMARY KEY,
    skus_bought VARCHAR(255),
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    order_date DATE,
    customer_id INT,
    order_city VARCHAR(50),
    channel_type ENUM('online', 'offline')
);

CREATE TABLE Product_Details (
    sku VARCHAR(20) PRIMARY KEY,
    mrp DECIMAL(10, 2),
    product_name VARCHAR(100)
);

CREATE TABLE Customer_Details (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

-- Insert sample data for Product_Details
INSERT INTO Product_Details VALUES
('ST001', 500.00, 'Steel Plate'),
('ST002', 750.00, 'Steel Bowl'),
('CR001', 300.00, 'Ceramic Mug'),
('CR002', 450.00, 'Ceramic Plate');

-- Insert sample data for Customer_Details
INSERT INTO Customer_Details VALUES
(1, 'Alice Smith', '1234567890', 'alice@example.com'),
(2, 'Bob Johnson', '9876543210', 'bob@example.com'),
(3, 'Charlie Brown', '5556667777', 'charlie@example.com');

-- Insert sample data for Sales_Data
INSERT INTO Sales_Data VALUES
(101, 'ST001,CR001', 800.00, 10.00, '2023-10-01', 1, 'New York', 'online'),
(102, 'ST002', 675.00, 10.00, '2023-10-02', 2, 'Los Angeles', 'offline'),
(103, 'CR002', 405.00, 10.00, '2023-10-03', 1, 'New York', 'offline'),
(104, 'ST001', 450.00, 10.00, '2023-10-04', 3, 'Chicago', 'online'),
(105, 'CR001,CR002', 700.00, 15.00, '2023-10-05', 2, 'Los Angeles', 'offline');

-- Queries to solve the tasks

-- 1. Name and list the details of all customers who have placed multiple orders and have purchased a ceramic item at least once.
SELECT DISTINCT c.*
FROM Customer_Details c
JOIN Sales_Data s ON c.customer_id = s.customer_id
WHERE c.customer_id IN (
    SELECT customer_id
    FROM Sales_Data
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
)
AND s.skus_bought LIKE '%CR%';

-- 2. Find the most expensive bestseller.
SELECT p.sku, p.product_name, COUNT(s.order_id) AS order_count
FROM Product_Details p
JOIN Sales_Data s ON s.skus_bought LIKE CONCAT('%', p.sku, '%')
GROUP BY p.sku, p.product_name
ORDER BY order_count DESC, p.mrp DESC
LIMIT 1;

-- 3. For all customers who have purchased for the first time online, calculate the average number of times they purchase offline in a month.
SELECT c.customer_id, AVG(offline_count) AS avg_offline_purchases
FROM (
    SELECT 
        customer_id,
        MIN(order_date) AS first_online_date
    FROM Sales_Data
    WHERE channel_type = 'online'
    GROUP BY customer_id
) first_online
JOIN (
    SELECT 
        customer_id,
        COUNT(order_id) AS offline_count,
        MONTH(order_date) AS month
    FROM Sales_Data
    WHERE channel_type = 'offline'
    GROUP BY customer_id, MONTH(order_date)
) offline_data
ON first_online.customer_id = offline_data.customer_id
AND offline_data.order_date > first_online.first_online_date
GROUP BY c.customer_id;

-- 4. List the top 7 spenders in Y city (here Y should be a user-input variable).
SET @city = 'New York';
SELECT c.customer_id, c.name, SUM(s.price - s.discount) AS total_spent
FROM Customer_Details c
JOIN Sales_Data s ON c.customer_id = s.customer_id
WHERE s.order_city = @city
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 7;


