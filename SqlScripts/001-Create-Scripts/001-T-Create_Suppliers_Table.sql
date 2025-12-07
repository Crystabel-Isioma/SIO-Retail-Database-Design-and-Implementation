USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/* ============================================================
3.	CREATE Suppliers TABLE
   ============================================================ */
CREATE TABLE dbo.[Suppliers](
  supplier_id           INT           IDENTITY(401,1)     NOT NULL,
  supplier_name         NVARCHAR(60)                      NOT NULL,
  phone                 NVARCHAR(20)                      NULL,


  -- PK
	CONSTRAINT [PK_Suppliers_supplier_id] PRIMARY KEY CLUSTERED 
		([supplier_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],

------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for AuthorID  |===============--

CREATE NONCLUSTERED INDEX [IX_Suppliers_supplier_id] 
	ON [dbo].[Suppliers]
	([supplier_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
