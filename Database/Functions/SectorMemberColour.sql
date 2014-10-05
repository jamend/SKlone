/****** Object:  User Defined Function dbo.SectorMemberColour    Script Date: 5/1/2004 6:12:46 PM ******/
CREATE FUNCTION dbo.SectorMemberColour
	(
		@kdID int,
		@SectorID int,
		@kdID2 int
	)
RETURNS nvarchar(8)
BEGIN
	DECLARE @Colour nvarchar(8)
	IF @kdID = @kdID2
	BEGIN
		SET @Colour = 'Orange'
	END
	ELSE
	BEGIN
		IF (SELECT Cheater FROM AccountStatus WHERE kdID = @kdID) = 1
		BEGIN
			SET @Colour = '#EE3A16'
		END
		ELSE
		BEGIN
			IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
			BEGIN
				SET @Colour = '#666666'
			END
			ELSE
			BEGIN
				IF (SELECT Vacation FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Colour = '#1BB91B'
				END
				ELSE
				BEGIN
					IF @kdID = dbo.GetSL(@SectorID)
					BEGIN
						SET @Colour = 'yellow'
					END
					ELSE
					BEGIN
						IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Colour = '#00aaee'
						END
						ELSE
						BEGIN
						IF (SELECT Inactive FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Colour = '#CC9966'
						END
						ELSE
						BEGIN
							SET @Colour = '#ffffff'
						END
					END
				END
			END
		END
	END
END
	RETURN(@Colour)
END
