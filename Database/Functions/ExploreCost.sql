/****** Object:  User Defined Function dbo.ExploreCost    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.ExploreCost
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT 110.68 * POWER(CAST(Land AS real), 0.5) FROM Land WHERE kdID = @kdID)
END
