-- This query calculates the total purchase amount from all records in the RFM_TABLE.
SELECT SUM(Purchase) AS SUM_of_Purchase FROM RFM_TABLE;

-- This query sums Purchase values for specific RFM scores only: 444, 443, 434, and 344.
SELECT SUM(Purchase) AS SUM_of_Purchase FROM RFM_TABLE WHERE rfm_score IN (444, 443, 434, 344);

-- Sums purchases grouped by RFM score, filtering to scores 444 and 111, and sorts results by descending score.
SELECT rfm_score, SUM(Purchase) AS SUM_of_Purchase FROM RFM_TABLE WHERE rfm_score IN (444, 111) GROUP BY rfm_score ORDER BY rfm_score DESC;

-- Retrieves raw customer data with purchase date and RFM descriptive labels.
SELECT CUST_ID AS Customer_Identifier, PurchaseDate, RECENCY_DESC, FREQUENCY_DESC, MONETARY_DESC FROM RFM_TABLE;

-- Aggregates total purchases for each RFM score where RECENCY_DESC is not blank.
SELECT rfm_score, SUM(TotalPurchaseNet) AS SUM_of_TotalPurchaseNet FROM RFM_TABLE WHERE RECENCY_DESC IS NOT NULL GROUP BY rfm_score;

-- Counts the number of records for each RFM score greater than 111.
SELECT rfm_score, COUNT(*) AS COUNT_of_rfm_score FROM RFM_TABLE WHERE rfm_score > 111 GROUP BY rfm_score ORDER BY rfm_score DESC;

-- Counts RFM score records grouped by store description.
SELECT STORE_DESC, COUNT(rfm_score) AS COUNT_of_rfm_score FROM RFM_TABLE GROUP BY STORE_DESC;

-- Filters and counts the product occurrences for PRODUCT_DESC = '111'.
SELECT PRODUCT_DESC, COUNT(PRODUCT_DESC) AS COUNT_of_PRODUCT_DESC FROM RFM_TABLE WHERE PRODUCT_DESC IN ('111') GROUP BY PRODUCT_DESC ORDER BY PRODUCT_DESC DESC;

-- Retrieves products that occur exactly twice.
SELECT PRODUCT_DESC, COUNT(PRODUCT_DESC) AS COUNT_of_PRODUCT_DESC FROM RFM_TABLE GROUP BY PRODUCT_DESC HAVING COUNT(PRODUCT_DESC) = 2;

-- Retrieves and sorts products that occur more than twice.
SELECT PRODUCT_DESC, COUNT(PRODUCT_DESC) AS COUNT_of_PRODUCT_DESC FROM RFM_TABLE GROUP BY PRODUCT_DESC HAVING COUNT(PRODUCT_DESC) > 2 ORDER BY PRODUCT_DESC DESC, COUNT(PRODUCT_DESC) DESC;

-- Aggregates total purchases per year and RFM score, limited to scores 444 and 121.
SELECT YEAR, rfm_score, SUM(TotalPurchaseNet) AS SUM_of_TotalPurchaseNet FROM RFM_TABLE WHERE rfm_score IN (444, 121) GROUP BY YEAR, rfm_score ORDER BY YEAR ASC;

