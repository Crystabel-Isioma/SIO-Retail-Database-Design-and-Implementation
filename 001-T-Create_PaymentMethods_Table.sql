USE SIO_Retail;
GO

/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  /* ============================================================
	      CREATE PaymentMethods TABLE
   ============================================================ */
  
  CREATE TABLE dbo.[PaymentMethods](
  payment_method_id    INT IDENTITY(10,1)     NOT NULL,
  method_name          NVARCHAR(30)           NOT NULL,

  -- PK
  CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED
  ([payment_method_id] ASC)
  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],

  --===============| Create Unique Unclustered Index For payment_method_id |===============--

CREATE UNIQUE NONCLUSTERED INDEX [IX_payment_method_id] 
	ON [dbo].[PaymentMethods]
	([payment_method_id] ASC)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
  --===============| Adding CHECK Constraints |===============================--

-- 1. 'PaymentMethods_Name' : Must be one of the supported options 
--==========================================================================--
ALTER TABLE dbo.[PaymentMethods]
  ADD CONSTRAINT CK_PaymentMethods_Name 
  CHECK (method_name IN ('Card','PayPal','ApplePay','GooglePay','Crypto','BankTransfer'))
GO
