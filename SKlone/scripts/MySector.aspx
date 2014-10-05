<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MySector.aspx.vb" Inherits="SKlone.MySector" %>
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
	<BODY text="#ffffff" bgColor="#000000">
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FONT face="verdana" size="1">
			<P align="center">
			<P align="center">
				<TABLE width="40%" border="2">
					<TR>
						<TD vAlign="middle" align="center" width="100%">
							<FORM id="Form1" method="post" runat="server">
								<TABLE cellSpacing="0" width="100%" border="0">
									<TR vAlign="middle">
										<TD align="center" width="80"><ASP:LINKBUTTON id="aLeft" runat="server" font-size="X-Large">«</ASP:LINKBUTTON></TD>
										<TD vAlign="top" align="center"><FONT face="verdana" size="1">Galaxy:
												<ASP:TEXTBOX id="txtGalaxy" runat="server" size="2" font-name="verdana" maxlength="2"></ASP:TEXTBOX>&nbsp;Sector:
												<ASP:TEXTBOX id="txtSector" runat="server" size="2" font-name="verdana" maxlength="2"></ASP:TEXTBOX><BR>
												<ASP:BUTTON id="cmdBrowse" runat="server" font-names="Verdana" forecolor="White" bordercolor="#005AFF"
													backcolor="#000488" text=" Change Sector "></ASP:BUTTON></FONT></TD>
										<TD align="center" width="80"><ASP:LINKBUTTON id="aRight" runat="server" font-size="X-Large">»</ASP:LINKBUTTON></TD>
									</TR>
								</TABLE>
							</FORM>
						</TD>
					</TR>
				</TABLE>
			<P></P>
			<ASP:PANEL id="pnlSector" runat="server" horizontalalign="Center">
				<BR>
				<BR>
				<FONT size="2">The Sector Of:
					<ASP:LABEL id="lblSectorName" runat="server" font-bold="True"></ASP:LABEL><BR>
				</FONT>
				<BR>
				<BR>
				<ASP:DATAGRID id="DataGrid1" runat="server" font-size="XX-Small" font-names="Verdana" bordercolor="Black"
					backcolor="#222222" autogeneratecolumns="False" cellspacing="-1" borderwidth="1px" borderstyle="Solid"
					width="80%" ForeColor="White">
					<HeaderStyle HorizontalAlign="Center" BackColor="#424242"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="Status" ReadOnly="True" HeaderText="Status"></asp:BoundColumn>
						<asp:BoundColumn DataField="KingdomName" ReadOnly="True" HeaderText="Kingdom Name (Sector Coords)"></asp:BoundColumn>
						<asp:BoundColumn DataField="PlanetType" ReadOnly="True" HeaderText="Planet Type"></asp:BoundColumn>
						<asp:BoundColumn DataField="RaceType" ReadOnly="True" HeaderText="Race"></asp:BoundColumn>
						<asp:BoundColumn DataField="Land" ReadOnly="True" HeaderText="Land" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
						<asp:BoundColumn DataField="Networth" ReadOnly="True" HeaderText="Networth" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
					</Columns>
				</ASP:DATAGRID>
				<BR>
				<BR>
				<FONT size="2">Total Sector Networth: </FONT>
				<ASP:LABEL id="lblNetworth" runat="server" font-size="X-Small"></ASP:LABEL>
			</ASP:PANEL>
			<P align="center"><ASP:LABEL id="lblError" runat="server" font-size="X-Small"></ASP:LABEL></P>
			<P align="center">
		</FONT>
		<BR>
		<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		<P></P>
		</TR></TBODY></TABLE>
		<CENTER></CENTER>
		</FONT>
		<CENTER>&nbsp;</CENTER>
	</BODY>
</HTML>
