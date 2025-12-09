USE SIO_Retail;
GO

/****** Object:  Table [dbo].[ProductReviews]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/* ============================================================
9.	CREATE ProductReviews TABLE
   ============================================================ */ 
   CREATE TABLE dbo.ProductReviews(
  review_id             INT IDENTITY(801,1)         NOT NULL,
  order_id              INT                         NOT NULL,
  product_id            INT                         NOT NULL,
  customer_id           INT                         NOT NULL,
  rating                INT                         NOT NULL,
  comment               NVARCHAR(100)               NULL,
  created_at            DATE                        NOT NULL,


       -- PK
	CONSTRAINT [PK_ProductReviews_review_id] PRIMARY KEY CLUSTERED 
		([review_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
     ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],

     
  -- FK
	CONSTRAINT [FK_Reviews_Orders] FOREIGN KEY([order_id])
		REFERENCES [dbo].[Orders] ([order_id]),



 -- FK
	CONSTRAINT [FK_Reviews_Products] FOREIGN KEY([product_id])
		REFERENCES [dbo].[Products] ([product_id]),


     
      -- FK
	CONSTRAINT [FK_Reviews_Customers] FOREIGN KEY([customer_id])
		REFERENCES [dbo].[Customers] ([customer_id]),



     
------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for category_id |===============--

CREATE NONCLUSTERED INDEX [IX_ProductReviews_review_id] 
	ON [dbo].[ProductReviews]
	([review_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF,
     ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


     
  --===============| Adding CHECK Constraints |===============--
-- 'Rating' : Must Be Between 1 -5
--==========================================================--
 
  ALTER TABLE dbo.Reviews 
  ADD CONSTRAINT CK_Reviews_Rating CHECK (rating BETWEEN 1 AND 5)
GO     
  
