/****** Object:  Stored Procedure dbo.BuildEnergy    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.BuildEnergy
	(
		@kdID int,
		@Result nvarchar(512) output
	)
AS
			DECLARE @EnergyTime nvarchar(24)
			SET @EnergyTime = (SELECT EnergyTime FROM Missiles WHERE kdID = @kdID)
			IF (SELECT EnergyBuilding FROM Missiles WHERE kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already building an <b>energy missile</b> it will take <b>' + @EnergyTime +' hours</b> to complete.'
			END
			ELSE
			IF (SELECT Energy FROM Missiles WHERE  kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already built an <b>energy missile</b>.'
			END
			ELSE
			IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
					BEGIN
						SET @Result = '4' /* dead */
					END
					ELSE
				IF (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) < 4000000
				BEGIN
					SET @Result = 'You do not have enough money to build an energy missile.'
				END
				ELSE
				IF (SELECT [Power] FROM Kingdoms WHERE kdID = @kdID) < 100000 AND (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) != 5
				BEGIN
					SET @Result = 'You do not have enough power to make an energy missile.'
				END
				ELSE
				IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Result = '3' /* newbie */
				END
					ELSE
						IF (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) = 5
						BEGIN
							UPDATE Missiles SET EnergyTime = 48, EnergyBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 4000000 WHERE kdID = @kdID
							SET @Result = 'You have built an <b>energy missile</b> it will take <b>48 hours</b> to build. It costed you <b>4,000,000 money</b>, and <b>0 power</b>.'
						END
						ELSE
						BEGIN
							UPDATE Missiles SET EnergyTime = 48, EnergyBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 4000000 WHERE kdID = @kdID
							UPDATE Kingdoms SET [Power] = [Power] - 100000 WHERE kdID = @kdID
							SET @Result = 'You have built an <b>energy missile</b> it will take <b>48 hours</b> to build. It costed you <b>4,000,000 money</b>, and <b>100,000 power</b>.'
						END
						print @Result
