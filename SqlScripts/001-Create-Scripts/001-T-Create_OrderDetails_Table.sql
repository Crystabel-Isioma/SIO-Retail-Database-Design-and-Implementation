USE SIO_Retail;
GO

/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON78
GO

/* ============================================================
8.	CREATE OrderDetails TABLE
   ============================================================ */ 

   CREATE TABLE dbo.OrderDetails(
  order_id                        INT                NOT NULL,
  product_id                      INT                NOT NULL,
  quantity                        INT                NOT NULL,
  unit_price_at_order             DECIMAL(12,2)      NOT NULL,

    -- PK
	CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED (
      [order_id] ASC,
      [ product_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],


  
   -- FK
	CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
		REFERENCES [dbo].[Orders] ([order_id]),

  

   -- FK
	CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
		REFERENCES [dbo].[Products] ([product_id]),


  
  ------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for product_id & order_id |===============--

CREATE NONCLUSTERED INDEX [IX_OrderDetails_Order_Product]
ON [dbo].[OrderDetails]
(
    [order_id] ASC,
    [product_id] ASC
)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


  
    --===============| Adding CHECK Constraints |===============--
-- 'quantity' : Must Not Be Negative
--==========================================================--
 
  ALTER TABLE dbo.OrderDetails
  ADD CONSTRAINT CK_OrderDetails_Qty CHECK (quantity > 0)
GO
