/****** Object:  User Defined Function dbo.MoneyAid    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.MoneyAid
	(
		@kdID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT [Money]/10 FROM Kingdoms WHERE kdID = @kdID)
END
