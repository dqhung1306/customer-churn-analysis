--Q4: Which contract types (Month-to-month, One year, Two year) exhibit the highest risk of churn, 
--and how do payment methods interact with these contract types to influence customer retention?
-- 1
SELECT 
	Contract,PaymentMethod,
	COUNT(*) AS Total_Customers,
	SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
	CAST(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) AS Churn_Rate
FROM [Telco-churn]
GROUP BY Contract, PaymentMethod
order by Churn_Rate DESC;
