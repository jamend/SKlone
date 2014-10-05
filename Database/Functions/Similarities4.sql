/****** Object:  User Defined Function dbo.Similarities4    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.Similarities4
	(
		@Name nvarchar(24)
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM Accounts WHERE [Password] = @Name)
END
