
	  SELECT DISTINCT order_id, order_datetime, order_total
FROM dbo.vw_OrderOverview
ORDER BY order_datetime DESC, order_id;


SELECT *
FROM dbo.vw_OrderOverview
ORDER BY order_datetime DESC, order_id, product_name;
