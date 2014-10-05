/****** Object:  User Defined Function dbo.GetAL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.GetAL
	(
		@AllianceID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AL FROM Alliances WHERE AllianceID = @AllianceID)
END
