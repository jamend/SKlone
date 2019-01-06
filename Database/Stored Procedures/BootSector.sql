/****** Object:  Stored Procedure dbo.BootSector    Script Date: 5/1/2004 6:12:35 PM ******/
CREATE PROCEDURE dbo.BootSector
	(
		@kdID int,
		@SectorID nvarchar(16),
		@Result nvarchar(600) output
	)
AS
		DECLARE @Sector nvarchar(16)
		SET @Sector = (SELECT SectorID FROM Sectors WHERE SectorID = @SectorID)
		IF @SectorID IS NULL
		BEGIN
			SET @Result = 'You did not give complete orders.'
		END
		ELSE
		BEGIN
		UPDATE Sectors SET AllianceID = 0 WHERE SectorID = @Sector
		SET @Result = 'You have successfully booted <b>' + @Sector + '</b>. '
		END
