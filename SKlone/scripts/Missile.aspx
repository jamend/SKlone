<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Missile.aspx.vb" Inherits="SKlone.Missile" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="KingdomChooser" Src="KingdomChooser.ascx" %>
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
		<FONT face="verdana" size="1">
			<FORM id="Form1" runat="server">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblMsg" runat="server"></ASP:LABEL></P>
				<P align="center"><ASP:PLACEHOLDER id="plcResult" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, you can 
					send out your&nbsp;missiles to destory others or build more missiles. Please 
					choose a target, and an action.</P>
				<P align="center"><ASP:BUTTON id="cmdBuildNuclear" runat="server" Width="143px" forecolor="White" font-names="Verdana"
						bordercolor="#005AFF" backcolor="#000488" text="Build Nuclear Missile"></ASP:BUTTON></P>
				<P align="center"><ASP:BUTTON id="cmdBuildFusion" runat="server" Width="143px" forecolor="White" font-names="Verdana"
						bordercolor="#005AFF" backcolor="#000488" text="Build Fusion Missile"></ASP:BUTTON></P>
				<P align="center"><ASP:BUTTON id="cmdBuildEnergy" runat="server" Width="143px" forecolor="White" font-names="Verdana"
						bordercolor="#005AFF" backcolor="#000488" text="Build Energy Missile"></ASP:BUTTON></P>
				<P align="center">
					<TABLE style="WIDTH: 229px; HEIGHT: 126px" cellSpacing="0" cellPadding="0" width="229"
						border="1">
						<TBODY>
							<TR>
								<TD align="middle">
									<P><FONT face="verdana" size="1">You have <B>
												<ASP:LABEL id="lblNuclear" runat="server"></ASP:LABEL>&nbsp;Nuclear</B> missile.
											<BR>
											You have <B>
												<ASP:LABEL id="lblFusion" runat="server"></ASP:LABEL>&nbsp;Fusion</B> missile.
											<BR>
											You have <B>
												<ASP:LABEL id="lblEnergy" runat="server"></ASP:LABEL>&nbsp;Energy</B> missile.</FONT></P>
									<P><ASP:DROPDOWNLIST id="cboMissileType" runat="server">
											<asp:ListItem Value="0">Nuclear Missile</asp:ListItem>
											<asp:ListItem Value="1">Fusion Missile</asp:ListItem>
											<asp:ListItem Value="2">Energy Missile</asp:ListItem>
										</ASP:DROPDOWNLIST><BR>
										&nbsp;
										<ASP:BUTTON id="cmdMissile" runat="server" Width="111px" forecolor="White" font-names="Verdana"
											bordercolor="#005AFF" backcolor="#000488" text=" Send Missile"></ASP:BUTTON>&nbsp;</P>
		</FONT></TD></TR></TBODY></TABLE></P>
		<P align="center"><ASP:LABEL id="lblSuccess" runat="server" Visible="False"></ASP:LABEL></P>
		</FORM></FONT>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder2" runat="server"></ASP:PLACEHOLDER></P>
	</BODY>
</HTML>
