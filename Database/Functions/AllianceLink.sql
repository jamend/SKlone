/****** Object:  User Defined Function dbo.AllianceLink    Script Date: 5/1/2004 6:12:44 PM ******/
CREATE FUNCTION dbo.AllianceLink
	(
		@AllianceID int
	)
RETURNS nvarchar(64)
BEGIN
	RETURN('<a href=AllianceInfo.aspx?AllianceID=' + CAST(@AllianceID AS nvarchar(8)) + '>' + dbo.AllianceName(@AllianceID) + '</a>')
END
