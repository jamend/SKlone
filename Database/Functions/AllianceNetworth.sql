/****** Object:  User Defined Function dbo.AllianceNetworth    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.AllianceNetworth
	(
		@AllianceID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT SUM(dbo.SectorNetworth(SectorID)) FROM Sectors WHERE AllianceID = @AllianceID)
END
