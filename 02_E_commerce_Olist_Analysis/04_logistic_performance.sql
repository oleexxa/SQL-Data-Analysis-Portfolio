drop table if exists logistic_performance;

create table logistic_performance as
	select
		round(avg(datediff(o.order_estimated_delivery_date, o.order_purchase_timestamp)), 1)		as promised_delivery_time
		,round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1)		as actual_delivery_time
		,round(avg(datediff(o.order_delivered_customer_date, o.order_estimated_delivery_date)), 1)	as delay_days
		,c.customer_city
		,c.customer_state
	from orders o
	join customers c on o.customer_id = c.customer_id
	where 
		o.order_status = 'delivered' 
	and o.order_delivered_customer_date 	> ' '
	and o.order_estimated_delivery_date	> ' '
	and o.order_purchase_timestamp 		> ' '
	group by c.customer_city, c.customer_state
	
select 	* from logistic_performance
		
	