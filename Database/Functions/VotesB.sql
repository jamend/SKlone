/****** Object:  User Defined Function dbo.VotesB    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.VotesB
	(
		@kdID int
	)
RETURNS nvarchar(2)
BEGIN
	DECLARE @Result nvarchar(2)
	SET @Result = (SELECT COUNT(Vote) FROM Kingdoms WHERE Vote = @kdID)
	IF @Result = '0' SET @Result = ' '
	RETURN(@Result)
END
