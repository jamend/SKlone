/****** Object:  Stored Procedure dbo.BuildingLoss    Script Date: 5/1/2004 6:12:37 PM ******/
CREATE PROCEDURE dbo.BuildingLoss
(
		@Attacker int,
		@Defender int 
)
AS
							DECLARE @LandGain int
							SET @LandGain = dbo.LandGain(@Attacker, @Defender)
							IF (SELECT Built FROM Buildings WHERE BuildingType = 0 AND kdID = @Defender) < @LandGain * .25
							UPDATE Buildings SET Built = 0 WHERE BuildingType = 0 AND kdID = @Defender
							ELSE
							UPDATE Buildings SET Built = Built - (@LandGain * .25) WHERE BuildingType = 0 AND kdID = @Defender
							IF (SELECT Built FROM Buildings WHERE BuildingType = 1 AND kdID = @Defender) < @LandGain * .25
							UPDATE Buildings SET Built = 0 WHERE BuildingType = 1 AND kdID = @Defender
							ELSE
							UPDATE Buildings SET Built = Built - (@LandGain * .25) WHERE BuildingType = 1 AND kdID = @Defender
							IF (SELECT Built FROM Buildings WHERE BuildingType = 5 AND kdID = @Defender) < @LandGain * .25
							UPDATE Buildings SET Built = 0 WHERE BuildingType = 5 AND kdID = @Defender
							ELSE
							UPDATE Buildings SET Built = Built - (@LandGain * .25) WHERE BuildingType = 5 AND kdID = @Defender
							IF (SELECT Built FROM Buildings WHERE BuildingType = 3 AND kdID = @Defender) < @LandGain * .25
							UPDATE Buildings SET Built = 0 WHERE BuildingType = 3 AND kdID = @Defender
							ELSE
							UPDATE Buildings SET Built = Built - (@LandGain * .25) WHERE BuildingType = 3 AND kdID = @Defender
