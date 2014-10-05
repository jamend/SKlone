<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Shields.aspx.vb" Inherits="SKlone.Shields" %>
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
			<P align="center"><BR>
				<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblMsg" runat="server" forecolor="White"></ASP:LABEL></P>
				<P align="center">
					<TABLE bordercolor="#000000" width="80%" bgcolor="#222222" border="1">
						<TR>
							<TD align="center" bgcolor="#424242"><FONT face="verdana" size="1">Power Shields</FONT></TD>
						</TR>
						<TR align="center">
							<TD><FONT face="verdana" size="1"><BR>
									You can use as much power/hour as like. If your power level is at 0 your 
									shields will not be powered.
									<BR>
									Power to use/hour:
									<ASP:TEXTBOX id="txtPower" runat="server" size="6" font-names="verdana"></ASP:TEXTBOX><BR>
									<ASP:BUTTON id="cmdSetPower" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488" text="  Set Power Level  "></ASP:BUTTON><BR>
									* Shield levels will be updated next hour<BR>
									<BR>
									<ASP:PANEL id="pnlNoPower" runat="server" visible="False">
										<FONT face="verdana" size="2"><B>WARNING, OUR SHIELDS ARE NOT RECEIVING POWER.</B> </FONT>
										<BR>
									</ASP:PANEL></FONT></TD>
						</TR>
					</TABLE>
					<BR>
					<BR>
					<BR>
					<TABLE bordercolor="#000000" width="80%" bgcolor="#222222" border="1">
						<TR>
							<TD align="center" bgcolor="#424242"><FONT face="verdana" size="1"><FONT face="verdana" size="-2">Shield 
										Level Usage</FONT></FONT></TD>
						</TR>
						<TR align="center">
							<TD>
								<TABLE bordercolor="black" cellspacing="0" cellpadding="0" width="100%" border="1">
									<TBODY>
										<TR align="center">
											<TD><FONT face="verdana" size="2">Military Defense </FONT>
											</TD>
											<TD><FONT face="verdana" size="2"><ASP:TEXTBOX id="txtMilUsage" runat="server" size="2" font-names="Verdana"></ASP:TEXTBOX>%
												</FONT>
											</TD>
											<TD><FONT face="verdana" size="2"><B>Effectiveness:</B>
													<ASP:LABEL id="lblMilShields" runat="server"></ASP:LABEL>% </FONT>
											</TD>
										</TR>
										<TR align="center">
											<TD><FONT face="verdana" size="2">Missile Defense </FONT>
											</TD>
											<TD><FONT face="verdana" size="2"><ASP:TEXTBOX id="txtMisUsage" runat="server" size="2" font-names="Verdana"></ASP:TEXTBOX>%
												</FONT>
											</TD>
											<TD><FONT face="verdana" size="2"><B>Effectiveness:</B>
													<ASP:LABEL id="lblMisShields" runat="server"></ASP:LABEL>% </FONT>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								<ASP:BUTTON id="cmdSetUsage" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488" text="Set Shield Level Usage"></ASP:BUTTON><BR>
								<FONT face="verdana" size="1">* Shield levels will be updated next hour</FONT>
							</TD>
						</TR>
					</TABLE>
				</P>
				<P align="center">&nbsp;</P>
				<P align="left"><FONT face="verdana" size="2">&nbsp;&nbsp; ( <A href="Status.aspx">Kingdom 
							Status</A> )</FONT>
				</P>
				<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
