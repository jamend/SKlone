/****** Object:  User Defined Function dbo.CalcReturnTime    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.CalcReturnTime 
     ( 
          @Attacker int, 
          @Defender int
     ) 
RETURNS tinyint 
BEGIN 
     DECLARE @ReturnTime real
     DECLARE @Factor real
     SET @Factor = (SELECT ReturnTimeFactor FROM RaceTypes WHERE RaceType = dbo.RaceType(@Attacker)) + ((SELECT ReturnTimeFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@Attacker)))
     SET @ReturnTime = POWER(POWER((SELECT CAST(X AS bigint) FROM Kingdoms WHERE kdID = @Attacker) - (SELECT X FROM Kingdoms WHERE kdID = @Defender), 2) + POWER((SELECT CAST(Y AS bigint) FROM Kingdoms WHERE kdID = @Attacker) - (SELECT Y FROM Kingdoms WHERE kdID = @Defender), 2), 0.5) + 10 
     IF (SELECT SectorID FROM Kingdoms WHERE kdID = @Attacker) = (SELECT SectorID FROM Kingdoms WHERE kdID = @Defender) SET @ReturnTime = @ReturnTime * 0.9 
     SET @ReturnTime = @Factor * @ReturnTime
     RETURN(ROUND(@ReturnTime, 0)) 
END 
