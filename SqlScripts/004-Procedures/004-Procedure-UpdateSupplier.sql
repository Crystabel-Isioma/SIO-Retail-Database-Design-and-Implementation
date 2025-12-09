/* ===========================================================================
   STORED PROCEDURE: dbo.USP_UpdateSupplier

   PURPOSE:
     Updates the details of an existing supplier (name and/or phone).
     Uses an explicit transaction and error handling.

   PARAMETERS:
     @SupplierId    INT              -- Supplier to update (required)
     @SupplierName  NVARCHAR(100)    -- Optional new name (keeps old if NULL)
     @Phone         NVARCHAR(30)     -- Optional new phone (keeps old if NULL)
   ============================================================================ */

CREATE OR ALTER PROCEDURE dbo.USP_UpdateSupplier
    @SupplierId   INT,
    @SupplierName NVARCHAR(100) = NULL,
    @Phone        NVARCHAR(30)  = NULL
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRAN;

        IF NOT EXISTS (SELECT 1 FROM dbo.Suppliers WHERE supplier_id = @SupplierId)
        BEGIN
            RAISERROR(N'Supplier %d not found.', 11, 1, @SupplierId);
            ROLLBACK TRAN; 
            RETURN;
        END;

        UPDATE dbo.Suppliers
        SET supplier_name = COALESCE(@SupplierName, supplier_name),
            phone         = COALESCE(@Phone,        phone)
        WHERE supplier_id = @SupplierId;

        COMMIT TRAN;

        -- return updated row
        SELECT supplier_id, supplier_name, phone
        FROM dbo.Suppliers
        WHERE supplier_id = @SupplierId;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0 ROLLBACK TRAN;
        DECLARE @msg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@msg, 11, 1);
    END CATCH;
END;
GO

/* ============================================================
   EXECUTE stored procedure: Update Supplier Details
   (Examples – commented for documentation)
   ============================================================ */

-- EXEC dbo.USP_UpdateSupplier @SupplierId = 403, @SupplierName = N'SioPrime Distributors';
-- EXEC dbo.USP_UpdateSupplier @SupplierId = 405, @Phone = N'06-28-44-19-72';
