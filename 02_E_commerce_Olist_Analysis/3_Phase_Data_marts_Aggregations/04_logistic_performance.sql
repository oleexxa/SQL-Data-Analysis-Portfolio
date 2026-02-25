drop table if exists logistic_performance;

create table logistic_performance as
	select
		c.customer_state      
    		,COUNT(*) AS total_orders
		,round(avg(datediff(o.order_estimated_delivery_date, o.order_purchase_timestamp)), 1)			as promised_delivery_time
		,round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1)			as actual_delivery_time
		,round(avg(datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date)), 1)	as delay_days
		,round(100.0 * sum(case when datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date) > 0 then 1 else 0 end) / count(*), 1) as pct_late
    		,sum(case when datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date) > 0 then 1 else 0 end) as late_orders
    		,sum(case when datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date) < 0 then 1 else 0 end) as early_orders
    		,sum(case when datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date) = 0 then 1 else 0 end) as on_time_orders
from orders o
join customers c on o.customer_id = c.customer_id
where
    o.order_status = 'delivered'
    and o.order_delivered_customer_date IS NOT NULL
    and o.order_delivered_customer_date != ''          
    and o.order_estimated_delivery_date IS NOT NULL
    and o.order_estimated_delivery_date != ''          
    and o.order_purchase_timestamp IS NOT NULL
    and o.order_purchase_timestamp != ''
group by c.customer_state
order by total_orders desc;	

select 	* from logistic_performance
		
	