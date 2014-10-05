/****** Object:  Stored Procedure dbo.MakeAlliance    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.MakeAlliance
	(
		@AllianceName nvarchar(16),
		@kdID int,
		@Password nvarchar(16),
		@Result nvarchar(600) output
	)
AS
		DECLARE @AllianceAL int
		DECLARE @Alliance nvarchar(16)
		SET @AllianceAL = (SELECT AL FROM Alliances WHERE AL = @kdID)
		SET @Alliance = (SELECT AllianceName FROM Alliances WHERE AllianceName = @AllianceName)
		IF @Alliance = @AllianceName
		BEGIN
		SET @Result = 'There is already an alliance with this name.'
		END
		ELSE
		IF @AllianceAL = @kdID 
		BEGIN
		SET @Result = 'You already made an alliance.'
		END
		ELSE
		BEGIN
		INSERT INTO Alliances(AllianceName, [Password], AL) VALUES (@AllianceName, @Password, @kdID)
		SET @Result = 'You have made an alliance called <b>'+ @AllianceName +'</b> and password is <b>'+ @Password +'</b>.'
		END
