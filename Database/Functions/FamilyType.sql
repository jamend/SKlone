/****** Object:  User Defined Function dbo.FamilyType    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FamilyType
	(
		@kdID int
	)
RETURNS int
BEGIN
	RETURN(SELECT FamilyID FROM Kingdoms WHERE kdID = @kdID)
END
