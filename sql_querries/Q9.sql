--Q9: Is there a clear "tipping point" (a threshold number of technical or administrative complaints) 
--where the probability of a customer churning increases drastically?
--2. Product Stickiness Threshold Analysis using LAG()
WITH ServiceCount AS (
    SELECT 
        customerID,
        Churn,
        (
            CASE WHEN OnlineSecurity = 1 THEN 1 ELSE 0 END +
            CASE WHEN OnlineBackup = 1 THEN 1 ELSE 0 END +
            CASE WHEN DeviceProtection = 1 THEN 1 ELSE 0 END +
            CASE WHEN TechSupport = 1 THEN 1 ELSE 0 END +
            CASE WHEN StreamingTV = 1 THEN 1 ELSE 0 END +
            CASE WHEN StreamingMovies = 1 THEN 1 ELSE 0 END
        ) AS Add_on_Services
    FROM 
        [Telco-churn]
),
ServiceAggregation AS (
    SELECT 
        Add_on_Services,
        COUNT(*) AS Total_Customers,
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
        ROUND(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate
    FROM 
        ServiceCount
    GROUP BY 
        Add_on_Services
)
SELECT 
    Add_on_Services,
    Total_Customers,
    Churned_Customers,
    Churn_Rate AS Churn_Prob,
    LAG(Churn_Rate, 1) OVER (ORDER BY Add_on_Services ASC) AS Previous_Churn_Rate,
    CAST(LAG(Churn_Rate, 1) OVER (ORDER BY Add_on_Services ASC) - Churn_Rate AS NUMERIC(18, 2)) AS Risk_Reduction
FROM 
    ServiceAggregation
ORDER BY 
    Add_on_Services ASC