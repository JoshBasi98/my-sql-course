SELECT
    p.PropertyType
    ,COUNT(*) AS NumberOfSales
FROM
    PricePaidSW12 p
GROUP BY p.PropertyType

order by NumberOfSales desc;

-- Number of Sales by Year
SELECT
    YEAR(p.TransactionDate) as TheYear
    ,COUNT(*) AS NumberOfSales
FROM
    PricePaidSW12 p
GROUP BY YEAR(p.TransactionDate) 

ORDER BY TheYear;

-- What was the total market value in £ Millions of all the sales each year?

SELECT
    YEAR(p.TransactionDate) as TheYear
    ,COUNT(*) AS NumberOfSales
    ,SUM(p.Price)/1000000.0 as MarketValue
FROM
    PricePaidSW12 p
GROUP BY YEAR(p.TransactionDate) 

ORDER BY TheYear;


-- What are the earliest and latest dates of a sale?
SELECT 
    MIN(p.TransactionDate) AS EarliestSaleDate,
    MAX(p.TransactionDate) AS LatestSaleDate
FROM 
    PricePaidSW12 p;

-- List all the sales in 2018 between £400,000 and £500,000 in Cambray Road (a street in SW12)
SELECT *
FROM PricePaidSW12
WHERE 
    YEAR(TransactionDate) = 2018
    AND Price BETWEEN 400000 AND 500000
    AND Street = 'Cambray Road';