/****** Object:  User Defined Function dbo.AllianceAverageNetworth    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION AllianceAverageNetworth
	(
		@AllianceID int
	)
RETURNS bigint
BEGIN
	RETURN(SELECT AVG(dbo.SectorNetworth(SectorID)) FROM Sectors WHERE AllianceID = @AllianceID)
END
