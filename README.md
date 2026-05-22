--------------------------------------------------------------------------------
# 📡 Telecom Customer Churn Analysis & Prediction

## 📌 Overview
Every telecommunication company wants to retain their customers for sustainable growth. Understanding why customers leave (churn) and identifying those at high risk before they cancel their subscriptions is crucial for designing effective retention strategies.

The goal of this project is to:
* Explore the dataset to uncover the true drivers of customer churn.
* Build an End-to-End data pipeline connecting SQL Server, Python, and Power BI.
* Build a Machine Learning model to classify and predict customers at risk of churning.
* Provide actionable, data-driven business insights to the executive team.

## 📂 Dataset Information - [Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data)
* **Domain:** Telecommunications
* **Size:** 7,043 customer records.
* **Financial Impact:** Total MRR (Monthly Recurring Revenue) is **$456.12K**.
* **Target variable:** Churn Status (Yes = Churned, No = Retained).

## 🔑 Key Features
* **Demographic:** Gender, Partner, Dependent, SeniorCitizen.
* **Account Info:** Tenure (Months), Contract Type (Month-to-month, One year, Two year), Payment Method, Monthly Charges, Total Charges.
* **Services/Products:** Internet Service (Fiber optic, DSL, No), Count of add-on Services.

## 🎯 Objectives
* **Perform EDA:** Analyze distributions, correlations, and churn rates across various customer segments.
* **Data Engineering:** Use SQL Server to clean, transform, and build views for production.
* **Build ML Models:** Train a Random Forest Classifier in Python to predict future churners.
* **Evaluate Performance:** Assess the model using Confusion Matrix, Precision, Recall, and F1-Score instead of just accuracy.
* **Visualize:** Create an interactive Power BI dashboard with predictive profiling.

## 🛠 Methodology & Tools
* **Database & ETL:** Microsoft SQL Server (Data extraction).
* **Machine Learning:** Python 3, Jupyter Notebook, Scikit-Learn (Random Forest).
* **Data Visualization:** Power BI (Interactive Dashboard, Tooltips, DAX Measures).

## 📊 Key Insights (Data-Driven)
Based on the exploratory data analysis and Power BI visualizations, several critical churn drivers were identified:

* **Overall Business Impact:** 1,869 out of 7,043 customers churned, resulting in an alarming **26.54% churn rate** and an MRR loss of **$139.13K**.
* **High Risk in Early Tenure (Onboarding):** Customers are extremely vulnerable in their first 6 months, with a churn rate peaking at **52.94%**. This rate drops significantly as tenure increases, reaching a low of 11.93% for customers staying over 36 months.
* **Contract Type dictates Loyalty:** Lack of long-term commitment is a massive driver of churn. Customers on **Month-to-month contracts have a 42.71% churn rate**, whereas 1-year (11.27%) and 2-year contracts (2.83%) show exceptionally strong retention.
* **Payment Method Friction:** Customers paying via **Electronic check** exhibit an abnormally high churn rate of **45.29%**, compared to Credit card (15.24%) or Bank transfer (16.71%).
* **Fiber Optic Service Instability:** "Fiber optic" users churn at alarming rates, especially among the "Senior & Alone" demographic (**55.09% churn rate** compared to just 39.92% for standard customers), indicating potential service dissatisfaction or pricing issues for this specific technology.
* **The Power of Add-on Services (Bundling):** Customers with **0 add-on services churn at 45.76%**. The churn rate decreases consistently as more services are added, dropping to an impressive **5.28% for those using 6 add-ons**.
* **Future Risk Prediction:** The Random Forest model identified **292 out of 1,411 (20.69%)** current customers in the test set as "High Risk" of churning. The typical profile of a predicted churner is someone on a Month-to-month contract, paying via Electronic check, using 0-1 add-on services, and currently in their first 6 months.

## 💡 Actionable Recommendations
1. **Revamp the Onboarding Experience:** Since 52.94% of churn happens in the first 6 months, implement a 180-day proactive customer success program to ensure new users see the immediate value of their service.
2. **Incentivize Contract Upgrades:** Offer targeted discounts to the Month-to-month segment (who make up the bulk of churners) to lock them into 1-year contracts.
3. **Investigate Electronic Checks & Fiber Optic:** The IT/Operations team must urgently audit the Electronic check payment gateway for user friction and investigate Fiber Optic network stability in areas with high populations of Senior citizens.
4. **Aggressive Bundling Strategy:** Provide the first month free for Add-on services to at-risk customers. Data proves that getting a customer to use 2 or more add-on services drastically reduces churn probability.

## 🚀 Next Steps
* Automate the data pipeline using SSIS to feed live data into SQL Server.
* Deploy the Random Forest model into production via a REST API.

## 👤 Author
* **Name:** Đặng Quang Hưng
* **GitHub:** [dqhung1306](https://github.com/dqhung1306)
