drop table if exists sales_trends;

create table sales_trends as
	select
		cast(year(order_purchase_timestamp) as char)			as year
		,month(order_purchase_timestamp)  					as month
		,sum(payment_value) 									as total_revenue
		,count(distinct o.order_id) 							as number_of_orders
		,count(distinct customer_unique_id)                  as number_of_customer
	from orders o
	join order_payments p 	on o.order_id = p.order_id
	join customers c 		on o.customer_id = c.customer_id
	where order_status = 'delivered'
	group by 1, 2
	
select * from sales_trends

