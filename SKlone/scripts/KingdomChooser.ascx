<%@ Control Language="vb" AutoEventWireup="false" Codebehind="KingdomChooser.ascx.vb" Inherits="SKlone.KingdomChooser" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableViewState="False"%>
<TABLE width="40%" border="2">
	<TR>
		<TD align="center">
			<P><FONT face="verdana" size="1">Galaxy:
					<ASP:TEXTBOX id="txtGalaxy" maxlength="2" width="29px" runat="server"></ASP:TEXTBOX>&nbsp;Sector:
					<ASP:TEXTBOX id="txtSector" maxlength="2" width="29px" runat="server"></ASP:TEXTBOX><BR>
					<ASP:BUTTON id="cmdChangeSector" runat="server" backcolor="#000488" forecolor="White" bordercolor="#005AFF"
						text="Change Sector"></ASP:BUTTON></FONT><FONT face="verdana" size="1"><BR>
					<ASP:PANEL id="pnlAlliance" runat="server">
						<ASP:LABEL id="lblAlliance" runat="server"></ASP:LABEL>
						<BR>
					</ASP:PANEL><ASP:PANEL id="pnlAllianceRelation" runat="server">
						<ASP:LABEL id="lblAllianceRelation" runat="server"></ASP:LABEL>
						<BR>
					</ASP:PANEL><ASP:PANEL id="pnlExternalRelation" runat="server">
						<ASP:LABEL id="lblExternalRelation" runat="server"></ASP:LABEL>
						<BR>
					</ASP:PANEL></P>
			<P align="center"><ASP:DROPDOWNLIST id="cboKingdoms" runat="server" backcolor="#003300" forecolor="White" AutoPostBack="True"></ASP:DROPDOWNLIST></P>
			</FONT></TD>
	</TR>
</TABLE>
