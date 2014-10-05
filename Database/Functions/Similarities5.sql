/****** Object:  User Defined Function dbo.Similarities5    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.Similarities5
	(
		@kdID int,
		@Name nvarchar(16)
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(kdID) FROM LogIns WHERE LogInIP = @Name AND kdID != @kdID)
END
