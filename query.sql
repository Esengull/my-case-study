SELECT YEAR(SaleDate) AS Year, SUM(Quantity) AS TotalQuantitySold
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY Year;



SELECT 
    p.ProductName,
    YEAR(s.SaleDate) AS Year,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName, YEAR(s.SaleDate)
ORDER BY p.ProductName, Year;


SELECT TOP 1
    p.ProductName,
    SUM(s.Quantity) AS TotalQuantitySold
FROM Sales s
JOIN Products p ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantitySold DESC;