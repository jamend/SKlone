/****** Object:  Stored Procedure dbo.JoinAlliance    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.JoinAlliance
	(
		@SectorID int,
		@AllianceName nvarchar(16),
		@AlliancePassword nvarchar(16),
		@Result nvarchar(600) output
	)
AS
		DECLARE @AllianceID int
		DECLARE @AllianceWait nvarchar(16)
		DECLARE @AllianceNameB nvarchar(16)
		DECLARE @Galaxy nvarchar(16)
		DECLARE @Sector nvarchar(16)
		DECLARE @SectorJoin nvarchar(512)
		DECLARE @PersonalNews nvarchar(512)
		DECLARE @AllianceAL int
		SET @Galaxy = (SELECT Galaxy FROM Sectors WHERE SectorID = @SectorID)
		SET @Sector = (SELECT Sector FROM Sectors WHERE SectorID = @SectorID)
		SET @AllianceWait = (SELECT AllianceWait FROM Sectors WHERE SectorID = @SectorID)
		SET @AllianceID = (SELECT AllianceID FROM Alliances WHERE AllianceName = @AllianceName)
		SET @AllianceNameB = (SELECT AllianceName FROM Alliances WHERE AllianceID = @AllianceID)
		SET @SectorJoin = 'Sector <b>' + @Galaxy + '</b>:<b>' + @Sector + '</b> has joined the alliance.'
		SET @PersonalNews = 'Sector <b>' + @Galaxy + '</b>:<b>' + @Sector + '</b> has joined your alliance.'
		SET @AllianceAL = (SELECT AL FROM Alliances WHERE AllianceID = @AllianceID)
		IF @AllianceWait > 0
		BEGIN
		SET @Result = 'You have to wait <b>' + @AllianceWait + '</b> hours before you can join an alliance.'
		END
		ELSE
		BEGIN
		INSERT INTO AllianceNews(AllianceID, NewsType, NewsText) VALUES(@AllianceID, 7, @SectorJoin)
		INSERT INTO PersonalNews(kdID, NewsText) VALUES (@AllianceAL, @PersonalNews)
		UPDATE Sectors SET AllianceID = @AllianceID WHERE SectorID = @SectorID
		SET @Result = 'You have joined the <b>' + @AllianceNameB + '</b> alliance.'
		END
