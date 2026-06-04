SELECT *
FROM ['Sample - Superstore$']

SELECT *
FROM ['Sample - Superstore$']
ORDER BY [Row ID];

-- Menghitung jumlah baris
SELECT COUNT (*) AS TotalRows
FROM ['Sample - Superstore$']

-- Cek total Sales, Profit dan Quantity
SELECT
SUM(Sales) AS TotalSales,
SUM(Profit) AS TotalProfit,
SUM(Quantity) AS TotalQuantity
FROM ['Sample - Superstore$']

-- Analisis penjualan berdasarkan kategori
SELECT 
Category,
SUM(Sales) AS TotalSales,
SUM(Profit) AS TotalProfit,
SUM(Quantity) AS TotalQuantity
FROM ['Sample - Superstore$']
GROUP BY Category
ORDER BY TotalSales DESC

-- Cek kategori yang mengalami kerugian
SELECT 
Category,
SUM(Profit) AS total_profit
FROM ['Sample - Superstore$']
GROUP BY Category
HAVING SUM(Profit) < 0;

-- Top 10 barang paling laku
SELECT TOP 10
    [Product Name],
    SUM(Quantity) AS total_terjual,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ['Sample - Superstore$']
GROUP BY [Product Name]
ORDER BY total_terjual DESC;

-- Analisis per region
SELECT 
Region,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM ['Sample - Superstore$']
GROUP BY Region
ORDER BY total_sales DESC;

-- Apakah diskon mempengaruhi profit?
SELECT 
    Discount,
    COUNT(*) AS jumlah_transaksi,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ['Sample - Superstore$']
GROUP BY Discount
ORDER BY Discount;

SELECT
    Discount,
    AVG(Profit) AS rata_profit
FROM ['Sample - Superstore$']
GROUP BY Discount
ORDER BY Discount;

-- Penjualan per Tahun
SELECT 
    YEAR([Order Date]) AS tahun,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ['Sample - Superstore$']
GROUP BY YEAR([Order Date])
ORDER BY tahun;

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE '%Superstore%';
