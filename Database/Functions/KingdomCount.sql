/****** Object:  User Defined Function dbo.KingdomCount    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.KingdomCount
	(
		@SectorID int
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(kdID) FROM Kingdoms WHERE SectorID = @SectorID)
END
