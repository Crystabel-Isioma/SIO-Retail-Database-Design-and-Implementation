USE SIO_Retail;
GO

/****** Object:  Table [dbo].[OrderStatusHistory]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/* ============================================================
10.	CREATE OrderStatusHistory TABLE
   ============================================================ */ 

CREATE TABLE dbo.OrderStatusHistory(
  history_id                          INT IDENTITY(901,1)           NOT NULL,
  order_id                            INT                           NOT NULL,
  status                              NVARCHAR(15)                  NOT NULL,
  status_changed_at                   DATETIME2                     NOT NULL,
 
  
    -- PK
	CONSTRAINT [PK_OrderStatusHistory] PRIMARY KEY CLUSTERED 
		([history_id] ASC)
		WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
		ON [PRIMARY],


   -- FK
	CONSTRAINT [FK_OrderStatusHistory_Orders] FOREIGN KEY([order_id])
		REFERENCES [dbo].[Orders] ([order_id]),

  
  --===============| Adding CHECK Constraints |===============--
-- 'Status' : Must be one of the supported options 
--==========================================================--
 
  ALTER TABLE dbo.OrderStatusHistory 
  ADD CONSTRAINT CK_OrderStatusHistory_Status CHECK (status IN ('Pending','Processing','Shipped','Delivered','Cancelled'))
GO
