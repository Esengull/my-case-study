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
The database consists of two main tables:

1. **Products**: Contains information about the products being sold.
2. **Sales**: Contains details about the sales transactions.

### Table Structures and Sample Data:

#### Products Table
The **Products** table contains product-related information, including product name and price.

| Column Name  | Data Type       | Description                          |
|--------------|-----------------|--------------------------------------|
| ProductID    | INT (Primary Key)| Unique product identifier            |
| ProductName  | NVARCHAR(100)    | Name of the product                  |
| Price        | DECIMAL(10, 2)   | Price of the product in decimal format |

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
```

#### Sales Table
The *Sales table* tracks individual sales transactions, linking back to the products in the Products table using a foreign key.

| Column Name  | Data Type       | Description                          |
|--------------|-----------------|--------------------------------------|
|SaleID	|INT (Primary Key)	|Unique identifier for the sale|
|ProductID	|INT (Foreign Key)	|References ProductID from Products|
|Quantity	|INT	|Number of products sold in the sale|
|SaleDate	|DATETIME	|The date the sale occurred|

Sample Data:
```sql
-- Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Data into Sales Table
INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2024-01-10'),
(2, 2, 5, '2024-01-15'),
(3, 1, 1, '2024-02-20'),
(4, 3, 3, '2024-03-05'),
(5, 2, 7, '2024-03-25'),
(6, 3, 2, '2024-04-12');
```

#### Table Relations:
* Products: Stores product-related information, such as names and prices.
* Sales: Each record represents a sale, including the product sold, quantity sold, and sale date.
*The two tables are linked via the ProductID field in the Sales table, which references the ProductID in the Products table.

## Solution Approach
Steps to Solve the Problem:

#### Calculate Total Sales Amount per Product per Year:

* For each sale in the Sales table, the total sales amount is calculated by multiplying the Quantity by the product's Price.
* We group the results by ProductID and year, summing the total sales amount.
* Determine the Number of Sales per Product per Year:

* For each product, count the number of sales transactions made within a given year.
  
#### Identify the Product with the Highest Sales:

* After calculating the total sales amounts, the product with the highest total sales amount is identified by finding the product with the maximum sum.
