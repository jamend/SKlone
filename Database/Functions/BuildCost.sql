/****** Object:  User Defined Function dbo.BuildCost    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.BuildCost
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT 63.246 * POWER(CAST(Land AS real), 0.5) FROM Land WHERE kdID = @kdID)
END
