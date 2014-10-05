<%@ Page Language="vb" AutoEventWireup="false" Codebehind="UniverseNetworth.aspx.vb" Inherits="SKlone.UniverseNetworth" %>
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
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FONT face="verdana" size="1">
			<P align="center">
			</P>
			<P align="center">
				<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, this table represents 
				the high scores for the top <B>Universe Networth</B>
			</P>
			<P align="center">
				<ASP:TABLE id="tblScores" runat="server" borderstyle="Solid" borderwidth="1px" bordercolor="Black"
					backcolor="#222222" font-names="Verdana" font-size="XX-Small" width="80%" horizontalalign="Center"
					gridlines="Both">
					<ASP:TABLEROW horizontalalign="Center" backcolor="#424242">
						<ASP:TABLECELL text="&nbsp;"></ASP:TABLECELL>
						<ASP:TABLECELL text="Kingdom"></ASP:TABLECELL>
						<ASP:TABLECELL text="Networth"></ASP:TABLECELL>
					</ASP:TABLEROW>
				</ASP:TABLE></P>
			<P align="center">&nbsp;</P>
		</FONT>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
