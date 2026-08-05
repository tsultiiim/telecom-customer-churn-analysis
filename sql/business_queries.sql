SELECT
    Contract,
    Churn,
    COUNT(*) AS customer_count
FROM customers
GROUP BY Contract, Churn
ORDER BY Contract;