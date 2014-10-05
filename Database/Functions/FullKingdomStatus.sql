/****** Object:  User Defined Function dbo.FullKingdomStatus    Script Date: 5/1/2004 6:12:45 PM ******/
CREATE FUNCTION dbo.FullKingdomStatus
	(
		@kdID int,
		@SectorID int,
		@kdID2 int
	)
RETURNS nvarchar(80)
BEGIN
	DECLARE @Name nvarchar(80)
	IF @kdID = @kdID2
	BEGIN
		SET @Name = '<font color=orange>You</font>'
	END
	ELSE
		BEGIN
			IF (SELECT Dead FROM AccountStatus WHERE kdID = @kdID) = 1
			BEGIN
				SET @Name = '<font color=#666666>Dead</font>'
			END
			ELSE
	BEGIN
		IF (SELECT Cheater FROM AccountStatus WHERE kdID = @kdID) = 1
		BEGIN
			SET @Name = '<font color=#EE3A16>Disabled</font>'
		END
		ELSE
			BEGIN
				IF (SELECT Vacation FROM AccountStatus WHERE kdID = @kdID) = 1
				BEGIN
					SET @Name = '<font color=#1BB91B>Vacation</font>'
				END
				ELSE
				BEGIN
					IF @kdID = dbo.GetSL(@SectorID)
					BEGIN
						SET @Name = '<font color=yellow>SL</font>'
					END
					ELSE
					BEGIN
						IF (SELECT Newbie FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Name = '<font color=#00aaee>Newbie</font>'
						END
						ELSE
						BEGIN
						IF (SELECT Inactive FROM AccountStatus WHERE kdID = @kdID) = 1
						BEGIN
							SET @Name = '<font color=#CC9966>Inactive</font>'
						END
						ELSE
						BEGIN
							SET @Name = '<font color=#FFFFFF>Normal</font>'
						END
					END
				END
			END
		END
	END
END
	
	RETURN(@Name)
END
