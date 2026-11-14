 /*Moment Café Database*/

CREATE DATABASE IF NOT EXISTS moment_cafe;
USE moment_cafe;

/* TABLE 1: BRANCHES */
CREATE TABLE Branches (
    branch_id    INT PRIMARY KEY AUTO_INCREMENT,
    branch_name  VARCHAR(100) NOT NULL,
    location     VARCHAR(200) NOT NULL,
    phone        VARCHAR(20),
    opening_time TIME,
    closing_time TIME
);

INSERT INTO Branches VALUES
(1, 'Moment Café - Al Aziziyah',  'Al Aziziyah, Makkah',    '0125001001', '07:00:00', '23:00:00'),
(2, 'Moment Café - Al Shisha',    'Al Shisha, Makkah',      '0125001002', '07:00:00', '23:00:00'),
(3, 'Moment Café - Ajyad',        'Ajyad St, Makkah',       '0125001003', '08:00:00', '00:00:00'),
(4, 'Moment Café - Al Rusaifah',  'Al Rusaifah, Makkah',    '0125001004', '07:30:00', '23:30:00'),
(5, 'Moment Café - Al Nuzha',     'Al Nuzha, Makkah',       '0125001005', '07:00:00', '22:00:00');

/* TABLE 2: EMPLOYEES */
CREATE TABLE Employees (
    employee_id  INT PRIMARY KEY AUTO_INCREMENT,
    full_name    VARCHAR(100) NOT NULL,
    role         VARCHAR(50)  NOT NULL,
    salary       DECIMAL(10,2) CHECK (salary > 0),
    hire_date    DATE,
    branch_id    INT,
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

INSERT INTO Employees VALUES
(1,  'Ahmed Al-Ghamdi',    'Manager',  8000.00, '2021-01-10', 1),
(2,  'Sara Al-Zahrani',    'Barista',  4500.00, '2021-03-15', 1),
(3,  'Omar Al-Otaibi',     'Cashier',  4000.00, '2022-06-01', 1),
(4,  'Fatima Al-Harbi',    'Manager',  8000.00, '2020-09-20', 2),
(5,  'Khalid Al-Qahtani',  'Barista',  4500.00, '2022-01-05', 2),
(6,  'Nora Al-Shamrani',   'Cashier',  4000.00, '2023-02-14', 2),
(7,  'Yousef Al-Maliki',   'Manager',  8000.00, '2021-07-11', 3),
(8,  'Maha Al-Dossari',    'Barista',  4500.00, '2022-11-30', 3),
(9,  'Tariq Al-Solami',    'Barista',  4500.00, '2023-04-18', 4),
(10, 'Reem Al-Enazi',      'Cashier',  4000.00, '2023-08-22', 5);

/* TABLE 3: CUSTOMERS */
CREATE TABLE Customers (
    customer_id  INT PRIMARY KEY AUTO_INCREMENT,
    full_name    VARCHAR(100) NOT NULL,
    phone        VARCHAR(20),
    email        VARCHAR(100),
    join_date    DATE
);

INSERT INTO Customers VALUES
(1,  'Abdullah Al-Rashidi',  '0501110001', 'abdullah@email.com', '2022-01-15'),
(2,  'Hana Al-Mutairi',      '0501110002', 'hana@email.com',     '2022-03-20'),
(3,  'Mohammed Al-Shehri',   '0501110003', 'moh@email.com',      '2022-05-10'),
(4,  'Lina Al-Ahmadi',       '0501110004', 'lina@email.com',     '2022-07-07'),
(5,  'Saud Al-Anzi',         '0501110005', 'saud@email.com',     '2023-01-01'),
(6,  'Rawan Al-Bishi',       '0501110006', 'rawan@email.com',    '2023-02-14'),
(7,  'Faris Al-Yami',        '0501110007', 'faris@email.com',    '2023-03-30'),
(8,  'Dana Al-Ruwaili',      '0501110008', 'dana@email.com',     '2023-06-19'),
(9,  'Nawaf Al-Subaie',      '0501110009', 'nawaf@email.com',    '2024-01-05'),
(10, 'Manal Al-Dosari',      '0501110010', 'manal@email.com',    '2024-02-28');

/* TABLE 4: MENU_CATEGORIES */
CREATE TABLE Menu_Categories (
    category_id    INT PRIMARY KEY AUTO_INCREMENT,
    category_name  VARCHAR(50) NOT NULL,
    description    VARCHAR(200)
);

INSERT INTO Menu_Categories VALUES
(1, 'Hot Drinks',   'All hot beverages including coffee and tea'),
(2, 'Cold Drinks',  'Iced and blended cold beverages'),
(3, 'Desserts',     'Cakes, pastries, and sweet treats'),
(4, 'Light Meals',  'Sandwiches, toasts, and snacks'),
(5, 'Fresh Juices', 'Freshly squeezed fruit juices');

/* TABLE 5: MENU_ITEMS */
CREATE TABLE Menu_Items (
    item_id       INT PRIMARY KEY AUTO_INCREMENT,
    item_name     VARCHAR(100) NOT NULL,
    price         DECIMAL(10,2) CHECK (price > 0),
    category_id   INT,
    is_available  BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES Menu_Categories(category_id)
);

INSERT INTO Menu_Items VALUES
(1,  'Espresso',            12.00, 1, TRUE),
(2,  'Cappuccino',          18.00, 1, TRUE),
(3,  'Latte',               20.00, 1, TRUE),
(4,  'Arabic Coffee',       10.00, 1, TRUE),
(5,  'Iced Latte',          22.00, 2, TRUE),
(6,  'Frappuccino',         25.00, 2, TRUE),
(7,  'Iced Matcha',         24.00, 2, TRUE),
(8,  'Chocolate Cake',      22.00, 3, TRUE),
(9,  'Cheesecake',          25.00, 3, TRUE),
(10, 'Croissant',           15.00, 3, TRUE),
(11, 'Club Sandwich',       30.00, 4, TRUE),
(12, 'Avocado Toast',       28.00, 4, TRUE),
(13, 'Orange Juice',        18.00, 5, TRUE),
(14, 'Mango Juice',         20.00, 5, TRUE),
(15, 'Mixed Berries Juice', 22.00, 5, FALSE);

/* TABLE 6: ORDERS */
CREATE TABLE Orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    order_date    DATETIME NOT NULL,
    customer_id   INT,
    employee_id   INT,
    branch_id     INT,
    total_amount  DECIMAL(10,2) CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (branch_id)   REFERENCES Branches(branch_id)
);

INSERT INTO Orders VALUES
(1,  '2024-03-01 09:15:00', 1,  2,  1, 42.00),
(2,  '2024-03-01 10:30:00', 2,  3,  1, 65.00),
(3,  '2024-03-02 11:00:00', 3,  5,  2, 38.00),
(4,  '2024-03-02 13:45:00', 4,  6,  2, 74.00),
(5,  '2024-03-03 08:20:00', 5,  2,  1, 24.00),
(6,  '2024-03-03 14:10:00', 6,  8,  3, 64.00),
(7,  '2024-03-04 09:50:00', 7,  9,  4, 32.00),
(8,  '2024-03-04 16:30:00', 8,  10, 5, 50.00),
(9,  '2024-03-05 10:00:00', 9,  2,  1, 28.00),
(10, '2024-03-05 12:00:00', 10, 5,  2, 67.00);

/* TABLE 7: ORDER_ITEMS */
CREATE TABLE Order_Items (
    order_item_id  INT PRIMARY KEY AUTO_INCREMENT,
    order_id       INT,
    item_id        INT,
    quantity       INT CHECK (quantity > 0),
    unit_price     DECIMAL(10,2) CHECK (unit_price > 0),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id)  REFERENCES Menu_Items(item_id)
);

INSERT INTO Order_Items VALUES
(1,  1, 3,  1, 20.00),
(2,  1, 8,  1, 22.00),
(3,  2, 6,  1, 25.00),
(4,  2, 9,  1, 25.00),
(5,  2, 10, 1, 15.00),
(6,  3, 4,  2, 10.00),
(7,  3, 13, 1, 18.00),
(8,  4, 11, 1, 30.00),
(9,  4, 5,  2, 22.00),
(10, 5, 7,  1, 24.00),
(11, 6, 2,  2, 18.00),
(12, 6, 12, 1, 28.00),
(13, 7, 1,  1, 12.00),
(14, 7, 14, 1, 20.00),
(15, 8, 9,  2, 25.00),
(16, 9, 4,  1, 10.00),
(17, 9, 13, 1, 18.00),
(18, 10, 3, 1, 20.00),
(19, 10, 8, 1, 22.00),
(20, 10, 6, 1, 25.00);

/* TABLE 8: SUPPLIERS */
CREATE TABLE Suppliers (
    supplier_id    INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name  VARCHAR(100) NOT NULL,
    phone          VARCHAR(20),
    email          VARCHAR(100),
    city           VARCHAR(50)
);

INSERT INTO Suppliers VALUES
(1, 'Al-Khair Coffee Supplies',  '0126001001', 'alkhair@supply.com',  'Jeddah'),
(2, 'Fresh Dairy Co.',           '0126001002', 'freshdairy@co.com',   'Riyadh'),
(3, 'Golden Bakery Supplies',    '0126001003', 'golden@bakery.com',   'Makkah'),
(4, 'Green Farm Produce',        '0126001004', 'greenfarm@co.com',    'Taif'),
(5, 'Sweet Ingredients Co.',     '0126001005', 'sweet@ingred.com',    'Jeddah');

/* TABLE 9: INGREDIENTS */
CREATE TABLE Ingredients (
    ingredient_id    INT PRIMARY KEY AUTO_INCREMENT,
    ingredient_name  VARCHAR(100) NOT NULL,
    stock_quantity   DECIMAL(10,2) CHECK (stock_quantity >= 0),
    unit             VARCHAR(20),
    supplier_id      INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

INSERT INTO Ingredients VALUES
(1,  'Coffee Beans',     50.00,  'kg',  1),
(2,  'Whole Milk',       100.00, 'L',   2),
(3,  'Oat Milk',         30.00,  'L',   2),
(4,  'Sugar',            80.00,  'kg',  5),
(5,  'Vanilla Syrup',    20.00,  'L',   5),
(6,  'Chocolate Powder', 15.00,  'kg',  5),
(7,  'Flour',            60.00,  'kg',  3),
(8,  'Butter',           25.00,  'kg',  3),
(9,  'Fresh Oranges',    40.00,  'kg',  4),
(10, 'Mangoes',          35.00,  'kg',  4);

/* TABLE 10: PAYMENTS */
CREATE TABLE Payments (
    payment_id      INT PRIMARY KEY AUTO_INCREMENT,
    order_id        INT UNIQUE,
    payment_date    DATETIME NOT NULL,
    amount          DECIMAL(10,2) CHECK (amount > 0),
    payment_method  VARCHAR(50) CHECK (payment_method IN ('Cash', 'Card', 'STC Pay', 'Apple Pay')),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Payments VALUES
(1,  1,  '2024-03-01 09:20:00', 42.00, 'Card'),
(2,  2,  '2024-03-01 10:35:00', 65.00, 'STC Pay'),
(3,  3,  '2024-03-02 11:05:00', 38.00, 'Cash'),
(4,  4,  '2024-03-02 13:50:00', 74.00, 'Apple Pay'),
(5,  5,  '2024-03-03 08:25:00', 24.00, 'Cash'),
(6,  6,  '2024-03-03 14:15:00', 64.00, 'Card'),
(7,  7,  '2024-03-04 09:55:00', 32.00, 'STC Pay'),
(8,  8,  '2024-03-04 16:35:00', 50.00, 'Card'),
(9,  9,  '2024-03-05 10:05:00', 28.00, 'Cash'),
(10, 10, '2024-03-05 12:05:00', 67.00, 'Apple Pay');


/* ============================================================
   ANALYTICAL & OPERATIONAL QUERIES
   ============================================================ */

/* Query 1: Aggregation Functions (Orders & Revenue per Branch) */
SELECT 
    b.branch_id,
    b.branch_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    AVG(o.total_amount) AS avg_order_value
FROM Orders o
JOIN Branches b ON o.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name;

/* Query 2: Left Outer Join (All Customers and Their Orders) */
SELECT 
    c.full_name AS customer_name,
    c.phone,
    o.order_id,
    o.total_amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

/* Query 3: Nested Subquery (Customers Spending Above Average Order Value) */
SELECT full_name, phone
FROM Customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM Orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM Orders)
);

/* Query 4: Filtering with IN, Logical Operators, and LIKE */
SELECT full_name, role, salary
FROM Employees
WHERE role IN ('Barista', 'Cashier')
  AND salary >= 4000
  AND full_name LIKE 'A%';

/* Query 5: Multi-Table Join (5 Tables Linked for Detailed Order Breakdown) */
SELECT 
    c.full_name AS customer,
    e.full_name AS served_by,
    b.branch_name,
    m.item_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS subtotal
FROM Orders o
JOIN Customers c    ON o.customer_id = c.customer_id
JOIN Employees e    ON o.employee_id = e.employee_id
JOIN Branches b     ON o.branch_id   = b.branch_id
JOIN Order_Items oi ON o.order_id    = oi.order_id
JOIN Menu_Items m   ON oi.item_id    = m.item_id;

/* Query 6: UNION ALL (Combined Locations of Branches and Suppliers) */
SELECT location AS city, 'Branch' AS source
FROM Branches
UNION ALL
SELECT city, 'Supplier' AS source
FROM Suppliers;

/* Query 7: GROUP BY, HAVING, and ORDER BY (Top-Selling Menu Items) */
SELECT 
    m.item_id,
    m.item_name,
    SUM(oi.quantity) AS total_ordered,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Menu_Items m ON oi.item_id = m.item_id
GROUP BY m.item_id, m.item_name
HAVING SUM(oi.quantity) > 1
ORDER BY total_sales DESC;

/* Query 8: DISTINCT and Column Aliases (Payment Methods Summary) */
SELECT DISTINCT 
    payment_method AS method,
    COUNT(*) AS times_used,
    SUM(amount) AS total_collected
FROM Payments
GROUP BY payment_method
ORDER BY total_collected DESC;

