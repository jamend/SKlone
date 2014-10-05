/****** Object:  User Defined Function dbo.AllianceName    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.AllianceName
	(
		@AllianceID int
	)
RETURNS nvarchar(16)
BEGIN
	RETURN(SELECT AllianceName FROM Alliances WHERE AllianceID = @AllianceID)
END
