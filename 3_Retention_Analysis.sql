WITH customer_last_purchase AS (
	SELECT
		ca.customerkey,
		ca.cleaned_name,
		ca.orderdate,
		row_number() OVER (PARTITION BY ca.customerkey ORDER BY ca.orderdate DESC) AS rn,
		ca.first_purchase_date,
		ca.cohort_year 
	FROM 
		cohort_analysis ca 
), churned_customers AS (
	SELECT
		clp.customerkey, 
		clp.cleaned_name,
		clp.orderdate AS last_purchase_date,
		CASE
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customer_status,
		clp.cohort_year 
	FROM 
		customer_last_purchase clp
	WHERE
		rn = 1
		AND clp.first_purchase_date < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months'
)
SELECT 
	cc.cohort_year, 
	cc.customer_status,
	count(cc.customerkey ) AS num_customers,
	SUM(count(cc.customerkey )) OVER(PARTITION BY cohort_year) AS total_customers,
	ROUND(count(cc.customerkey ) / SUM(count(cc.customerkey )) OVER(PARTITION BY cohort_year), 2) AS status_percentage
FROM 
	churned_customers cc
GROUP BY
	cc.cohort_year,
	cc.customer_status
	
	