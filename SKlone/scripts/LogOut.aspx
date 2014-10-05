<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LogOut.aspx.vb" Inherits="SKlone.LogOut" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>LogOut</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</STYLE>
	</HEAD>
	<BODY bgcolor="#222222">
		<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%">
			<TR align="center">
				<TD>
					<FONT face="verdana" color="#ffffff" size="2">
						<FORM id="Form1" method="post" runat="server">
							<P>
								<IMG src="../images/sklone_logob.jpg">
							</P>
							<P>
								<ASP:LABEL id="lblLoggedOut" runat="server"></ASP:LABEL>
							</P>
							<P>
								<B><A href="/">Main Page</A></B>
							</P>
							<P>
								<B><A href="LogIn.aspx">Log In</A></B>
							</P>
						</FORM>
					</FONT>
				</TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>
