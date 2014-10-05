<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Preferences.aspx.vb" Inherits="SKlone.Preferences" %>
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
		<FORM runat="server" id="Form1">
			<P align="center">
				<BR>
				<SKLONE:TOPINFOBAR runat="server" id="Topinfobar1"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">
				</P>
				<P align="center">&nbsp;</P>
				<P align="center">
					<ASP:LABEL id="lblError" runat="server" visible="False"></ASP:LABEL></P>
				<P align="center">
					<TABLE id="Table6" bordercolor="#000000" width="80%" bgcolor="#222222" border="1">
						<TBODY>
							<TR>
								<TD align="center" bgcolor="#424242"><FONT face="verdana" size="1">Vacation Mode </FONT>
								</TD>
							</TR>
							<TR align="center">
								<TD>
									<P><FONT face="verdana" size="1">Put your account on hold for up to 2 weeks while you 
											go on vacation.</FONT><BR>
										<BR>
										<ASP:BUTTON id="cmdVacationMode" runat="server" text="Activate Vacation Mode" forecolor="White"
											backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"></ASP:BUTTON><BR>
										<BR>
									</P>
									<P align="center">
										<asp:HyperLink id="HyperLink1" runat="server" NavigateUrl="ProfileEdit.aspx">Edit Your Profile</asp:HyperLink></P>
			</FONT></TD></TR>
			<TR>
				<TD align="center" bgcolor="#424242"><FONT face="verdana" size="1">Change Password</FONT></TD>
			</TR>
			<TR align="center">
				<TD>
					<P><FONT face="verdana"></FONT><FONT size="1">Old Password<BR>
							<ASP:TEXTBOX id="txtOldPassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
							<BR>
							New Password<BR>
							<ASP:TEXTBOX id="txtNewPassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
							<BR>
							New Password Again<BR>
							<ASP:TEXTBOX id="txtConfirm" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX></FONT><BR>
						<BR>
						<ASP:BUTTON id="cmdChangePassword" runat="server" text="Change Password" forecolor="White" backcolor="#000488"
							bordercolor="#005AFF" font-names="Verdana"></ASP:BUTTON><BR>
						<BR>
					</P>
					<P align="center">&nbsp;</P>
					</FONT>
				</TD>
			</TR>
			<TR>
				<TD align="center" bgcolor="#424242"><FONT face="verdana" size="1">Delete Account</FONT></TD>
			</TR>
			<TR align="center">
				<TD>
					<P><FONT face="verdana"></FONT><FONT size="1">Password<BR>
							<ASP:TEXTBOX id="txtDeletePassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
						</FONT>
						<BR>
						<ASP:BUTTON id="cmdDelete" runat="server" text="Delete Account" forecolor="White" backcolor="#000488"
							bordercolor="#005AFF" font-names="Verdana"></ASP:BUTTON></P>
					</FONT>
				</TD>
			</TR>
			</TBODY></TABLE></P>
			<P align="center">&nbsp;</P>
			<P align="center">
				<SKLONE:BOTTOMINFOBAR runat="server" id="BottomInfoBar1"></SKLONE:BOTTOMINFOBAR>
			</P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
