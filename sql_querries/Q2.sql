--Q2: What is the direct financial impact of customer churn on our Monthly Recurring Revenue (MRR), 
--and what percentage of total MRR is walking out the door?
SELECT 
    --Total
    COUNT(customerID)                           AS Total_Customers,
    ROUND(SUM(MonthlyCharges), 2)               AS Total_Base_MRR,
    --Churned
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)  AS Churned_Customers,
    ROUND(SUM(CASE WHEN Churn = 1 THEN MonthlyCharges ELSE 0 END), 2) AS Lost_MRR,
    --Retained
    SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END)  AS Retained_Customers,
    ROUND(SUM(CASE WHEN Churn = 0 THEN MonthlyCharges ELSE 0 END), 2) AS Retained_MRR,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN MonthlyCharges ELSE 0 END) 
        / NULLIF(SUM(MonthlyCharges), 0), 2
    ) AS Revenue_Leakage_Percentage
FROM 
    [Telco-churn]