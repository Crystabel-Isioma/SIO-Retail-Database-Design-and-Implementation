USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Addresses]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
  
  /* ============================================================
11.	CREATE Addresses TABLE
   ============================================================ */ 

   CREATE TABLE dbo.Addresses(
  address_id                   INT IDENTITY(201,1)           NOT NULL,
  customer_id                  INT                           NOT NULL,
  address_type                 NVARCHAR(10)                  NOT NULL,  -- Billing/Shipping
  line1                        NVARCHAR(50)                  NOT NULL,
  line2                        NVARCHAR(50)                  NULL,
  city                         NVARCHAR(30)                  NOT NULL,
  state                        NVARCHAR(30)                  NULL,
  country                      NVARCHAR(5)                   NOT NULL,  -- NG/FR/MA
  postal_code                  NVARCHAR(10)                  NULL,



      -- PK
	CONSTRAINT [PK_Addresses_address_id] PRIMARY KEY CLUSTERED 
		([address_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
     ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],


      -- FK
	CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY([customer_id])
		REFERENCES [dbo].[Customers] ([customer_id]),



     
     ------------------------------------------------------------------------------------
--===============| Create Nonclustered Index for category_id |===============--

CREATE NONCLUSTERED INDEX [IX_Addresses_address_id] 
	ON [dbo].[Addresses]
	([address_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, 
     ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO



     
       --===============| Adding CHECK Constraints |===============--
-- 'Type' : Must be one of the supported options 
--==========================================================--
 
  ALTER TABLE dbo.Stock 
  ADD CONSTRAINT CK_Addresses_Type CHECK (address_type IN ('Billing','Shipping'))
GO
 
