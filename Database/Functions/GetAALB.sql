/****** Object:  User Defined Function dbo.GetAALB    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.GetAALB
	(
		@PublicID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AAL FROM Publics WHERE PublicID = @PublicID)
END
