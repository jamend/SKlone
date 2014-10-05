/****** Object:  User Defined Function dbo.FullKingdomNameA    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.FullKingdomNameA
	(
		@kdID int,
		@SectorID int,
		@kdID2 int
	)
RETURNS nvarchar(100)
BEGIN
	DECLARE @Name nvarchar(100)
	IF @kdID = @kdID2
	BEGIN
		SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: orange;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
	END
	ELSE
		BEGIN
			IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
			BEGIN
				SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #666666;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
			END
			ELSE
	BEGIN
		IF (SELECT Cheater FROM AccountStatus WHERE kdID = @kdID) = 1
		BEGIN
			SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #EE3A16;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
		END
		ELSE
			BEGIN
				IF (SELECT Vacation FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #1BB91B;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
				END
				ELSE
				BEGIN
					IF @kdID = dbo.GetSL(@SectorID)
					BEGIN
						SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFF00 ;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
					END
					ELSE
					BEGIN
						IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #00aaee ;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
						END
						ELSE
						BEGIN
						IF (SELECT Inactive FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #CC9966 ;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
						END
						ELSE
						BEGIN
							SET @Name = '<a href=Profile.aspx?KingdomID=' + CAST(@kdID AS nvarchar(8)) + ' style="color: #FFFFFF ;">' + dbo.FullKingdomNameI(@kdID) + '</a>'
						END
					END
				END
			END
		END
	END
END
	
	RETURN(@Name)
END
