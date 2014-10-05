/****** Object:  User Defined Function dbo.UnitResearched    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.UnitResearched
	(
		@kdID int,
		@UnitType tinyint
	)
RETURNS bit
BEGIN
	DECLARE @Result bit
	IF @UnitType = 2
	BEGIN
		IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 5) < 100
		BEGIN
			SET @Result = 0
		END
		ELSE
		BEGIN
			SET @Result = 1
		END
	END
	ELSE
	BEGIN
		IF @UnitType = 4
		BEGIN
			IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 6) < 100
			BEGIN
				SET @Result = 0
			END
			ELSE
			BEGIN
				SET @Result = 1
			END
		END
		ELSE
		BEGIN
			IF @UnitType = 6
			BEGIN
				IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 7) < 100
				BEGIN
					SET @Result = 0
				END
				ELSE
				BEGIN
					SET @Result = 1
				END
			END
ELSE
	BEGIN
		IF @UnitType = 9
		BEGIN
			IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 11) < 100
			BEGIN
				SET @Result = 0
			END
			ELSE
			BEGIN
				SET @Result = 1
			END
		END
ELSE
	BEGIN
		IF @UnitType = 10
		BEGIN
			IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 12) < 100
			BEGIN
				SET @Result = 0
			END
			ELSE
			BEGIN
				SET @Result = 1
			END
		END
ELSE
	BEGIN
		IF @UnitType = 11
		BEGIN
			IF (SELECT ResearchPercent FROM Research WHERE kdID = @kdID AND ResearchType = 13) < 100
			BEGIN
				SET @Result = 0
			END
			ELSE
			BEGIN
				SET @Result = 1
			END
		END
			ELSE
			BEGIN
				SET @Result = 1
			END
		END
	END
END
END
END
	RETURN(@Result)
END
