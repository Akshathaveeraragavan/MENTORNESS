/* For every customer, print how many total units were ordered, how many units were ordered from their primary_pincode and how many were ordered not from the
primary_pincode. Also calulate the percentage of total units which were ordered from primary_pincode(remember to multiply the numerator by 100.0). 
Sort by the percentage column in descending order. */
SELECT
    o.cust_id,
    SUM(o.tot_units) AS total_units_ordered,
    SUM(CASE WHEN o.delivery_pincode = c.primary_pincode THEN o.tot_units ELSE 0 END) AS units_ordered_primary_pincode,
    SUM(CASE WHEN o.delivery_pincode != c.primary_pincode THEN o.tot_units ELSE 0 END) AS units_ordered_not_primary_pincode,
    ROUND((100.0 * SUM(CASE WHEN o.delivery_pincode = c.primary_pincode THEN o.tot_units ELSE 0 END)) / SUM(o.tot_units), 2) AS percentage_ordered_primary_pincode
FROM orders o JOIN customers c ON o.cust_id = c.cust_id
GROUP BY o.cust_id
ORDER BY percentage_ordered_primary_pincode DESC;
