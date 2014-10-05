/****** Object:  User Defined Function dbo.LoggedIn    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.LoggedIn ()
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM AccountStatus WHERE LoggedIn = 1)
END
