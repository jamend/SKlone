/****** Object:  Stored Procedure dbo.AllianceSectorsList    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE PROCEDURE dbo.AllianceSectorsList
(
		@AllianceID int
)
 AS
		BEGIN
		SELECT COUNT(SectorID) FROM Sectors WHERE (SELECT COUNT(*) FROM Sectors WHERE AllianceID = @AllianceID) > 0
		END
