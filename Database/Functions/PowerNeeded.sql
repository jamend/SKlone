/****** Object:  User Defined Function dbo.PowerNeeded    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.PowerNeeded 
     ( 
          @kdID int 
     ) 
RETURNS bigint 
BEGIN 
     DECLARE @PowerNeeded bigint 
     SET @PowerNeeded = (SELECT Population * 0.1 FROM Kingdoms WHERE kdID = @kdID) +  
                  (SELECT (SUM(DISTINCT UnitsTraining.Complete * UnitPowerCost.PowerCost) - SUM(UnitsOut.[Out] * UnitPowerCost.PowerCost)) FROM UnitsTraining, UnitsOut, UnitPowerCost WHERE UnitPowerCost.UnitType = UnitsTraining.UnitType AND UnitsOut.UnitType = UnitsTraining.UnitType AND UnitsOut.kdID = UnitsTraining.kdID AND UnitsTraining.kdID = @kdID) + 
                  (SELECT SUM(Built + Construction0 + Construction1 + Construction2 + Construction3 + Construction4 + Construction5 + Construction6 + Construction7 + Construction8 + Construction9 + Construction10 + Construction11 + Construction12 + Construction13 + Construction14 + Construction15) FROM Buildings WHERE kdID = @kdID) * 2.1 
     RETURN(@PowerNeeded * ((SELECT PowerNeededFactor FROM PlanetTypes WHERE PlanetType = dbo.PlanetType(@kdID)) + (SELECT PowerNeededFactor FROM RaceTypes WHERE RaceType = dbo.RaceType(@kdID))))
END 
