SELECT order_id, displayed_selling_price_per_unit,
    ROUND(((displayed_selling_price_per_unit - total_amount_paid) / displayed_selling_price_per_unit) * 100, 2) AS discount_percentage
FROM (
    SELECT
        order_id,
        displayed_selling_price_per_unit,
        CASE
            WHEN order_type != 'return' THEN displayed_selling_price_per_unit-- No discount for non-returned orders
            ELSE displayed_selling_price_per_unit -- Assume the same selling price for returned orders
        END AS total_amount_paid
    FROM orders ) AS subquery
WHERE total_amount_paid < displayed_selling_price_per_unit
    AND total_amount_paid IS NOT NULL
    AND displayed_selling_price_per_unit is NOT NULL
    AND order_id IS NOT NULL
    AND order_id NOT IN (SELECT order_id FROM orders WHERE order_type = 'return')
    AND ROUND(((displayed_selling_price_per_unit - total_amount_paid) / displayed_selling_price_per_unit) * 100, 2) > 10.10
ORDER BY discount_percentage DESC;
