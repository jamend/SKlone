/****** Object:  User Defined Function dbo.FormatNumber    Script Date: 5/1/2004 6:12:41 PM ******/
CREATE FUNCTION dbo.FormatNumber
	(
		@Number bigint
	)
RETURNS nvarchar(32)
BEGIN
	DECLARE @NumberStr nvarchar(24)
	DECLARE @NewStr nvarchar(32)
	DECLARE @NumberLen tinyint
	SET @NumberStr = CAST(@Number AS nvarchar(24))
	SET @NumberLen = LEN(@NumberStr)
	SET @NewStr = RIGHT(@NumberStr, 3)
	IF @NumberLen > 5
	BEGIN
		SET @NewStr = LEFT(RIGHT(@NumberStr, 6), 3) + ',' + @NewStr
		IF @NumberLen > 8
		BEGIN
			SET @NewStr = LEFT(RIGHT(@NumberStr, 9), 3) + ',' + @NewStr
			IF @NumberLen > 11
			BEGIN
				SET @NewStr = LEFT(RIGHT(@NumberStr, 12), 3) + ',' + @NewStr
				IF @NumberLen > 14
				BEGIN
					SET @NewStr = LEFT(RIGHT(@NumberStr, 15), 3) + ',' + @NewStr
					IF @NumberLen > 17
					BEGIN
						SET @NewStr = LEFT(RIGHT(@NumberStr, 18), 3) + ',' + @NewStr
						IF @NumberLen > 20
						BEGIN
							SET @NewStr = LEFT(RIGHT(@NumberStr, 21), 3) + ',' + @NewStr
						END
					END
				END
			END
		END
	END
	IF @NumberLen > 3
	BEGIN
		DECLARE @Rest tinyint
		SET @Rest = @NumberLen % 3
		IF @Rest = 1
		BEGIN
			SET @NewStr = LEFT(@NumberStr, 1) + ',' + @NewStr
		END
		ELSE
		BEGIN
			IF @Rest = 2
			BEGIN
				SET @NewStr = LEFT(@NumberStr, 2) + ',' + @NewStr
			END
		END
	END
	RETURN(@NewStr)
END
