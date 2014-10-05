/****** Object:  User Defined Function dbo.MoneyGainB    Script Date: 5/1/2004 6:12:42 PM ******/
CREATE FUNCTION dbo.MoneyGainB
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS int
BEGIN
	DECLARE @Money bigint
	DECLARE @MoneyGain real
	DECLARE @MoneyGainB real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Money = (SELECT [Money] FROM Kingdoms WHERE kdID = @Defender)
	SET @MoneyGainB = (@Probes * 10)
	IF @MoneyGainB >= @Money * .10 
	SET @MoneyGain = @Money * .10
	ELSE 
	SET @MoneyGain = (@Probes * 10)
	RETURN(@MoneyGain)
END
