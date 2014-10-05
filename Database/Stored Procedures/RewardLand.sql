/****** Object:  Stored Procedure dbo.RewardLand    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.RewardLand
(
	@kdID int,
	@Result nvarchar(600) output
)
 AS
		IF (SELECT NotStarted FROM ServerStatus) = 1
		BEGIN
			SET @Result = 'You can not recieve rewards before the game has been started.'
		END
		ELSE
		IF (SELECT Land FROM Rewards WHERE kdID = @kdID) = 1
		BEGIN
			SET @Result = 'You have recieved your 20 land for today.'
		END
		ELSE
		IF (SELECT Land FROM Rewards WHERE kdID = @kdID) = 0
		BEGIN
		SET @Result = 'Your 20 land reward has been added to your total land.'
		UPDATE Rewards SET Land = 1 WHERE kdID = @kdID
		UPDATE Land SET Land = Land + 20 WHERE kdID = @kdID
		END
