use mining;
select * from mining;
SELECT
    CustomerID,
    SUM(Quantity * UnitPrice) AS TotalOrderValue
FROM
    mining
GROUP BY
    CustomerID
ORDER BY
    TotalOrderValue DESC;
SELECT
    CustomerID,
    COUNT(DISTINCT StockCode) AS UniqueProductCount
FROM
    mining
GROUP BY
    CustomerID
ORDER BY
    UniqueProductCount DESC;
    SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS PurchaseCount
FROM
     mining
GROUP BY
    CustomerID
HAVING
    PurchaseCount = 1;
SELECT
    A.StockCode AS ProductA,
    B.StockCode AS ProductB,
    COUNT(*) AS PurchaseCount
FROM
    mining
JOIN
    mining B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY
    ProductA, ProductB
ORDER BY
    PurchaseCount DESC;
SELECT
    A.StockCode AS ProductA,
    B.StockCode AS ProductB,
    COUNT(*) AS PurchaseCount
FROM
    mining A
JOIN
    mining B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY
    ProductA, ProductB
ORDER BY
    PurchaseCount DESC;
  SELECT
    CustomerID,
    CASE
        WHEN COUNT(DISTINCT InvoiceNo) > 10 THEN 'High Frequency'
        WHEN COUNT(DISTINCT InvoiceNo) > 5 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS PurchaseFrequencySegment
FROM
    mining
GROUP BY
    CustomerID;
 SELECT
    Country,
    AVG(Quantity * UnitPrice) AS AvgOrderValue
FROM
    mining
GROUP BY
    Country
ORDER BY
    AvgOrderValue DESC;
SELECT
    CustomerID
FROM
    mining
WHERE
    InvoiceDate <= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY
    CustomerID;
SELECT
    A.StockCode AS ProductA,
    B.StockCode AS ProductB,
    CORR(A.Quantity, B.Quantity) AS Correlation
FROM
    mining A
JOIN
    mining B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY
    ProductA, ProductB
HAVING
    Correlation > 0.5
ORDER BY
    Correlation DESC;
    SELECT
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS MonthYear,
    SUM(Quantity * UnitPrice) AS MonthlySales
FROM
    mining
GROUP BY
    MonthYear
ORDER BY
    MonthYear;
SELECT
    A.StockCode AS ProductA,
    B.StockCode AS ProductB,
    CORR(A.Quantity, B.Quantity) AS Correlation
FROM
    mining A
JOIN
    mining B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY
    ProductA, ProductB
HAVING
    Correlation > 0.5
ORDER BY
    Correlation DESC;
SELECT
    A.StockCode AS ProductA,
    B.StockCode AS ProductB,
    ABS(SUM(A.Quantity * B.Quantity) / (SQRT(SUM(A.Quantity * A.Quantity)) * SQRT(SUM(B.Quantity * B.Quantity)))) AS Correlation
FROM
    mining A
JOIN
    mining B ON A.InvoiceNo = B.InvoiceNo AND A.StockCode < B.StockCode
GROUP BY
    ProductA, ProductB
HAVING
    Correlation > 0.5
ORDER BY
    Correlation DESC;

    
    
    
    
    
    
    
    
    
    
    
    


 
 
 
 
 
 
 
 
 
 
 
 
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
    
    
    
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    
    
    
    
    
    
