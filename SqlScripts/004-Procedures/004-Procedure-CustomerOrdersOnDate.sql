USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* =====================================================================================
   STORED PROCEDURE: dbo.CustomerOrdersOnDate

   PURPOSE:
     Returns the full list of products ordered on a given date for one customer,
     including supplier details and line totals.

   PARAMETERS:
     @CustomerId   INT   -- Target customer ID
     @AsOfDate     DATE  -- Optional; if NULL, defaults to today's date
   ===================================================================================== */

CREATE OR ALTER PROCEDURE dbo.CustomerOrdersOnDate
    @CustomerId INT,
    @AsOfDate   DATE = NULL   -- default = today
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @d DATE = COALESCE(@AsOfDate, CONVERT(date, GETDATE()));

    SELECT
        o.order_id,
        o.order_datetime,
        p.product_id,
        p.product_name,
        od.quantity,
        od.unit_price_at_order,
        CAST(od.quantity * od.unit_price_at_order AS DECIMAL(12,2)) AS line_total,
        s.supplier_id,
        s.supplier_name
    FROM dbo.Orders       AS o
    JOIN dbo.OrderDetails AS od ON od.order_id  = o.order_id
    JOIN dbo.Products     AS p  ON p.product_id = od.product_id
    JOIN dbo.Suppliers    AS s  ON s.supplier_id = p.supplier_id
    WHERE o.customer_id = @CustomerId
      AND CONVERT(date, o.order_datetime) = @d
    ORDER BY o.order_datetime DESC, p.product_name;
END;
GO

/* ============================================================
   EXECUTE stored procedure: Get Specific Orders for a Customer
   (Example – commented out for documentation)
   ============================================================ */

-- EXEC dbo.CustomerOrdersOnDate @CustomerId = 3, @AsOfDate = '2025-09-08';
