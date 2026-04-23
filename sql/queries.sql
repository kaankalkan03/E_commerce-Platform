
1-STORED PROCEDURES

--CREATE PURCHASE
DELIMITER $$

CREATE PROCEDURE CreatePurchase (
    IN p_customer_id INT,
    IN p_order_date DATE
)
BEGIN
    INSERT INTO Purchase (customer_id, order_date, total_amount, status)
    VALUES (p_customer_id, p_order_date, 0, 'Pending');
END $$

DELIMITER ;

--UPDATE ORDER TOTAL

DELIMITER $$

CREATE PROCEDURE UpdateOrderTotal (
    IN p_order_id INT
)
BEGIN
    UPDATE Purchase
    SET total_amount = (
        SELECT SUM(quantity * price)
        FROM OrderItem
        WHERE order_id = p_order_id
    )
    WHERE order_id = p_order_id;
END $$

DELIMITER ;

2-FUNCTIONS

--ORDER TOTAL

DELIMITER $$

CREATE FUNCTION GetOrderTotal(p_order_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(quantity * price)
    INTO total
    FROM OrderItem
    WHERE order_id = p_order_id;

    RETURN total;
END $$

DELIMITER ;

--CUSTOMER TOTAL SPENT

DELIMITER $$

CREATE FUNCTION GetCustomerTotalSpent(p_customer_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(total_amount)
    INTO total
    FROM Purchase
    WHERE customer_id = p_customer_id;

    RETURN total;
END $$

DELIMITER ;

3-VIEWS

--Customer Summary

CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(p.order_id) AS total_orders,
    SUM(p.total_amount) AS total_spent
FROM Customer c
LEFT JOIN Purchase p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.customer_name;

--PRODUCTS SALES REPORT

CREATE VIEW ProductSalesReport AS
SELECT 
    pr.product_id,
    pr.product_name,
    SUM(oi.quantity) AS total_sold,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM Product pr
JOIN OrderItem oi ON pr.product_id = oi.product_id
GROUP BY pr.product_id, pr.product_name
HAVING total_sold > 1;

4-TRIGGERS

--DECREASE THE STOCK

DELIMITER $$

CREATE TRIGGER ReduceStockAfterOrder
AFTER INSERT ON OrderItem
FOR EACH ROW
BEGIN
    UPDATE Product
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END $$

DELIMITER ;

--READD STOCK

DELIMITER $$

CREATE TRIGGER RestoreStockAfterDelete
AFTER DELETE ON OrderItem
FOR EACH ROW
BEGIN
    UPDATE Product
    SET stock_quantity = stock_quantity + OLD.quantity
    WHERE product_id = OLD.product_id;
END $$

DELIMITER ;

5-TRANSACTIONS

--BASİC TRANSACTIONS

START TRANSACTION;

INSERT INTO Purchase (customer_id, order_date, total_amount, status)
VALUES (1, CURDATE(), 0, 'Pending');

INSERT INTO OrderItem (order_id, product_id, quantity, price)
VALUES (LAST_INSERT_ID(), 1, 1, 25000);

COMMIT;

--ROLLBACK

START TRANSACTION;

UPDATE Product
SET stock_quantity = stock_quantity - 1000
WHERE product_id = 1;

SELECT 
    CASE 
        WHEN stock_quantity < 0 THEN 'ERROR'
        ELSE 'OK'
    END AS transaction_status
FROM Product
WHERE product_id = 1;

ROLLBACK;

6-TEST QUERIES

CALL CreatePurchase(3, '2025-03-10');

SELECT * FROM Purchase
ORDER BY order_id DESC
LIMIT 1;

CALL UpdateOrderTotal(3);

SELECT order_id, total_amount
FROM Purchase
WHERE order_id = 3;

--FUNCTION TEST 

SELECT GetOrderTotal(3) AS Order_Total;
SELECT GetCustomerTotalSpent(3) AS Customer_Total_Spent;

--VIEW TEST

SELECT * FROM CustomerOrderSummary;
SELECT * FROM ProductSalesReport;
