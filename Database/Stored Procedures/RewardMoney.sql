/****** Object:  Stored Procedure dbo.RewardMoney    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.RewardMoney
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
		IF (SELECT Income FROM Kingdoms WHERE kdID = @kdID) = 0
		BEGIN
			SET @Result = 'You are a crack if you think you get money with no income.'
		END
		ELSE
		IF (SELECT [Money] FROM Rewards WHERE kdID = @kdID) = 1
		BEGIN
			SET @Result = 'You have recieved your money reward for today.'
		END
		ELSE
		IF (SELECT [Money] FROM Rewards WHERE kdID = @kdID) = 0
		BEGIN
			SET @Result = 'Your money reward has just been added to your total money.'
		UPDATE Rewards SET [Money] = 1 WHERE kdID = @kdID
		UPDATE Kingdoms SET [Money] = [Money] + (Income * 3) WHERE kdID = @kdID
		END
