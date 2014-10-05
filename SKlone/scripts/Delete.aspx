<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Delete.aspx.vb" Inherits="SKlone.Delete" %>
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
				<ASP:PANEL id="pnlConfirm" runat="server" horizontalalign="Center" visible="False">
					<P>Warning,&nbsp;12 hours after you confirm you will be perminantly removed from 
						the server and your account will be lost. If you login again during this time 
						you will have the option to cancel your deletion. Are you sure you want to 
						remove your account?</P>
					<P>
						<ASP:BUTTON id="cmdConfirm" runat="server" text="CONFIRM DELETION" forecolor="White" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON></P>
				</ASP:PANEL>
				<ASP:PANEL id="pnlConfirmed" runat="server" horizontalalign="Center" visible="False">
					<P>You have begun the&nbsp;12 hour pending time to be deleted. If you login again 
						during this time you will have the option to cancel the deletion process.</P>
					<P><A href="http://sklone.homeip.net/">sklone.no-ip.com</A></P>
				</ASP:PANEL>
				<ASP:PANEL id="pnlDeletePending" runat="server" horizontalalign="Center" visible="False">
					<FONT face="verdana" size="4"><B>Delete Pending</B> </FONT>
					<P align="center">Your account was in the process of pending to be deleted. 
						Accessing your account before&nbsp;12 hours ended has caused the deletion 
						request to be cancelled.</P>
					<P align="center">
						<ASP:HYPERLINK id="aCancelled" runat="server">Click here to continue into your account</ASP:HYPERLINK></P>
				</ASP:PANEL>
				<ASP:PANEL id="pnlCantConfirm" runat="server" horizontalalign="Center" visible="False">You must go to 
preferences and enter your password before you can confirm your 
deletion.</ASP:PANEL>
				<P align="center">&nbsp;</P>
			</FONT>
		</FORM>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
