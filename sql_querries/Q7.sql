--Q7: Do value-added security services (such as OnlineSecurity, OnlineBackup, and TechSupport) 
--successfully act as an anchor to lower customer churn rates?
SELECT	CASE WHEN OnlineSecurity	= 1 THEN 'Yes' ELSE 'No' END	AS HasOnlineSecurity,
		CASE WHEN OnlineBackup		= 1 THEN 'Yes' ELSE 'No' END	AS HasOnlineBackup,
		CASE WHEN TechSupport		= 1 THEN 'Yes' ELSE 'No' END	AS HasTechSupport,
		CAST (100.0 * AVG(CAST(Churn AS FLOAT)) AS numeric(18, 2))	AS ChurnRate 
FROM	[Telco-churn]
GROUP BY 
		CASE WHEN OnlineSecurity	= 1 THEN 'Yes' ELSE 'No' END,
		CASE WHEN OnlineBackup		= 1 THEN 'Yes' ELSE 'No' END,
		CASE WHEN TechSupport		= 1 THEN 'Yes' ELSE 'No' END
ORDER BY ChurnRate ASC