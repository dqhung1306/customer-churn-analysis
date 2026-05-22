--Q5: Is there a significant difference in the average financial value (MonthlyCharges and TotalCharges) 
--between retained customers and those who churned?
SELECT  CASE 
            WHEN Churn = 1 THEN 'Churned Customers' ELSE 'Retained Customers'
        END AS CustomerStatus,
        COUNT(*) AS TotalCustomers,
        CAST(AVG(MonthlyCharges)    AS NUMERIC(18, 2))  AS AvgMonthlyCharges,
        CAST(AVG(TotalCharges)      AS NUMERIC(18, 2))  AS AvgTotalCharges
FROM    [Telco-churn]
GROUP BY 
        Churn

