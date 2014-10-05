/****** Object:  User Defined Function dbo.KingdomMoney    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.KingdomMoney
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT [Money] FROM Kingdoms WHERE kdID = @kdID)
END
