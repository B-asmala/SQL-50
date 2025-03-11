SELECT p.product_id, COALESCE(round(sum(p.price * u.units) / sum(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id AND u.purchase_date <= p.end_date AND u.purchase_date >= p.start_date
GROUP BY p.product_id;
