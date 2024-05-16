/* Using the per unit procurement cost in product_dim, find which product category has made the most profit in both absolute amount and percentage
Absolute Profit = Total Amt Sold - Total Procurement Cost , Percentage Profit = 100.0 * Total Amt Sold / Total Procurement Cost - 100.0 */
SELECT p.category,
SUM(o.total_amount_paid) AS total_amount_sold,
SUM(o.total_amount_paid) - SUM(o.tot_units * p.procurement_cost_per_unit) AS absolute_profit,
ROUND((100.0 * SUM(o.total_amount_paid)) / SUM(o.tot_units * p.procurement_cost_per_unit) - 100.0, 2) AS percentage_profit
FROM orders o
JOIN products p ON o.product_id = p.MyUnknownColumn
GROUP BY p.category
ORDER BY absolute_profit DESC, percentage_profit DESC;
