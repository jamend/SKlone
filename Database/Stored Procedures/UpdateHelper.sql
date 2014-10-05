/****** Object:  Stored Procedure dbo.UpdateHelper    Script Date: 5/1/2004 6:12:36 PM ******/
CREATE PROCEDURE dbo.UpdateHelper
	(
		@HelperID int,
		@kdID int
	)
AS
	UPDATE Alliances SET AAL = @HelperID WHERE AL = @kdID
