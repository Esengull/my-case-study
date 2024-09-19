# Database Case Study: Product Sales Analysis

## Problem Statement

A store wants to track its product sales. The store has a database with product sales data and aims to:
1. Analyze the sales to find the **total sales amount** and **number of sales for each product per year**.
2. Determine the **product with the highest total sales amount**.

### Key Objectives:
- **Total Sales Amount**: The sum of the product of quantity sold and product price.
- **Number of Sales**: The total number of sales transactions for each product.
- **Product with Highest Sales**: Identify the product with the maximum total sales value.

## Database Structure

### Tables:
1. **Products**: Contains information about the products being sold.
2. **Sales**: Contains details about the sales transactions.

### Table Structures and Sample Data:

#### Products Table
| Column Name  | Data Type       | Description           |
|--------------|-----------------|-----------------------|
| ProductID    | INT (Primary Key)| Unique product identifier |
| ProductName  | NVARCHAR(100)    | Name of the product    |
| Price        | DECIMAL(10, 2)   | Price of the product   |

Sample Data:
```sql
-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Insert Data into Products Table
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1500.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00);
