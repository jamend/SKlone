/****** Object:  User Defined Function dbo.SectorCount    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.SectorCount
	(
		@AllianceID int
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(SectorID) FROM Sectors WHERE AllianceID = @AllianceID)
END
