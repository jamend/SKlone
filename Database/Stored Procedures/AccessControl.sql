/****** Object:  Stored Procedure dbo.AccessControl    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE PROCEDURE [dbo].[AccessControl]
	(
		@AllianceName nvarchar(16),
		@kdID int,
		@Result nvarchar(600) output,
		@Success nvarchar(600) output
	)
AS
		DECLARE @AllianceAL int
		DECLARE @Alliance int
		SET @AllianceAL = (SELECT AL FROM Alliances WHERE AL = @kdID)
		SET @Alliance = (SELECT AL FROM Alliances WHERE AllianceName = @AllianceName)
		IF @AllianceAL IS NULL OR @Alliance IS NULL
		BEGIN
			SET @Result = 'You are not AL of an alliance.'
			SET @Success = 'Failed'
		END
		ELSE
		IF @Alliance = @AllianceAL
		BEGIN
		SET @Result = 'You are not AL of this alliance.'
		SET @Success = 'Success'
		END
		ELSE
		IF @Alliance != @AllianceAL
		BEGIN
		SET @Result = 'You are not AL of this alliance.'
		SET @Success = 'Failed'
		END
