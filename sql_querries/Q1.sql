--Q1: What is the overall customer churn rate of the company, 
--and how many customers have we lost during the tracked period?
SELECT 
		CAST(100.0 * SUM(CAST(Churn AS NUMERIC(1, 0)))/COUNT(*) AS FLOAT) AS ChurnRate,
		SUM(CAST(Churn AS NUMERIC(1, 0))) AS ChurnedCustomers,
		SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END ) AS LostCustomers
FROM	[Telco-churn]