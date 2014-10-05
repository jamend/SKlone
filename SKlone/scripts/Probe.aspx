<%@ Register TagPrefix="sklone" TagName="KingdomChooser" Src="KingdomChooser.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Probe.aspx.vb" Inherits="SKlone.Probe" %>
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
		<FONT face="verdana" size="1">
			<FORM id="Form1" runat="server">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblMsg" runat="server"></ASP:LABEL></P>
				<P align="center"><ASP:PLACEHOLDER id="plcResult" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, you can 
					send out your probes to explore or infiltrate the enemy. Please choose a 
					target, the amount of probes you wish to send, and an action.</P>
				<P align="center">
					<TABLE cellSpacing="0" cellPadding="0" width="60%" border="1">
						<TBODY>
							<TR>
								<TD align="center">
									<P><FONT face="verdana" size="1">You can send out your probes <B>
												<ASP:LABEL id="lblProbeTurns" runat="server"></ASP:LABEL></B>&nbsp;more 
											times.
											<BR>
											You have a total of <B>
												<ASP:LABEL id="lblProbes" runat="server"></ASP:LABEL>&nbsp;probes</B> to 
											send out.
											<BR>
											Probes to send:
											<ASP:TEXTBOX id="txtProbes" runat="server" font-name="verdana" size="8"></ASP:TEXTBOX><BR>
											<ASP:CHECKBOX id="chkShield" runat="server" text="Activate extra energy shields. "></ASP:CHECKBOX></FONT><FONT face="verdana" size="1"><BR>
											<ASP:DROPDOWNLIST id="cboProbeType" runat="server">
												<asp:ListItem Value="0">Spy on Kingdom</asp:ListItem>
												<asp:ListItem Value="1">Spy on Military</asp:ListItem>
												<asp:ListItem Value="2">Spy on Buildings</asp:ListItem>
												<asp:ListItem Value="3">Spy on Research</asp:ListItem>
												<asp:ListItem Value="4">Rob Banks</asp:ListItem>
												<asp:ListItem Value="5">Arson</asp:ListItem>
												<asp:ListItem Value="6">Sabotage Powerplants</asp:ListItem>
												<asp:ListItem Value="7">Kidnappings</asp:ListItem>
											</ASP:DROPDOWNLIST><BR>
											<ASP:BUTTON id="cmdProbe" runat="server" text=" Send Probes " backcolor="#000488" bordercolor="#005AFF"
												font-names="Verdana" forecolor="White"></ASP:BUTTON><BR>
											<BR>
									</P>
		</FONT></TD></TR></TBODY></TABLE></P>
		<P align="center"><ASP:LABEL id="lblSuccess" runat="server" Visible="False"></ASP:LABEL></P>
		</FONT>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder2" runat="server"></ASP:PLACEHOLDER></P>
		</FORM>
	</BODY>
</HTML>
