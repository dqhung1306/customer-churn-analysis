--Q3: How does customer tenure (loyalty duration in months) correlate with the likelihood of churn? 
--At which specific monthly milestones do we see the highest spike in cancellations?
--1
SELECT	
    CASE 
        WHEN tenure <= 6    THEN    '0-6 months'
        WHEN tenure <= 12   THEN    '6-12 months'
        WHEN tenure <= 24   THEN    '12-24 months'
        WHEN tenure <= 36   THEN    '24-36 months'
        ELSE                        'More than 36 months'
    END                                             AS TenureSegment, 
    COUNT(*)                                        AS TotalCustomers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)  AS ChurnedCustomers,
    SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END)   AS RetainedCustomers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS ChurnRateByTenure
FROM 
    [Telco-churn]
GROUP BY 
    CASE 
        WHEN tenure <= 6 THEN '0-6 months'
        WHEN tenure <= 12 THEN '6-12 months'
        WHEN tenure <= 24 THEN '12-24 months'
        WHEN tenure <= 36 THEN '24-36 months'
        ELSE 'More than 36 months'
    END
ORDER BY 
    MIN(tenure) ASC;

--2
WITH CTE AS (
    SELECT 
        tenure AS Tenure,
        COUNT(*) AS Total_Subscribers,
        SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Volumetric_Churn,
        ROUND(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / 
              (SELECT COUNT(*) FROM [Telco-churn] WHERE Churn = 1), 2) AS Contribution_To_Total_Churn
    FROM 
        [Telco-churn]
    GROUP BY 
        tenure
)
SELECT TOP 3 
    Tenure,
    Total_Subscribers,
    Volumetric_Churn,
    Contribution_To_Total_Churn
FROM 
    CTE
ORDER BY 
    Volumetric_Churn DESC;