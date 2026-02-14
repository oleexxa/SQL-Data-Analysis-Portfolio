with delivered_orders as 
	(
	select
		o.order_id
		,o.order_status
		,o.customer_id
		,c.customer_unique_id
		,o.order_purchase_timestamp
	from orders o
	join customers c on o.customer_id = c.customer_id
	where o.order_status = 'delivered'
	),
rfm_summary as
	(
	select 
		do.customer_unique_id 
		,sum(op.payment_value) 										as total_spent 
		,count(distinct do.order_id) 								as number_of_orders -- Naprawione: dodano 'do.'
		,datediff('2018-08-29', max(do.order_purchase_timestamp)) 	as recency
	from delivered_orders do
	inner join order_payments op on do.order_id = op.order_id
	group by do.customer_unique_id
	),
rfm_scores as 
	(
	select
		customer_unique_id
	    ,recency
	    ,number_of_orders
	    ,total_spent
		,case
			when recency <= 90 	    then 5
			when recency <= 180 		then 4
			when recency <= 270	    then 3
			when recency <= 450 		then 2
			else 1 
		end as R
		,case 
			when total_spent > 1000 		then 5
			when total_spent > 500 		then 4
			when total_spent > 160		then 3
			when total_spent > 50  		then 2
			else 1 
		end as M
		,case
    			when number_of_orders > 1 	then 'Repeat' 
    			else 'Single' 
    		end as customer_type
	from rfm_summary
	),
final_segments as
	(
	select 
		*
		,case
    			when R = 5 	and M = 5 		then 'Recent Champions'
			when R <= 2 	and M = 5 		then 'At Risk High-Value'
			when R >= 4 					then 'New / Active'
			when R <= 2 and M <= 2 		then 'Lost Low-Value'
			else 'Occasional'	
		end as segment_name
	from rfm_scores 
	)
select 
	segment_name
	,count(customer_unique_id) 											as total_customers
	,round(sum(total_spent), 2) 	    										as total_revenue
	,count(case when customer_type = 'Repeat' then 1 end) 				as repeat_customers_count
	,round(100.0 * sum(total_spent) / sum(sum(total_spent)) over(), 2) 	as revenue_share_pct
from final_segments 	
group by segment_name 

order by total_revenue desc;
