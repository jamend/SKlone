<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LogIn.aspx.vb" Inherits="SKlone.LogIn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: none }
		</STYLE>
	</HEAD>
	<BODY bottommargin="0" bgcolor="#222222" leftmargin="0" topmargin="0" rightmargin="0">
		<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%">
			<TR height="60" align="center" valign="middle">
				<TD>
					<FORM id="Form1" runat="server">
						<FONT face="verdana" color="#ffffff" size="2">
							<P align="center"></P>
							<P>Your session has ended. Possible reasons for this are:</P>
							<DIV style="WIDTH: 269px" align="left" ms_positioning="FlowLayout">
								• you logged out
								<BR>
								• your session expired after 20 minutes
								<BR>
								• the game was recompiled
							</DIV>
							<P align="center"><ASP:LABEL id="lblError" runat="server"></ASP:LABEL></P>
							<TABLE cellspacing="0" cellpadding="0" width="30%" bgcolor="#000044">
								<TR>
									<TD align="center" background="/images/loginhr.gif" colspan="2" height="19"><FONT face="verdana" color="#ffffff" size="2"><B>« 
												Manage your account »</B> </FONT>
									</TD>
								</TR>
								<TR>
									<TD><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;Account: </FONT>
									</TD>
									<TD><ASP:TEXTBOX id="txtAccount" width="144px" runat="server" maxlength="16"></ASP:TEXTBOX></TD>
								</TR>
								<TR>
									<TD><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;Password: </FONT>
									</TD>
									<TD><ASP:TEXTBOX id="txtPassword" width="144px" runat="server" textmode="Password" maxlength="16"></ASP:TEXTBOX></TD>
								</TR>
								<TR>
									<TD colspan="2"><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;<ASP:BUTTON id="cmdLogIn" runat="server" forecolor="White" text="Login" font-names="Verdana"
												bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON></FONT></TD>
								</TR>
							</TABLE>
							<P><BR>
								<BR>
								Server Time:
								<ASP:LABEL id="lblServerTime" runat="server"></ASP:LABEL><BR>
								Users online:
								<ASP:LABEL id="lblStatus" runat="server"></ASP:LABEL><BR>
								<BR>
								<A href="/SignUp.aspx">Click Here to sign up for a free account</A></P>
						</FONT>
					</FORM>
				</TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>
