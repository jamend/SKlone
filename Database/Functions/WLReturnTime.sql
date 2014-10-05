/****** Object:  User Defined Function dbo.WLReturnTime    Script Date: 5/1/2004 6:12:47 PM ******/
CREATE FUNCTION dbo.WLReturnTime
	(
		@kdID int,
		@WLID tinyint
	)
RETURNS tinyint
BEGIN
	RETURN(SELECT WLTime FROM WLs WHERE kdID = @kdID AND WLID = @WLID)
END
