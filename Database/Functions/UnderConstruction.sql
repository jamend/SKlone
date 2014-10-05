/****** Object:  User Defined Function dbo.UnderConstruction    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnderConstruction
	(
		@kdID int,
		@BuildingType tinyint
	)
RETURNS int
BEGIN
	RETURN(SELECT Construction0 + Construction1 + Construction2 + Construction3 + Construction4 + Construction5 + Construction6 + Construction7 + Construction8 + Construction9 + Construction10 + Construction11 + Construction12 + Construction13 + Construction14 + Construction15 FROM Buildings WHERE BuildingType = @BuildingType AND kdID = @kdID)
END
