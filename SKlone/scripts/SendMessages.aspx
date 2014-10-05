<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="SendMessages.aspx.vb" Inherits="SKlone.SendMessages" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
		<ASP:LABEL id="lblLand" runat="server"></ASP:LABEL>
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
		<FORM id="Form1" runat="server">
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblSent" runat="server"></ASP:LABEL></P>
				<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:TEXTBOX id="txtMessage" runat="server" font-names="Verdana" columns="60" rows="15" maxlength="1500"
						textmode="MultiLine"></ASP:TEXTBOX></P>
				<P align="center"><ASP:BUTTON id="cmdSend" runat="server" font-names="Verdana" backcolor="#000488" bordercolor="#005AFF"
						text="Send Message" forecolor="White"></ASP:BUTTON></P>
				<P align="center">&nbsp;</P>
			</FONT>
		</FORM>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
