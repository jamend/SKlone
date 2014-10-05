/****** Object:  Stored Procedure dbo.Explore    Script Date: 5/1/2004 6:12:38 PM ******/
CREATE PROCEDURE dbo.Explore
	(
		@kdID int,
		@Land bigint
	)
AS
	IF @Land > dbo.Explorable(@kdID)
	BEGIN
		RETURN(0) /* can't explore this much */
	END
	ELSE
	BEGIN
		DECLARE @Cost bigint
		SET @Cost = @Land * dbo.ExploreCost(@kdID)
		EXEC dbo.BuyStuff @kdID, @Cost
		DECLARE @Explore int
		DECLARE @Remainder tinyint
		SET @Explore = @Land / 24
		SET @Remainder = @Land % 24
		IF @Explore > 0
		BEGIN
			UPDATE Land SET Land23 = Land23 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land22 = Land22 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land21 = Land21 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land20 = Land20 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land19 = Land19 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land18 = Land18 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land17 = Land17 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land16 = Land16 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land15 = Land15 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land14 = Land14 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land13 = Land13 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land12 = Land12 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land11 = Land11 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land10 = Land10 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land9 = Land9 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land8 = Land8 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land7 = Land7 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land6 = Land6 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land5 = Land5 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land4 = Land4 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land3 = Land3 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land2 = Land2 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land1 = Land1 + @Explore WHERE kdID = @kdID
			UPDATE Land SET Land0 = Land0 + @Explore WHERE kdID = @kdID
		END
		IF @Remainder > 0 UPDATE Land SET Land23 = Land23 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land22 = Land22 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land21 = Land21 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land20 = Land20 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land19 = Land19 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land18 = Land18 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land17 = Land17 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land16 = Land16 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land15 = Land15 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land14 = Land14 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land13 = Land13 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land12 = Land12 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land11 = Land11 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land10 = Land10 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land9 = Land9 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land8 = Land8 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land7 = Land7 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land6 = Land6 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land5 = Land5 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land4 = Land4 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land3 = Land3 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land2 = Land2 + 1 WHERE kdID = @kdID ELSE GOTO done
		SET @Remainder = @Remainder - 1
		IF @Remainder > 0 UPDATE Land SET Land1= Land1 + 1 WHERE kdID = @kdID ELSE GOTO done
		done:
	END
