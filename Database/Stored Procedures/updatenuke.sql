/****** Object:  Stored Procedure dbo.updatenuke    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.updatenuke AS
UPDATE Missiles SET NuclearTime = NuclearTime - 1 WHERE NuclearBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Nuclear = 1, NuclearBuilding = 0 WHERE NuclearBuilding = 1 AND NuclearTime = 0 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET FusionTime = FusionTime - 1 WHERE FusionBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Fusion = 1, FusionBuilding = 0 WHERE FusionBuilding = 1 AND FusionTime = 0 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET EnergyTime = EnergyTime - 1 WHERE EnergyBuilding = 1 AND dbo.IsDead(kdID) = 0
	UPDATE Missiles SET Energy = 1, EnergyBuilding = 0 WHERE EnergyBuilding = 1 AND EnergyTime = 0 AND dbo.IsDead(kdID) = 0
