/* -- Project: Xmas Gift Sales Analysis
Data Source: FP20Analytics Challenge 12
-- */

USE fp20c12
GO

/* -----------------------------------------------------------------------------------------------------------------
Question 1: Retrieve sales information including revenue, quantity of products sold, cost, and profit for each Christmas season.
- Exclude data from the 2017-2018 Christmas season due to insufficient 3-month data
- Round revenue, cost, and profit to millions of dollars (2 decimal places)
- Round quantity to thousands (1 decimal place)
*/

SELECT xmas_season, ROUND(SUM(total_sales), 2) as TotalSales, ROUND(SUM(profit), 2) as Profit,
CONVERT(DECIMAL(18,1), SUM(quantity)) as TotalQuantity, COUNT(*) as TotalOrders, ROUND(SUM(cost), 2) as TotalCost 
FROM dbo.v_xmas_sales
GROUP BY xmas_season
ORDER BY 1

/* -----------------------------------------------------------------------------------------------------------------
Question 2: Calculate the growth percentage of revenue, quantity sold, and profit for the most recent Christmas season compared to the previous year
*/

SELECT ROUND((SUM(CASE WHEN  xmas_season = '2021-2022' THEN TotalSales ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2020-2021' THEN TotalSales ELSE 0 END))-100, 2) as GrowthofSales,
ROUND((SUM(CASE WHEN  xmas_season = '2021-2022' THEN Quantity ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2020-2021' THEN Quantity ELSE 0 END))-100, 2) as GrowthofQuantity,
ROUND((SUM(CASE WHEN  xmas_season = '2021-2022' THEN Profit ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2020-2021' THEN Profit ELSE 0 END))-100, 2) as GrowthofProfit
FROM
(
SELECT xmas_season, ROUND(SUM(total_sales), 2) as TotalSales, 
CONVERT(DECIMAL(18,1), SUM(quantity)) as Quantity, ROUND(SUM(cost), 2) as Cost, ROUND(SUM(profit), 2) as Profit
FROM dbo.v_xmas_sales
GROUP BY xmas_season
)s

/* -----------------------------------------------------------------------------------------------------------------
Question 3: Calculate the revenue growth percentage for each Christmas season
*/

SELECT ROUND((SUM(CASE WHEN xmas_season = '2021-2022' THEN TotalSales ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2020-2021' THEN TotalSales ELSE 0 END)-100), 2) as G2021_2022,
ROUND((SUM(CASE WHEN xmas_season = '2020-2021' THEN TotalSales ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2019-2020' THEN TotalSales ELSE 0 END)-100), 2) as G2020_2021,
ROUND((SUM(CASE WHEN xmas_season = '2019-2020' THEN TotalSales ELSE 0 END) *100/ SUM(CASE WHEN xmas_season = '2018-2019' THEN TotalSales ELSE 0 END)-100), 2) as G2019_2020
FROM
(
SELECT xmas_season, ROUND(SUM(total_sales), 2) as TotalSales, 
CONVERT(DECIMAL(18,1), SUM(quantity)) as Quantity, ROUND(SUM(cost), 2) as Cost, ROUND(SUM(profit), 2) as Profit
FROM dbo.v_xmas_sales
GROUP BY xmas_season
)s

/* -----------------------------------------------------------------------------------------------------------------
Question 4: Revenue and percentage contribution of each purchase channel (purchase_type) for each Christmas season
*/

;WITH s as (
SELECT xmas_season, purchase_type, CONVERT(DECIMAL(18,0), total_sales) as total_sales
FROM dbo.v_xmas_sales
), purchase_type as (
SELECT xmas_season, 
SUM(CASE WHEN purchase_type = 'In-store' THEN total_sales ELSE 0 END) as In_store,
SUM(CASE WHEN purchase_type = 'Online' THEN total_sales ELSE 0 END) as [Online],
SUM(CASE WHEN purchase_type = 'Xmas Market' THEN total_sales ELSE 0 END) as Xmas_Market,
SUM(total_sales) as TotalSales
FROM s
GROUP BY xmas_season
)
SELECT xmas_season,
ROUND(In_store * 100 / TotalSales, 2) AS In_storePercentOfTotal, 
ROUND([Online] * 100 / TotalSales, 2) AS OnlinePercentOfTotal,
ROUND(Xmas_Market * 100 / TotalSales, 2) AS Xmas_MarketPercentOfTotal
FROM purchase_type
ORDER BY 1

/* -----------------------------------------------------------------------------------------------------------------
Question 5: Revenue statistics by country (and city). Sort in descending order of revenue.
*/

-- Revenue by country
SELECT country, ROUND(SUM(total_sales), 2) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY country
ORDER BY TotalSales DESC

-- Revenue by city
SELECT city, ROUND(SUM(total_sales), 2) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY city
ORDER BY TotalSales DESC

/* -----------------------------------------------------------------------------------------------------------------
Question 6: Rank countries by highest revenue (or highest revenue growth percentage) for the most recent Christmas season
*/

;WITH s as (
SELECT xmas_season, country, CONVERT(DECIMAL(18,0), total_sales) as total_sales
FROM dbo.v_xmas_sales
), s2 as (
SELECT country, 
SUM(CASE WHEN xmas_season = '2021-2022' THEN total_sales ELSE 0 END) as TotalSales2021_2022,
SUM(CASE WHEN xmas_season = '2020-2021' THEN total_sales ELSE 0 END) as TotalSales2020_2021
FROM s
GROUP BY country
)
SELECT country, TotalSales2021_2022, 
ROUND((TotalSales2021_2022*100/TotalSales2020_2021),2) -100 as GrowthofSales,
ROW_NUMBER() OVER (ORDER BY TotalSales2021_2022 DESC) as Rank
FROM s2


/* -----------------------------------------------------------------------------------------------------------------
Question 7: 
Calculate the revenue proportion by age group
Calculate the revenue proportion by gender
Calculate the revenue proportion by purchase type
*/

-- age group
;WITH product_type AS (
SELECT 
        xmas_season,
        SUM(CASE WHEN product_type = 'Children' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Children,
        SUM(CASE WHEN product_type = 'Teen' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Teen,
        SUM(CASE WHEN product_type = 'Adult' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Adult,
        SUM(CONVERT(DECIMAL(18,0), total_sales)) AS TotalSales
    FROM dbo.v_xmas_sales
    GROUP BY xmas_season
)
SELECT 
    xmas_season,
    ROUND(Children * 100.0 / NULLIF(TotalSales, 0), 2) AS ChildrenPercentOfTotal, 
    ROUND(Teen * 100.0 / NULLIF(TotalSales, 0), 2) AS TeenPercentOfTotal,
    ROUND(Adult * 100.0 / NULLIF(TotalSales, 0), 2) AS AdultPercentOfTotal
FROM product_type
ORDER BY xmas_season;

-- gender
;WITH gender AS (
SELECT 
        xmas_season,
        SUM(CASE WHEN gender = 'Female' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Female,
        SUM(CASE WHEN gender = 'Male' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Male,
        SUM(CONVERT(DECIMAL(18,0), total_sales)) AS TotalSales
    FROM dbo.v_xmas_sales
    GROUP BY xmas_season
)
SELECT 
    xmas_season,
    ROUND(Female * 100.0 / NULLIF(TotalSales, 0), 2) AS FemalePercentOfTotal, 
    ROUND(Male * 100.0 / NULLIF(TotalSales, 0), 2) AS MalePercentOfTotal
FROM gender
ORDER BY xmas_season;

-- purchase type
;WITH s as (
SELECT xmas_season, purchase_type, CONVERT(DECIMAL(18,0), total_sales) as total_sales
FROM dbo.v_xmas_sales
), purchase_type as (
SELECT xmas_season, 
SUM(CASE WHEN purchase_type = 'In-store' THEN total_sales ELSE 0 END) as In_store,
SUM(CASE WHEN purchase_type = 'Online' THEN total_sales ELSE 0 END) as [Online],
SUM(CASE WHEN purchase_type = 'Xmas Market' THEN total_sales ELSE 0 END) as Xmas_Market,
SUM(total_sales) as TotalSales
FROM s
GROUP BY xmas_season
)
SELECT xmas_season,
ROUND(In_store * 100 / TotalSales, 2) AS In_storePercentOfTotal, 
ROUND([Online] * 100 / TotalSales, 2) AS OnlinePercentOfTotal,
ROUND(Xmas_Market * 100 / TotalSales, 2) AS Xmas_MarketPercentOfTotal
FROM purchase_type

/* -----------------------------------------------------------------------------------------------------------------
Question 8: 
Calculate the revenue proportion by purchase type for each age group
Calculate the revenue proportion by payment method for each age group
*/

-- by purchase type for each age group
;WITH purchase_type AS (
SELECT 
        xmas_season, product_type,
        SUM(CASE WHEN purchase_type = 'In-store' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS In_store,
        SUM(CASE WHEN purchase_type = 'Online' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS [Online],
        SUM(CASE WHEN purchase_type = 'Xmas_Market' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Xmas_Market,
        SUM(CONVERT(DECIMAL(18,0), total_sales)) AS TotalSales
    FROM dbo.v_xmas_sales
    GROUP BY xmas_season, product_type
)
SELECT 
    xmas_season, product_type,
    ROUND(In_store * 100 / NULLIF(TotalSales, 0), 2) AS In_storePercentOfTotal, 
    ROUND([Online] * 100 / NULLIF(TotalSales, 0), 2) AS OnlinePercentOfTotal,
    ROUND(Xmas_Market * 100 / NULLIF(TotalSales, 0), 2) AS Xmas_MarketPercentOfTotal
FROM purchase_type
ORDER BY xmas_season;

--  by payment method for each age group
;WITH payment_method AS (
SELECT 
        xmas_season, product_type,
        SUM(CASE WHEN payment_method = 'Cash' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Cash,
        SUM(CASE WHEN payment_method = 'Credit Card' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS CreditCard,
        SUM(CASE WHEN payment_method = 'Debit Card' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS DebitCard,
        SUM(CASE WHEN payment_method = 'PayPal' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS PayPal,
        SUM(CASE WHEN payment_method = 'Other' THEN CONVERT(DECIMAL(18,0), total_sales) ELSE 0 END) AS Other,
        SUM(CONVERT(DECIMAL(18,0), total_sales)) AS TotalSales
    FROM dbo.v_xmas_sales
    GROUP BY xmas_season, product_type
)
SELECT 
    xmas_season, product_type,
    ROUND(Cash * 100.0 / NULLIF(TotalSales, 0), 2) AS CashPercentOfTotal, 
    ROUND(CreditCard * 100.0 / NULLIF(TotalSales, 0), 2) AS CreditCardPercentOfTotal,
    ROUND(DebitCard * 100.0 / NULLIF(TotalSales, 0), 2) AS DebitCardPercentOfTotal,
    ROUND(PayPal * 100.0 / NULLIF(TotalSales, 0), 2) AS PayPalPercentOfTotal,
    ROUND(Other * 100.0 / NULLIF(TotalSales, 0), 2) AS OtherPercentOfTotal
FROM payment_method
ORDER BY xmas_season;

/* -----------------------------------------------------------------------------------------------------------------
Question 9: Analyze sales information by category (product)
*/
-- Analysis by category
-- + Revenue by category
SELECT xmas_season,  product_category,  CONVERT(DECIMAL(18,0), SUM(total_sales)) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_category
ORDER BY 1
-- + Revenue by category for each country
SELECT xmas_season,  product_category, country,  CONVERT(DECIMAL(18,0), SUM(total_sales)) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_category, country
ORDER BY 1
-- + Orders by category
SELECT xmas_season,  product_category, COUNT(*) as TotalOrders
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_category
ORDER BY 1
-- Analysis by product
-- + Revenue by product
SELECT xmas_season,  product_name,  CONVERT(DECIMAL(18,0), SUM(total_sales)) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_name
ORDER BY 1
-- + Revenue by product for each country
SELECT xmas_season,  product_name, country,  CONVERT(DECIMAL(18,0), SUM(total_sales)) as TotalSales
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_name, country
ORDER BY 1
-- + Orders by product
SELECT xmas_season,  product_name, COUNT(*) as TotalOrders
FROM dbo.v_xmas_sales
GROUP BY xmas_season, product_name
ORDER BY 1

/* -----------------------------------------------------------------------------------------------------------------
Question 10: 
On which day of the week do male/female customers typically make purchases?
At what time of day do customers typically make purchases?
*/

-- male
SELECT TOP(1) weekday_name, COUNT(*) as NbofDays
FROM dbo.v_xmas_sales
WHERE gender = 'Male'
GROUP BY weekday_name
ORDER BY NbofDays DESC
-- female
SELECT TOP(1) weekday_name, COUNT(*) as NbofDays
FROM dbo.v_xmas_sales
WHERE gender = 'Female'
GROUP BY weekday_name
ORDER BY NbofDays DESC
-- At what time of day do customers typically make purchases
SELECT TOP(1) [hour], COUNT(*) as NbofHours
FROM dbo.v_xmas_sales
GROUP BY [hour]
ORDER BY NbofHours DESC

