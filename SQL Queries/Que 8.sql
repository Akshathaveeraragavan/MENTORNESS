/* Which pincode has average amount paid more than 150,000? Take only 'buy' order types */
select delivery_pincode from orders
where order_type='buy'
group by delivery_pincode
having avg(total_amount_paid) > 150000;