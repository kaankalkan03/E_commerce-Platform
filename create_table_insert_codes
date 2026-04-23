CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    registration_date DATE
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    shop_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date DATE
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    category VARCHAR(50),
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE Purchase (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Purchase(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    customer_comment TEXT,
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Customer (customer_id, customer_name, email, phone, address, registration_date) VALUES
(1, 'Kaan Kalkan', 'kaan@gmail.com', '05001234567', 'Istanbul', '2025-01-10'),
(2, 'Emre Becerir', 'emre@gmail.com', '05009876543', 'Ankara', '2025-02-05'),
(3, 'Hazal Güneşli', 'hazal@gmail.com', '05321234567', 'Izmir', '2025-03-10'),
(4, 'Yusuf Emir Şengör', 'emir@gmail.com', '05441234587', 'Bursa', '2025-03-14'),
(5, 'Ayşe Demir', 'ayse@gmail.com', '05551237890', 'Adana', '2025-04-01'),
(6, 'Elif Kara', 'elif@gmail.com', '05389998877', 'Mersin', '2025-04-02'),
(7, 'Berk Aksoy', 'berk@gmail.com', '05331112233', 'Antalya', '2025-04-03'),
(8, 'Ece Çetin', 'ece@gmail.com', '05369992211', 'Konya', '2025-04-05'),
(9, 'Yasin Öztürk', 'yasin@gmail.com', '05446665544', 'Trabzon', '2025-04-10'),
(10, 'Sude Kar', 'sude@gmail.com', '05553336677', 'Edirne', '2025-04-12');

INSERT INTO Supplier (shop_name, email, phone, registration_date) VALUES
('TechStore', 'tech@mail.com', '05001112233', '2025-01-20'),
('FashionWorld', 'fw@mail.com', '05006667788', '2025-03-15'),
('HomePlus', 'home@mail.com', '05332221100', '2025-03-18'),
('BookHub', 'book@mail.com', '05003334455', '2025-03-29'),
('MobilePlanet', 'mobile@mail.com', '05440012233', '2025-03-22'),
('FitLife', 'fitlife@mail.com', '05550012345', '2025-03-25'),
('GamerZone', 'gamer@mail.com', '05226667788', '2025-03-27'),
('BeautyMart', 'beauty@mail.com', '05445556677', '2025-03-29'),
('PetWorld', 'pet@mail.com', '05009998877', '2025-03-30'),
('SportShop', 'sport@mail.com', '05550006789', '2025-04-01');

INSERT INTO Product (product_name, description, price, stock_quantity, category, supplier_id) VALUES
('Laptop X', 'High performance laptop', 25000, 10, 'Electronics', 1),
('Mouse A', 'Wireless mouse', 300, 150, 'Electronics', 1),
('Keyboard B', 'Mechanical keyboard', 1200, 80, 'Electronics', 1),
('Sneakers Y', 'Running shoes', 1800, 50, 'Clothing', 2),
('Jacket Z', 'Winter jacket', 950, 40, 'Clothing', 2),
('Coffee Maker', 'Filter coffee machine', 1200, 35, 'Home', 3),
('Vacuum Cleaner', 'Smart vacuum', 5000, 20, 'Home', 3),
('Book A', 'Novel book', 90, 200, 'Books', 4),
('Book B', 'Sci-fi book', 110, 180, 'Books', 4),
('Phone P', 'Smartphone', 18000, 15, 'Electronics', 5);

INSERT INTO Purchase (customer_id, order_date, total_amount, status) VALUES
(1, '2024-05-01', 25000, 'Delivered'),
(2, '2024-05-05', 1800, 'Delivered'),
(3, '2024-05-06', 300, 'Shipped'),
(4, '2024-05-07', 1200, 'Pending'),
(5, '2024-05-08', 950, 'Delivered'),
(6, '2024-05-10', 18000, 'Pending'),
(7, '2024-05-12', 3500, 'Delivered'),
(8, '2024-05-15', 90, 'Delivered'),
(9, '2024-05-17', 110, 'Shipped'),
(10, '2024-05-20', 450, 'Delivered');

INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1,1,1,25000),
(2,4,1,1800),
(3,2,1,300),
(4,6,1,1200),
(5,5,1,950),
(6,10,1,18000),
(7,13,1,3500),
(8,8,1,90),
(9,9,1,110),
(10,15,1,450);

INSERT INTO Review (customer_id, product_id, rating, customer_comment, review_date) VALUES
(1,1,5,'Excellent laptop','2025-05-05'),
(2,4,4,'Very comfortable','2025-05-12'),
(3,2,5,'Great mouse','2025-05-13'),
(4,6,4,'Useful machine','2025-05-14'),
(5,5,3,'Average jacket','2025-05-15'),
(6,10,5,'Amazing phone','2025-05-16'),
(7,13,4,'Good chair','2025-05-17'),
(8,8,5,'Loved this book','2025-05-18'),
(9,9,4,'Nice story','2025-05-19'),
(10,15,5,'My dog loves it','2025-05-20');                                                           
