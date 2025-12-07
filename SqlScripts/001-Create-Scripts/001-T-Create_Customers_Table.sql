USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  /* ============================================================
	1.	CREATE Customers TABLE
   ============================================================ */

CREATE TABLE dbo.Customers(
  customer_id  INT IDENTITY(1,1) NOT NULL,
  full_name    NVARCHAR(50)      NOT NULL,
  age          INT               NOT NULL,
  email        NVARCHAR(50)      NULL,
  phone        NVARCHAR(20)      NULL,
  deactivated_at DATE            NULL,
  preferred_payment_method_id INT NULL,  -- FK 
  
  CONSTRAINT [PK_Customers_customer_id] PRIMARY KEY CLUSTERED ([customer_id] ASC)
  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	

--===============| Create Unique Unclustered Index For customer_id |===============--

CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_customer_id] 
	ON [dbo].[Customers]
	([customer_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


--===============| Adding CHECK Constraints |===============--

-- 1. 'age' : Must be between 16 and 120
--==========================================================--
ALTER TABLE dbo.Customers ADD CONSTRAINT
	CK_Customers_Age  
  CHECK (age BETWEEN 16 AND 120)
GO


/* Wire Customers -> PaymentMethods FK */

ALTER TABLE dbo.Customers
ADD CONSTRAINT FK_Customers_PaymentMethods
FOREIGN KEY (preferred_payment_method_id)
REFERENCES dbo.PaymentMethods(payment_method_id);
GO
