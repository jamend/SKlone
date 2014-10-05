<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Vacation.aspx.vb" Inherits="SKlone.Vacation" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
		<ASP:LABEL id="lblLand" runat="server"></ASP:LABEL>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link {
	COLOR: #447cff; TEXT-DECORATION: none
}
A:visited {
	COLOR: #447cff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #4e9f5f; TEXT-DECORATION: underline
}
		</STYLE>
	</HEAD>
	<BODY text="#ffffff" vLink="#447cff" aLink="#4e9f5f" link="#447cff" bgColor="#000000">
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FORM id="Form1" runat="server">
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlEntered" runat="server" horizontalalign="Center" visible="False">
					<P>Your account has begun the process of entering vacation mode. In 24 hours your 
						account will officially be frozen. During the first 24 hours your account will 
						be in pending mode. Your account will still progress and people will still be 
						able to attack you. If you wish to login to your account during this time you 
						will be removed from pending status and you will have to start the Vacation 
						process again.</P>
					<P><A href="http://sklone.no-ip.com/">sklone.no-ip.com</A></P>
				</ASP:PANEL><ASP:PANEL id="pnlPending" runat="server" horizontalalign="Center" visible="False"><FONT face="verdana" size="4"><B>Vacation 
							Mode</B> </FONT>
					<P align="center">Your account is still in the pending process of vacation mode. 
						This means that less then 24 hours ago you chose to enter vacation mode. Your 
						lands are still growing, but if you wish to continue and log into your account 
						you will leave pending mode and you will have to start vacation mode again.</P>
					<P align="center">You will be in pending for <B>
							<ASP:LABEL id="lblPending" runat="server"></ASP:LABEL>&nbsp;more hours</B>, 
						then your account will be frozen and unaccessible for 48 hours.</P>
					<P>
						<ASP:BUTTON id="cmdLeave" runat="server" text="Leave Vacation Mode and let me access my account!"
							forecolor="White" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON></P>
				</ASP:PANEL><ASP:PANEL id="pnlError" runat="server" horizontalalign="Center" visible="False">You are not in vacation mode.</ASP:PANEL>
				<P align="center"><ASP:PANEL id="pnlVacationMode" runat="server" horizontalalign="Center" visible="False"><FONT face="verdana" size="4"><B>Vacation 
								Mode</B> </FONT></P>
				<P align="center">Your account is frozen and unaccessible for another
					<ASP:LABEL id="lblVacationMode" runat="server" Visible="False" Font-Bold="True"></ASP:LABEL>&nbsp;<b>more 
						hours</b>.</P>
				<P align="center"></ASP:PANEL><ASP:PANEL id="pnlVacationEnd" runat="server" horizontalalign="Center" visible="False"><FONT face="verdana" size="4"><B>Vacation 
								Mode</B> </FONT></P>
				<P align="center">Your account is in vacation mode. Your&nbsp;lands are&nbsp;still 
					growing, but if you wish to continue and log into your account you will 
					leave&nbsp;vacation mode.</P>
				<P align="center">You will be in&nbsp;vacation mode&nbsp;for <B>
						<ASP:LABEL id="lblVacationEnd" runat="server"></ASP:LABEL>&nbsp;more hours</B>, 
					then your account will be out of vacation mode and not protected by the 
					vacation mode laws.</P>
				<P><ASP:BUTTON id="cmdEndVacation" runat="server" text="Leave Vacation Mode and let me access my account!"
						forecolor="White" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON></P>
				</ASP:PANEL></FONT></FORM>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
