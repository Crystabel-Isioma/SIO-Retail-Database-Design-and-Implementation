/* ============================================================
5.	CREATE Products TABLE
   ============================================================ */ 
CREATE TABLE dbo.Products(
  product_id       INT IDENTITY(1001,1)         NOT NULL,
  product_name     NVARCHAR(60)                 NOT NULL,
  unit_price       DECIMAL(12,2)                NOT NULL,
  supplier_id      INT                          NOT NULL,
  category_id      INT                          NOT NULL,

  
  -- PK
	CONSTRAINT [PK_Products_product_id] PRIMARY KEY CLUSTERED 
		([product_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],

  
 -- FK
	CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([supplier_id])
		REFERENCES [dbo].[Suppliers] ([supplier_id]),

  
 -- FK
	CONSTRAINT [FK_Products_Category] FOREIGN KEY([category_id])
		REFERENCES [dbo].[Category] ([category_id]),

  -- ====================== Create Nonclustered Index for unit_price ======================

CREATE NONCLUSTERED INDEX [IX_Products_product_id]
  ON [dbo].[Products] (product_id ASC)
WITH (
    PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON,  ALLOW_PAGE_LOCKS = ON);
GO

  
-- ====================== Create Nonclustered Index for product_name ======================

CREATE NONCLUSTERED INDEX [IX_Products_ProductName]
ON [dbo].[Products]
  (product_name ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
      DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON);
GO


-- ====================== Create Nonclustered Index for unit_price ======================

CREATE NONCLUSTERED INDEX [IX_Products_UnitPrice]
  ON [dbo].[Products] (unit_price ASC)
WITH (
    PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON,  ALLOW_PAGE_LOCKS = ON);
GO


  
  --===============| Adding CHECK Constraints |===============--
-- 'unit_price' : Must Be Positive.
--==========================================================--
 
  ALTER TABLE dbo.Products 
  ADD CONSTRAINT CK_Products_Price_Positive CHECK (unit_price > 0)
