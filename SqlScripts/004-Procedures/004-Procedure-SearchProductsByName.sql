USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

004-Procedure-SearchProductsByName.sql

SET QUOTED_IDENTIFIER ON
GO

/* ========================================================================================================================
   STORED PROCEDURE: dbo.USP_SearchProductsByName

   PURPOSE:
     Searches the Products table for items whose names match a given keyword and 
     returns them ordered by the most recent order date and product activity.

   PARAMETERS:
     @SearchTerm   NVARCHAR(100)
        Keyword or partial name to search (e.g. 'phone', 'TV')

   OUTPUT:
     product_id, product_name, unit_price,
     latest_order_datetime,
     orders_count (how many orders included this product)
   ======================================================================================================================== */

CREATE OR ALTER PROCEDURE dbo.USP_SearchProductsByName
    @SearchTerm NVARCHAR(100)
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
    LEFT JOIN dbo.OrderDetails AS od 
           ON od.product_id = p.product_id
    LEFT JOIN dbo.Orders AS o  
           ON o.order_id = od.order_id
    WHERE p.product_name LIKE N'%' + @SearchTerm + N'%'
    GROUP BY 
        p.product_id, 
        p.product_name, 
        p.unit_price
    ORDER BY
        CASE WHEN MAX(o.order_datetime) IS NULL THEN 1 ELSE 0 END,  -- push products with zero orders to bottom
        MAX(o.order_datetime) DESC,
        p.product_name;
END;
GO

/* ============================================================
   EXECUTE stored procedure: Search Products by Name
   (Example – commented out for documentation)
   ============================================================ */

-- EXEC dbo.USP_SearchProductsByName N'phone';
