/****** Object:  User Defined Function dbo.Scouter    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.Scouter
	(
		@Attacker int,
		@Defender int
	)
RETURNS nvarchar(48)
BEGIN
	DECLARE @Name nvarchar(48)
	SET @Name = (SELECT [Name] + '' + dbo.CalcReturnTime(@Attacker, @Defender) + ' hours' FROM Kingdoms WHERE kdID = @Defender)
	RETURN(@Name)
END
