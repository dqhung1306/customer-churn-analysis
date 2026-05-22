--Q6: Does the type of internet service (Fiber optic vs. DSL) play a role in customer churn? Are Fiber optic users more volatile?
SELECT 
		InternetService,
		COUNT(*)																				AS TotalCustomers,
		SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END)												AS ChurnedCustomers,
		CAST(100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*) AS NUMERIC(18, 2))	AS ChurnRateByService,
		SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END)												AS RetainedCustomers,
		CAST(100.0 * SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END) / COUNT(*) AS NUMERIC(18, 2))	AS RetentionRateByService
FROM	[Telco-churn]
GROUP BY 
		InternetService