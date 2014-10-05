/****** Object:  Stored Procedure dbo.Train    Script Date: 5/1/2004 6:12:39 PM ******/
CREATE PROCEDURE dbo.Train
	(
		@kdID int,
		@Units int,
		@UnitType tinyint
	)
AS
	DECLARE @Cost bigint
	SET @Cost = @Units * dbo.UnitCost(@kdID, @UnitType)
	EXEC dbo.BuyStuff @kdID, @Cost
	IF @UnitType != 0 AND @UnitType != 6 UPDATE UnitsTraining SET Complete = Complete - @Units WHERE kdID = @kdID AND UnitType = 0
	DECLARE @Train int
	DECLARE @Remainder tinyint
	SET @Train = @Units / 24
	SET @Remainder = @Units % 24
	IF @Train > 0
	BEGIN
		UPDATE UnitsTraining SET Training23 = Training23 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training22 = Training22 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training21 = Training21 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training20 = Training20 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training19 = Training19 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training18 = Training18 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training17 = Training17 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training16 = Training16 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training15 = Training15 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training14 = Training14 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training13 = Training13 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training12 = Training12 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training11 = Training11 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training10 = Training10 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training9 = Training9 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training8 = Training8 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training7 = Training7 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training6 = Training6 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training5 = Training5 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training4 = Training4 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training3 = Training3 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training2 = Training2 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training1 = Training1 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
		UPDATE UnitsTraining SET Training0 = Training0 + @Train WHERE kdID = @kdID AND UnitType = @UnitType
	END
	IF @Remainder > 0 UPDATE UnitsTraining SET Training23 = Training23 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training22 = Training22 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training21 = Training21 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training20 = Training20 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training19 = Training19 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training18 = Training18 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training17 = Training17 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training16 = Training16 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training15 = Training15 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training14 = Training14 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training13 = Training13 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training12 = Training12 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training11 = Training11 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training10 = Training10 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training9 = Training9 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training8 = Training8 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training7 = Training7 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training6 = Training6 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training5 = Training5 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training4 = Training4 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training3 = Training3 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training2 = Training2 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	SET @Remainder = @Remainder - 1
	IF @Remainder > 0 UPDATE UnitsTraining SET Training1= Training1 + 1 WHERE kdID = @kdID AND UnitType = @UnitType ELSE GOTO done
	done:
