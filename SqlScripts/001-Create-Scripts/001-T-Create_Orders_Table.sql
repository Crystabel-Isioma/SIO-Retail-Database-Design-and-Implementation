USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
7.	CREATE Orders TABLE
   ============================================================ */  
CREATE TABLE dbo.Orders(
  order_id                INT IDENTITY(701,1)         NOT NULL,
  customer_id             INT                         NOT NULL,
  shipping_method         NVARCHAR(15)                NOT NULL,
  status                  NVARCHAR(15)                NOT NULL,
  order_datetime          DATETIME2                   NOT NULL,
  delivered_at            DATE                        NULL,
  shipped_at              DATE                        NULL,
  cancelled_at            DATE                        NULL,



    -- PK
	CONSTRAINT [PK_Orders_order_id] PRIMARY KEY CLUSTERED 
		([order_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],



   -- FK
	CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
		REFERENCES [dbo].[.Customers] ([customer_id]),



  ------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for category_id |===============--

CREATE NONCLUSTERED INDEX [IX_Orders_order_id] 
	ON [dbo].[Orders]
	([order_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


  
  --===============| Adding CHECK Constraints |===============--
--  1. 'Status' : Must be one of the supported options 
--  2. 'ShipMethod' : Must be one of the supported options 
--==========================================================--
 
  ALTER TABLE dbo.Stock 
  ADD CONSTRAINT CK_Orders_Status CHECK (status IN ('Pending','Processing','Shipped','Delivered','Cancelled')),
GO


    ALTER TABLE dbo.Stock 
  ADD CONSTRAINT CK_Orders_ShipMethod CHECK (shipping_method IN ('Air','Sea','Road','Courier','Pickup'))
GO

  
  
