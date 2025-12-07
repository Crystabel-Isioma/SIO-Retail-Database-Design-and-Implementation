USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Stock]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
6.	CREATE Stock TABLE
   ============================================================ */ 
CREATE TABLE dbo.Stock(
  product_id         INT       NOT NULL,
  stock_level        INT       NOT NULL,
  last_updated       DATE      NULL,


  -- PK
	CONSTRAINT [PK_Stock_product_id] PRIMARY KEY CLUSTERED 
		([product_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],


  
  -- FK
	CONSTRAINT [FK_Stock_Products] FOREIGN KEY([product_id])
		REFERENCES [dbo].[Products] ([product_id]),


  ------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for product_id |===============--

CREATE NONCLUSTERED INDEX [IX_Stock_product_id] 
	ON [dbo].[Stock]
	([product_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


  
  --===============| Adding CHECK Constraints |===============--
-- 'stock_level' : Must Not Be Negative
--==========================================================--
 
  ALTER TABLE dbo.Stock 
  ADD CONSTRAINT CK_Stock_NonNeg CHECK (stock_level >= 0)
GO
