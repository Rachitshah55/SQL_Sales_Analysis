
WITH customer_ltv AS (
	SELECT 
		customerkey,
		cleaned_name,
		SUM(total_net_revenue) AS total_ltv
	FROM
		cohort_analysis ca 
	GROUP BY 
		ca.customerkey, 
		ca.cleaned_name
), customer_segments AS (
	SELECT 
		PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv ) AS ltv_25th_percentile,
		PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv ) AS ltv_75th_percentile
	FROM customer_ltv
), segment_value AS (
	SELECT
		cl.*,
		CASE 
			WHEN cl.total_ltv < cs.ltv_25th_percentile THEN '1 - Low-value'
			WHEN cl.total_ltv BETWEEN cs.ltv_25th_percentile AND cs.ltv_75th_percentile  THEN '2 - Mid-value'
			WHEN cl.total_ltv > cs.ltv_75th_percentile THEN '3 - High-value'
		END AS customer_segment
		
	FROM 
		customer_ltv cl,
		customer_segments cs
)
SELECT
	sv.customer_segment,
	SUM(sv.total_ltv ) AS total_ltv,
	COUNT(sv.customerkey ) AS customer_count,
	SUM(sv.total_ltv ) / COUNT(sv.customerkey ) AS avg_customer_value
FROM 
	segment_value sv
GROUP BY
	sv.customer_segment 
ORDER BY 
	sv.customer_segment DESC

