--Q8: How does operational friction impact customer loyalty? 
--What are the average numbers of administrative (numAdminTickets) 
--and technical (numTechTickets) support tickets opened by churned customers compared to active ones?

--2. Micro View: Product Infrastructure vs Support Matrix
WITH ServiceMatrix AS (
    SELECT 
        InternetService,
        TechSupport,
        COUNT(*) AS TotalCustomers,
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
        ROUND(AVG(MonthlyCharges), 2) AS AvgMonthlyCharges
    FROM 
        [Telco-churn]
    WHERE 
        InternetService <> 'No' -- Chỉ xét những người có dùng Internet
    GROUP BY 
        InternetService, TechSupport
)
SELECT 
    InternetService,
    TechSupport,
    TotalCustomers,
    ChurnedCustomers,
    AvgMonthlyCharges,
    CAST(100.0 * ChurnedCustomers / TotalCustomers AS NUMERIC(18, 2)) AS Churn_Rate,
    RANK() OVER(ORDER BY (100.0 * ChurnedCustomers / TotalCustomers) DESC) AS Risk_Rank
FROM 
    ServiceMatrix
ORDER BY 
    Risk_Rank;