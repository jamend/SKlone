/****** Object:  Stored Procedure dbo.BuyStuff    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE PROCEDURE dbo.BuyStuff
	(
		@kdID as int,
		@Money as bigint
	)
AS
	IF (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) < @Money
	BEGIN
		RETURN(0) /* not enough money */
	END
	ELSE
	BEGIN
		UPDATE Kingdoms SET [Money] = [Money] - @Money WHERE kdID = @kdID
		RETURN(1) /* money spent */
	END
