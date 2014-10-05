/****** Object:  User Defined Function dbo.KingdomLand    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.KingdomLand
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Land FROM Land WHERE kdID = @kdID)
END
