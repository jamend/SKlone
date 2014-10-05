<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Msg.aspx.vb" Inherits="SKlone.Msg" %>
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
		<FORM runat="server">
			<P align="center"><BR>
				<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center">All messages are deleted after 3 days. No offensive messages. 
					Profanity is not allowed. Using the SKlone messaging system to get personal 
					information about anyone is not allowed. Abuse of these will result in account 
					termination.</P>
				<P align="center"><FONT size="2"><A href="Sent.aspx">Sent Messages</A> </FONT>
				</P>
				<P align="center"><ASP:TABLE id="tblMessages" runat="server" gridlines="Both" width="95%" font-names="Verdana"
						font-size="XX-Small" borderwidth="1px"></ASP:TABLE><ASP:LABEL id="lblNoMessages" runat="server" font-size="X-Small" visible="False">No Messages</ASP:LABEL></P>
				<P align="center"><ASP:BUTTON id="cmdDeleteSelected" runat="server" font-names="Verdana" text="Delete Selected Messages"
						bordercolor="#005AFF" forecolor="White" backcolor="#000488"></ASP:BUTTON></P>
				<P align="center"><ASP:LINKBUTTON id="aDeleteAll" runat="server" font-size="X-Small">Delete All Messages</ASP:LINKBUTTON></P>
				<P align="center"><BR>
					<BR>
					<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
				<P>&nbsp;</P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
