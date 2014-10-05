/****** Object:  User Defined Function dbo.GetAAL    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.GetAAL
	(
		@AllianceID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AAL FROM Alliances WHERE AllianceID = @AllianceID)
END
