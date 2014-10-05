/****** Object:  User Defined Function dbo.Similarities    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.Similarities
	(
		@Name nvarchar(24)
	)
RETURNS int
BEGIN
	RETURN(SELECT COUNT(*) FROM Kingdoms WHERE DIFFERENCE([Name], @Name) = 4)
END
