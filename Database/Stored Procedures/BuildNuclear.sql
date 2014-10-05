/****** Object:  Stored Procedure dbo.BuildNuclear    Script Date: 5/1/2004 6:12:37 PM ******/
CREATE PROCEDURE dbo.BuildNuclear
	(
		@kdID int,
		@Result nvarchar(512) output
	)
AS
			DECLARE @NuclearTime nvarchar(24)
			SET @NuclearTime = (SELECT NuclearTime FROM Missiles WHERE kdID = @kdID)
			IF (SELECT NuclearBuilding FROM Missiles WHERE NuclearBuilding = 1 AND kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already building a <b>nuclear missile</b> it will take <b>' + @NuclearTime +' hours</b> to complete.'
			END
			ELSE
			IF (SELECT Nuclear FROM Missiles WHERE  kdID = @kdID) >= 1
			BEGIN
				SET @Result = 'You are already built a <b>nuclear missile</b>.'
			END
			ELSE
			IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
					BEGIN
						SET @Result = '4' /* dead */
					END
					ELSE
				IF (SELECT [Money] FROM Kingdoms WHERE kdID = @kdID) < 100000
				BEGIN
					SET @Result = 'You do not have enough money to build a nuclear missile.'
				END
				ELSE
				IF (SELECT [Power] FROM Kingdoms WHERE kdID = @kdID) < 3000 AND (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) != 5
				BEGIN
					SET @Result = 'You do not have enough power to make a nuclear missile.'
				END
				ELSE
				IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Result = '3' /* newbie */
				END
					ELSE
				IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Result = '3' /* newbie */
				END
					ELSE
						IF (SELECT PlanetType FROM Kingdoms WHERE kdID = @kdID) = 5
										BEGIN
							UPDATE Missiles SET NuclearTime = 24, NuclearBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 100000 WHERE kdID = @kdID
							SET @Result = 'You have built a <b>nuclear missile</b> it will take <b>24 hours</b> to build. It costed you <b>100,000 money</b>, and <b>0 power</b>.'
						END
						ELSE
						BEGIN
							UPDATE Missiles SET NuclearTime = 24, NuclearBuilding = 1 WHERE kdID = @kdID						
							UPDATE Kingdoms SET [Money] = [Money] - 100000 WHERE kdID = @kdID
							UPDATE Kingdoms SET [Power] = [Power] - 3000 WHERE kdID = @kdID
							SET @Result = 'You have built a <b>nuclear missile</b> it will take <b>24 hours</b> to build. It costed you <b>100,000 money</b>, and <b>3,000 power</b>.'
						END
						print @Result
