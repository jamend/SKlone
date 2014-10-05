<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Scores.aspx.vb" Inherits="SKlone.Scores" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</STYLE>
	</HEAD>
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR><FONT face="verdana" size="1">
				<BR>
			</FONT><FONT face="verdana" size="1"></FONT>
		</P>
		<P align="center"><FONT face="verdana" size="1">
				<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome to the scores 
				list. All&nbsp;scores are updated hourly.<BR>
				<BR>
				<BR>
		</P>
		</FONT> <FONT face="verdana" size="3">
			<P align="center"><BR>
				<A href="UniverseNetworth.aspx">Strongest Kingdoms in the Universe</A>
				<BR>
				<BR>
				<A href="UniverseLand.aspx">Largest Kingdoms in the Universe</A>
				<BR>
				<BR>
				<A href="GalaxyNetworth.aspx">Strongest Kingdoms in the Galaxy</A>
				<BR>
				<BR>
				<A href="GalaxyLand.aspx">Largest Kingdoms in the Galaxy</A>
				<BR>
				<BR>
				<A href="StrongestSectors.aspx">Strongest Sectors in the Universe</A>
				<BR>
				<BR>
				<A href="StrongestAlliances.aspx">Strongest Alliances in the Universe</A>&nbsp;&nbsp;
				<BR>
				&nbsp;<BR>
				<A href="MostKills.aspx">Most&nbsp;Kills and&nbsp;Missile&nbsp;Launches&nbsp;in the 
					Universe</A>
			</P>
			<P align="center"><A href="LargestLandGrab.aspx">Largest&nbsp;Land&nbsp;Grab&nbsp;and&nbsp;Land 
					Gain&nbsp;in the Universe</A></P>
			<P align="center"><A href="AggressiveProbings.aspx">Most Aggressive Probing Damage in 
					the Universe</A></P>
			<P align="center">
		</FONT>
		<BR>
		<BR>
		<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		<P>&nbsp;</P>
		</FONT></FORM>
	</BODY>
</HTML>
