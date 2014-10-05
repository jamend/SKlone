/****** Object:  Stored Procedure dbo.BuildFusion    Script Date: 5/1/2004 6:12:37 PM ******/
CREATE PROCEDURE dbo.BuildFusion
	(
		@kdID int,
		@Result nvarchar(512) output
	)
AS
			DECLARE @FusionTime nvarchar(24)
			SET @FusionTime = (SELECT FusionTime FROM Missiles WHERE kdID = @kdID)
			IF (SELECT FusionBuilding FROM Missiles WHERE kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already building a <b>fusion missile</b> it will take <b>' + @FusionTime +' hours</b> to complete.'
			END
			ELSE
			IF (SELECT Fusion FROM Missiles WHERE  kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already built a <b>fusion missile</b>.'
			END
			ELSE
					IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
					BEGIN
						SET @Result = '4' /* dead */
					END
					ELSE
				IF (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) < 2000000
				BEGIN
					SET @Result = 'You do not have enough money to build a fusion missile.'
				END
				ELSE
				IF (SELECT [Power] FROM Kingdoms WHERE kdID = @kdID) < 50000 AND (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) != 5
				BEGIN
					SET @Result = 'You do not have enough power to make a fusion missile.'
				END
				ELSE
				IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Result = '3' /* newbie */
				END
					ELSE
						IF (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) = 5
						BEGIN
							UPDATE Missiles SET FusionTime = 36, FusionBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 2000000 WHERE kdID = @kdID
							SET @Result = 'You have built a <b>fusion missile</b> it will take <b>36 hours</b> to build. It costed you <b>2,000,000 money</b>, and <b>0 power</b>.'
						END
						ELSE
						BEGIN
							UPDATE Missiles SET FusionTime = 36, FusionBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 2000000 WHERE kdID = @kdID
							UPDATE Kingdoms SET [Power] = [Power] - 50000 WHERE kdID = @kdID
							SET @Result = 'You have built a <b>fusion missile</b> it will take <b>36 hours</b> to build. It costed you <b>2,000,000 money</b>, and <b>50,000 power</b>.'
						END
						print @Result
