/****** Object:  User Defined Function dbo.AllianceID    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceID
	(
		@SectorID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AllianceID FROM Sectors WHERE SectorID = @SectorID AND AllianceID != 0)
END
