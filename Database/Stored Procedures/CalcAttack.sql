/****** Object:  Stored Procedure dbo.CalcAttack    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.CalcAttack
	(
		@WLs tinyint,
		@ASoldiers int,
		@ATroopers int,
		@ADragoons int,
		@ATanks int,
		@ATFs int,
		@ASpecialOps int,
		@AInterceptors int,
		@ASabres int,
		@ALancers int,
		@DSoldiers int,
		@DLTroopers int,
		@DLDragoons int,
		@DTanks int,
		@DTFs int,
		@DSpecialOps int,
		@DInterceptors int,
		@DSabres int,
		@DLancers int,
		@APlanetType tinyint,
		@ARaceType tinyint,
		@DPlanetType tinyint,
		@DRaceType tinyint,
		@DResearch int,
		@AResearch int,
		@Result nvarchar(600) output
	)
AS
	
					BEGIN
						DECLARE @AttackPower bigint
						DECLARE @DefencePower bigint
						SET @AttackPower = dbo.CalcAttackPowerB(@WLs, @ASoldiers, @ATroopers, @ADragoons, @ATanks, @ATFs, @ASpecialOps, @AInterceptors, @ASabres, @ALancers, @APlanetType, @ARaceType, @AResearch)
						SET @DefencePower = dbo.CalcDefencePowerB(@DSoldiers, @DLTroopers, @DLDragoons, @DTanks, @DTFs, @DSpecialOps, @DInterceptors, @DSabres, @DLancers, @DPlanetType, @DRaceType, @DResearch)
						print @AttackPower
						print @DefencePower
						IF @DefencePower = 0
						BEGIN
						SET @DefencePower = 1
						END
						
						IF @AttackPower < @DefencePower
						BEGIN
							/* fail */
							SET @Result = 'The battle begins quickly. Our leaders have reported that our attack was <b>unsuccessful</b>.<br>'
						END
						ELSE
						BEGIN
							/* success */
							SET @Result = 'The battle begins quickly. Our leaders have reported that our attack was <b>successful</b>!'
						END
END
