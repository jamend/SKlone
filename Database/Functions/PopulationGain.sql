/****** Object:  User Defined Function dbo.PopulationGain    Script Date: 5/1/2004 6:12:43 PM ******/
CREATE FUNCTION dbo.PopulationGain
	(
		@Attacker int,
		@Defender int,
		@Probes bigint
	)
RETURNS int
BEGIN
	DECLARE @Population bigint
	DECLARE @PopulationGain real
	DECLARE @PopulationGainB real
	DECLARE @AttackerSector int
	DECLARE @DefenderSector int
	SET @AttackerSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker)
	SET @DefenderSector = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender)
	SET @Population = (SELECT Population FROM Kingdoms WHERE kdID = @Defender)
	SET @PopulationGainB = (@Probes/10)
	IF @PopulationGainB >= @Population * .1 
	SET @PopulationGain = @Population * .1
	ELSE 
	SET @PopulationGain = (@Probes/10)
	RETURN(@PopulationGain)
END
