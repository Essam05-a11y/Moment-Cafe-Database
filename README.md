# Moment Café — Relational Database Management System

A comprehensive relational database system designed and implemented in **MySQL** to manage daily operations for **Moment Café**, a multi-branch coffee shop in Makkah, Saudi Arabia.

## Overview
The database models real-world café workflows across **10 normalized tables (up to 3NF)**, covering branch operations, employee records, customer loyalty tracking, menu categorization, order processing, ingredient inventory, supplier management, and payment methods.

## Database Schema (10 Tables)
1. **`Branches`** — Store locations, contact details, and operating hours across Makkah.
2. **`Employees`** — Staff roles (Manager, Barista, Cashier), salaries, hire dates, and branch assignments.
3. **`Customers`** — Registered customer profiles and join dates.
4. **`Menu_Categories`** — Product groupings (Hot Drinks, Cold Drinks, Desserts, Light Meals, Fresh Juices).
5. **`Menu_Items`** — Menu catalog with pricing, category mapping, and availability status.
6. **`Orders`** — Customer order headers linking customers, employees, branches, and totals.
7. **`Order_Items`** — Line-item breakdown resolving the many-to-many relationship between orders and menu items.
8. **`Suppliers`** — External vendor contact details and cities.
9. **`Ingredients`** — Raw material stock levels, units, and supplier links.
10. **`Payments`** — One-to-one payment records supporting Cash, Card, STC Pay, and Apple Pay.

## Key Technical Features
- **3NF Normalization:** Eliminates data redundancy and enforces referential integrity via Primary Keys (`PK`) and Foreign Keys (`FK`).
- **Data Integrity Constraints:** Uses `CHECK`, `NOT NULL`, `UNIQUE`, and `DEFAULT` constraints to validate salaries, prices, stock quantities, and payment methods.
- **Analytical SQL Queries:** Includes 8 operational and reporting queries demonstrating `JOIN` (Inner & Left Outer), `GROUP BY`, `HAVING`, subqueries, `UNION ALL`, and aggregate functions (`COUNT`, `SUM`, `AVG`).

## How to Run
1. Open **MySQL Workbench** (or any MySQL-compatible client).
2. Execute `moment_cafe_database.sql` to create the `moment_cafe` schema, populate sample data, and run the analytical queries.
