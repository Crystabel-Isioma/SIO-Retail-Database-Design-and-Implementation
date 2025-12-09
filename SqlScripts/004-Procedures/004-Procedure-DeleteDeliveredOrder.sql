USE SIO_Retail;
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 8/10/2025 6:07:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/* ========================================================================================================================
   STORED PROCEDURE: dbo.USP_DeleteDeliveredOrder

   PURPOSE:
     Safely deletes an order ONLY if its status is 'Delivered'.
     Ensures referential integrity by removing dependent rows
     from ProductReviews, OrderStatusHistory, and OrderDetails.

   PARAMETERS:
     @OrderId   INT
        ID of the order to delete.

   BEHAVIOR:
     - Validates that the order exists.
     - Validates that the status is 'Delivered'.
     - Performs all deletions within a transaction.
     - Returns confirmation of the deleted order.
   ======================================================================================================================== */

CREATE OR ALTER PROCEDURE dbo.USP_DeleteDeliveredOrder
    @OrderId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        -- Validate order exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Orders WHERE order_id = @OrderId)
        BEGIN
            RAISERROR(N'Order %d not found.', 11, 1, @OrderId);
            ROLLBACK TRAN; 
            RETURN;
        END;

        -- Validate order status is Delivered
        IF NOT EXISTS (
            SELECT 1 
            FROM dbo.Orders 
            WHERE order_id = @OrderId 
              AND status = N'Delivered'
        )
        BEGIN
            RAISERROR(N'Order %d is not Delivered and cannot be deleted.', 11, 1, @OrderId);
            ROLLBACK TRAN; 
            RETURN;
        END;

        -- Delete child records first
        DELETE FROM dbo.ProductReviews      WHERE order_id = @OrderId;
        DELETE FROM dbo.OrderStatusHistory  WHERE order_id = @OrderId;
        DELETE FROM dbo.OrderDetails        WHERE order_id = @OrderId;

        -- Delete main order
        DELETE FROM dbo.Orders              WHERE order_id = @OrderId;

        COMMIT TRAN;

        SELECT 
            @OrderId AS deleted_order_id, 
            N'Deleted (status was Delivered)' AS result;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 
            ROLLBACK TRAN;

        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 11, 1);
    END CATCH;
END;
GO

/* ============================================================
   EXECUTE stored procedure: Delete Delivered Order
   (Example – commented for documentation)
   ============================================================ */

-- EXEC dbo.USP_DeleteDeliveredOrder @OrderId = 701;
