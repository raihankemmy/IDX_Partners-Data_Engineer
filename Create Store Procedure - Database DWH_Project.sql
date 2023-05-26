CREATE OR ALTER PROCEDURE summary_order_status 
	@StatusID INT
AS
BEGIN
    SELECT 
		sale.OrderID,
		cust.CustomerID,
		cust.CustomerName,
		prod.ProductName,
		sale.Quantity,
		stat.StatusOrder
	FROM FactSalesOrder sale 
		 JOIN DimCustomer cust ON sale.CustomerID = cust.CustomerID
		 JOIN DimProduct prod ON sale.ProductID = prod.ProductID
		 JOIN DimStatusOrder stat on sale.StatusID = stat.StatusID
	WHERE sale.StatusID = @StatusID ;
END;

EXEC summary_order_status @StatusID = 3
