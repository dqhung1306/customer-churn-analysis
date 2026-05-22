--Q10: How is churn distributed across different customer demographics (Gender, Senior Citizens, and those with Partners or Dependents)? 
--Which demographic segment requires immediate retention campaigns?

WITH DemographicSegments AS (
    SELECT 
            gender,
            SeniorCitizen,
            Partner,
            Dependents,
            COUNT(*) AS Total_Customers,
            SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
            ROUND(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate
    FROM 
            [Telco-churn]
    GROUP BY 
            gender, SeniorCitizen, Partner, Dependents
)
SELECT 
    gender,
    CASE WHEN SeniorCitizen = 1 THEN 'Senior'           ELSE 'Non-Senior'       END AS CitizenStatus,
    CASE WHEN Partner       = 1 THEN 'Has Partner'      ELSE 'No Partner'       END AS PartnerStatus,
    CASE WHEN Dependents    = 1 THEN 'Has Dependents'   ELSE 'No Dependents'    END AS DependentStatus,
    Total_Customers,
    Churned_Customers,
    Churn_Rate,
    RANK() OVER (ORDER BY Churn_Rate DESC) AS Priority_Campaign_Rank
FROM 
    DemographicSegments
ORDER BY 
    Priority_Campaign_Rank ASC