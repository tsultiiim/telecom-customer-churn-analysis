SHOW DATABASES;
use customer_retention;
show tables;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT *
FROM customers
LIMIT 5;

SELECT
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract;

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM customers
GROUP BY Contract
ORDER BY Churn_Rate DESC;

-- ============================================
-- Business Question 2
-- Does Payment Method influence churn?
-- ============================================

SELECT
    PaymentMethod,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM customers
GROUP BY PaymentMethod
ORDER BY Churn_Rate DESC;

-- ============================================
-- Business Question 3
-- Does Internet Service influence churn?
-- ============================================

SELECT
    InternetService,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM customers
GROUP BY InternetService
ORDER BY Churn_Rate DESC;

SELECT
CASE
    WHEN tenure <= 12 THEN '0-12 Months'
    WHEN tenure <= 24 THEN '13-24 Months'
    WHEN tenure <= 48 THEN '25-48 Months'
    ELSE '49+ Months'
END AS Tenure_Group,

COUNT(*) AS Total_Customers,

SUM(CASE
        WHEN Churn='Yes' THEN 1
        ELSE 0
    END) AS Churned_Customers,

ROUND(
SUM(CASE
        WHEN Churn='Yes' THEN 1
        ELSE 0
    END)*100/COUNT(*),2
) AS Churn_Rate

FROM customers

GROUP BY Tenure_Group

ORDER BY
CASE
    WHEN Tenure_Group='0-12 Months' THEN 1
    WHEN Tenure_Group='13-24 Months' THEN 2
    WHEN Tenure_Group='25-48 Months' THEN 3
    ELSE 4
END;

SELECT
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge,
    ROUND(MIN(MonthlyCharges),2) AS Min_Charge,
    ROUND(MAX(MonthlyCharges),2) AS Max_Charge
FROM customers
GROUP BY Churn;

SELECT
    Churn,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charges,
    ROUND(MIN(TotalCharges),2) AS Min_Total_Charges,
    ROUND(MAX(TotalCharges),2) AS Max_Total_Charges
FROM customers
GROUP BY Churn;

SELECT
    SeniorCitizen,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) *100.0 /
        COUNT(*),
    2) AS Churn_Rate
FROM customers
GROUP BY SeniorCitizen
ORDER BY Churn_Rate DESC;