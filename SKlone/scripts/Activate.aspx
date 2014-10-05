<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Activate.aspx.vb" Inherits="SKlone.scripts.Activate" %>
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
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</STYLE>
	</HEAD>
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<FORM runat="server" id="Form3">
			<P align="center"><BR>
			</P>
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlActivate" runat="server" horizontalalign="Center">
					<FONT face="verdana" size="4"><B>Activate Your Account</B> </FONT>
					<TABLE id="Table1" cellspacing="0" cellpadding="0" width="80%" border="1">
						<TBODY>
							<TR>
								<TD align="center">
									<FONT face="verdana" size="1">
										<P>In order to verify that you are an active player and have entered a valid unique 
											email address there is an activation process. To continue playing SKlone you 
											will need to refer to the e-mail sent to you when you made your account.
											<BR>
											<BR>
											What is the activation code you received?<BR>
											<ASP:TEXTBOX id="txtActivationCode" runat="server" font-names="Verdana"></ASP:TEXTBOX></P>
										<P><ASP:BUTTON id="cmdActivate" runat="server" text="Activate Account"></ASP:BUTTON><BR>
											<BR>
										</P>
									</FONT>
								</TD>
							</TR>
							<TR align="center">
								<TD>
									<FONT face="verdana" size="1">
										<P>If you accidently erased the email or can not find it you may resend the account 
											signup email containing the Activation code.
										</P>
										<ASP:BUTTON id="cmdResend" runat="server"></ASP:BUTTON><BR>
										<BR>
									</FONT>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</ASP:PANEL><ASP:PANEL id="pnlError" runat="server" horizontalalign="Center" visible="False"><ASP:LABEL id="lblError" runat="server" visible="False"></ASP:LABEL>
				</ASP:PANEL>
				<P align="center">&nbsp;</P>
			</FONT>
			<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		</FORM>
	</BODY>
</HTML>
