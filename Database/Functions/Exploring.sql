/****** Object:  User Defined Function dbo.Exploring    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.Exploring
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT Land0 + Land1 + Land2 + Land3 + Land4 + Land5 + Land6 + Land7 + Land8 + Land9 + Land10 + Land11 + Land12 + Land13 + Land14 + Land15 + Land16 + Land17 + Land18 + Land19 + Land20 + Land21 + Land22 + Land23 FROM Land WHERE kdID = @kdID)
END
