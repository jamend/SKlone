/****** Object:  User Defined Function dbo.IsDead    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.IsDead
	(
		@kdID int
	)
RETURNS bit
BEGIN
	RETURN(SELECT Dead FROM AccountStatus WHERE kdID = @kdID)
END
