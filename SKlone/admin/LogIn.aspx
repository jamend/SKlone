<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LogIn.aspx.vb" Inherits="SKlone.admin._Default" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>SKlone Administration</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<BODY bgcolor="#444444">
		<FORM runat="server">
			<TABLE height="100%" width="100%">
				<TR valign="middle" align="center">
					<TD>
						<P><FONT style="FILTER: dropshadow(offx=2, offy=2, positive=1, color=#000000) blur(direction=135, add=true, strength=3); WIDTH: 346px; HEIGHT: 30px"
								face="verdana" color="#ff0000" size="5"><B>ADMINISTRATIVE LOGIN</B> </FONT>
						</P>
						<TABLE width="30%">
							<TR>
								<TD><FONT face="verdana" color="#ffffff" size="1">Username:</FONT>
								</TD>
								<TD align="right"><ASP:TEXTBOX id="txtUsername" runat="server" width="155px"></ASP:TEXTBOX></TD>
							</TR>
							<TR>
								<TD><FONT face="verdana" color="#ffffff" size="1">Password:</FONT>
								</TD>
								<TD align="right"><ASP:TEXTBOX id="txtPassword" runat="server" textmode="Password" width="155px"></ASP:TEXTBOX></TD>
							</TR>
						</TABLE>
						<P></P>
						<P align="center"><ASP:BUTTON id="cmdLogIn" runat="server" text="  Login  " forecolor="White" backcolor="Red"
								bordercolor="Red" borderstyle="Outset" font-names="Verdana" font-bold="True" font-size="9pt"></ASP:BUTTON>
						<P align="center">&nbsp;<ASP:LABEL id="lblError" runat="server" forecolor="Red" font-names="Verdana" font-bold="True"
								font-size="9pt"></ASP:LABEL></P>
					</TD>
				</TR>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
