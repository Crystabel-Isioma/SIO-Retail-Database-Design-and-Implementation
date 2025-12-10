/* ============================================================
   Create Trigger: Restore Stock When Orders Are Cancelled
   ============================================================ */

GO
CREATE TRIGGER trg_RestoreStockOnCancel
ON dbo.Orders
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Restore stock only when the 'status' column is updated
    IF UPDATE(status)
    BEGIN
        UPDATE s
        SET s.stock_level = s.stock_level + od.quantity
        FROM dbo.Stock AS s
        INNER JOIN dbo.OrderDetails AS od ON s.product_id = od.product_id
        INNER JOIN inserted i ON i.order_id = od.order_id
        WHERE i.status = 'Cancelled';
    END
END;
GO
