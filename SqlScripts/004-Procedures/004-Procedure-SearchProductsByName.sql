USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

004-Procedure-SearchProductsByName.sql

SET QUOTED_IDENTIFIER ON
GO

/* ==================================================================================================================
    Search the products table by keyword in product name & Returns results ordered by the most recent Order Date.
   ================================================================================================================== */

CREATE OR ALTER PROCEDURE dbo.USP_SearchProductsByName
    @SearchTerm NVARCHAR(100)   -- e.g. N'phone', N'%TV%'
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.product_id,
        p.product_name,
        p.unit_price,
        MAX(o.order_datetime) AS latest_order_datetime,
        COUNT(DISTINCT o.order_id) AS orders_count
    FROM dbo.Products AS p
    LEFT JOIN dbo.OrderDetails AS od ON od.product_id = p.product_id
    LEFT JOIN dbo.Orders       AS o  ON o.order_id    = od.order_id
    WHERE p.product_name LIKE N'%' + @SearchTerm + N'%'
    GROUP BY p.product_id, p.product_name, p.unit_price
    ORDER BY
        CASE WHEN MAX(o.order_datetime) IS NULL THEN 1 ELSE 0 END,
        MAX(o.order_datetime) DESC,
        p.product_name;
END;
GO

/* ============================================================
    EXECUTE stored procedure ; Search Products by Name
   ============================================================ */

-- EXEC dbo.USP_SearchProductsByName N'phone';
