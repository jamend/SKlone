/****** Object:  User Defined Function dbo.MoneyGain    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.MoneyGain
	(
		@Attacker int,
		@Defender int
	)
RETURNS int
BEGIN
	DECLARE @Money bigint
	DECLARE @MoneyGain real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Money = (SELECT [Money] FROM Kingdoms WHERE kdID = @Defender)
	SET @MoneyGain = @Money * .10
	RETURN(@MoneyGain)
END
