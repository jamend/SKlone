/****** Object:  User Defined Function dbo.Similarities3    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.Similarities3
	(
		@Name nvarchar(24)
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM Accounts WHERE DIFFERENCE(Account, @Name) = 4)
END
