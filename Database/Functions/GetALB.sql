/****** Object:  User Defined Function dbo.GetALB    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.GetALB
	(
		@PublicID int
	)
RETURNS int
BEGIN
	RETURN(SELECT AL FROM Publics WHERE PublicID = @PublicID)
END
