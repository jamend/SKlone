/****** Object:  User Defined Function dbo.PublicID    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PublicID
	(
		@SectorID int
	)
RETURNS int
BEGIN
	RETURN(SELECT PublicID FROM Sectors WHERE SectorID = @SectorID)
END
