/****** Object:  Stored Procedure dbo.Build    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.Build
	(
		@kdID int,
		@Buildings int,
		@BuildingType tinyint
	)
AS
	DECLARE @Cost bigint
	SET @Cost = CAST(@Buildings AS bigint) * dbo.BuildCost(@kdID)
	EXEC dbo.BuyStuff @kdID, @Cost
	DECLARE @Construction int
	DECLARE @Remainder tinyint
	SET @Construction = @Buildings / 16
	SET @Remainder = @Buildings % 16
	IF @Construction > 0
	BEGIN
		UPDATE Buildings SET Construction15 = Construction15 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction14 = Construction14 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction13 = Construction13 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction12 = Construction12 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction11 = Construction11 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction10 = Construction10 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction9 = Construction9 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction8 = Construction8 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction7 = Construction7 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction6 = Construction6 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction5 = Construction5 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction4 = Construction4 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction3 = Construction3 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction2 = Construction2 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction1 = Construction1 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
		UPDATE Buildings SET Construction0 = Construction0 + @Construction WHERE kdID = @kdID AND BuildingType = @BuildingType
	END
	IF @Remainder > 0 UPDATE Buildings SET Construction15 = Construction15 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction14 = Construction14 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction13 = Construction13 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction12 = Construction12 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction11 = Construction11 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction10 = Construction10 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction9 = Construction9 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction8 = Construction8 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction7 = Construction7 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction6 = Construction6 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction5 = Construction5 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction4 = Construction4 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction3 = Construction3 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction2 = Construction2 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE Buildings SET Construction1= Construction1 + 1 WHERE kdID = @kdID AND BuildingType = @BuildingType ELSE GOTO done
	done:
