USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  /* ============================================================
	1.	CREATE Customers TABLE
   ============================================================ *//* ============================================================
4.	CREATE Category TABLE
   ============================================================ */
  
CREATE TABLE dbo.[Category](
  category_id       INT IDENTITY(501,1)       NOT NULL,
  category_name     NVARCHAR(20)              NOT NULL,
  description       NVARCHAR(100)              NULL,


-- PK
	CONSTRAINT [PK_Category_category_id] PRIMARY KEY CLUSTERED 
		([category_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, 
		ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],

------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for category_id |===============--

CREATE NONCLUSTERED INDEX [IX_Category_category_id] 
	ON [dbo].[Category]
	([category_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for category_name |===============--

CREATE NONCLUSTERED INDEX [IX_Category_category_name] 
	ON [dbo].[Category]
	([category_name] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
