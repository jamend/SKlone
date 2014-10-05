<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Dead.aspx.vb" Inherits="SKlone.Dead" %>
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
	<BODY text="#ffffff" vLink="#447cff" aLink="#4e9f5f" link="#447cff" bgColor="#000000">
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FORM id="Form1" runat="server">
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlDead" runat="server" horizontalalign="Center" visible="False">
					<P><FONT face="verdana" size="4"><B>Dead</B></FONT></P>
					<P>Your account&nbsp;is dead&nbsp;due to 0 pop or 0 land. Hope you game was fun and 
						resignup at the main site.</P>
					<P><A href="http://sklone.no-ip.com/signup.aspx">SignUp</A></P>
				</ASP:PANEL>
				<P align="center"><ASP:PANEL id="pnlCheater" runat="server" horizontalalign="Center" visible="False"><FONT face="verdana" size="4"><B>
								Cheater</B>&nbsp; </FONT></P>
				<P align="center">You are disabled for cheating. Contact the admins if you think 
					you should be re-enabled.</P>
				<P align="center"></ASP:PANEL></P>
				<P align="center">
			</FONT>
			<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P></FORM>
	</BODY>
</HTML>
