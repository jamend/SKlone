<%@ Page Language="vb" AutoEventWireup="false" Codebehind="AllianceInfo.aspx.vb" Inherits="SKlone.scripts.AllianceInfo" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
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
		<P align="center"><BR><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P><FONT face="verdana" size="1">
			<P align="center"></P>
			<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>,
				we have prepared an intellegence report for the alliance you requested. </P>
			<P align="center"><ASP:PANEL id="pnlAlliance" runat="server" visible="False" horizontalalign="Center">
					<TABLE bordercolor="#000000" width="80%" bgcolor="#222222" border="1">
						<TR>
							<TD align="center" bgcolor="#424242" colspan="4"><FONT face="verdana" size="2"><B><ASP:LABEL id="lblAllianceName1" runat="server" font-bold="True" forecolor="Orange"></ASP:LABEL>&nbsp;Alliance
										Status</B></FONT></TD></TR>
						<TR align="center">
							<TD><FONT face="verdana" size="2"><B>Rank:</B> <ASP:LABEL id="lblRank" runat="server"></ASP:LABEL></FONT></TD>
							<TD><FONT face="verdana" size="2"><B>Total Networth:</B> <ASP:LABEL id="lblNetworth" runat="server"></ASP:LABEL></FONT></TD>
							<TD><FONT face="verdana" size="2"><B>Average Networth:</B> <ASP:LABEL id="lblAverageNetworth" runat="server"></ASP:LABEL></FONT></TD>
							<TD><FONT face="verdana" size="2"><B>Number of Sectors:</B> <ASP:LABEL id="lblSectors" runat="server"></ASP:LABEL></FONT></TD></TR>
						<TR>
							<TD style="HEIGHT: 21px" align="center" bgcolor="#424242" colspan="4"><FONT face="verdana" size="2"><B><FONT face="verdana" size="2"><B><ASP:LABEL id="lblAllianceName2" runat="server" font-bold="True" forecolor="Orange"></ASP:LABEL>&nbsp;</B></FONT>Alliance
										Relations<FONT face="verdana" size="2"><B></B></FONT></B></FONT></TD></TR>
						<TR>
							<TD colspan="4"><FONT face="verdana" size="2"><B>War:</B> <ASP:LABEL id="lblWar" runat="server"></ASP:LABEL><BR><BR><B>
										Peace:</B> <ASP:LABEL id="lblPeace" runat="server"></ASP:LABEL><BR><BR><B>NAP:</B> <ASP:LABEL id="lblNAP" runat="server"></ASP:LABEL><BR><BR><B>
										Allies:</B> <ASP:LABEL id="lblAllies" runat="server"></ASP:LABEL></FONT></TD></TR></TABLE></ASP:PANEL></P>
			<P align="center"><ASP:LABEL id="lblError" runat="server" forecolor="Red" font-size="X-Small"></ASP:LABEL></P>
			<P align="center"><FONT face="verdana" size="2"><B></B></FONT><BR><BR></FONT><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
