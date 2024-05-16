SELECT c.first_name,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '01' THEN 1 ELSE 0 END) AS Jan,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '02' THEN 1 ELSE 0 END) AS Feb,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '03' THEN 1 ELSE 0 END) AS Mar,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '04' THEN 1 ELSE 0 END) AS Apr,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '05' THEN 1 ELSE 0 END) AS May,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '06' THEN 1 ELSE 0 END) AS Jun,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '07' THEN 1 ELSE 0 END) AS Jul,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '08' THEN 1 ELSE 0 END) AS Aug,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '09' THEN 1 ELSE 0 END) AS Sep,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '10' THEN 1 ELSE 0 END) AS Oct,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '11' THEN 1 ELSE 0 END) AS Nov,
    SUM(CASE WHEN SUBSTR(o.order_date, 4, 2) = '12' THEN 1 ELSE 0 END) AS Dece
FROM customers AS c INNER JOIN orders AS o ON c.primary_pincode = o.delivery_pincode WHERE o.order_type = 'buy' GROUP BY  c.first_name;