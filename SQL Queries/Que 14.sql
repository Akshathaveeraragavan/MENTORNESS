/* For each product name, print the sum of number of units, total amount paid, total displayed selling price, total mrp of these units, 
and finally the net discount from selling price (i.e. 100.0 - (100.0 * total amount paid / total displayed selling price) & the net discount from mrp (i.e. 100.0 - 100.0 * total amount paid / total mrp) */
select products.product_name , sum(orders.tot_units) as sum_of_units , sum(orders.total_amount_paid) as total_amount_paid, 
sum(orders.displayed_selling_price_per_unit) as total_displaying_price , 
sum(products.mrp) as total_mrp,
(100.0 - (100.0-sum(orders.total_amount_paid))/sum(orders.displayed_selling_price_per_unit)) as net_discount_selling_price,
(100.0 - (100.0-sum(orders.total_amount_paid))/sum(products.mrp)) as net_discount_mrp from orders
join products on orders.product_id=products.MyUnknownColumn
group by products.product_name;


