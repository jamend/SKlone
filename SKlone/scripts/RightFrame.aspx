<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="RightFrame.aspx.vb" Inherits="SKlone.RightFrame" %>
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
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<P align="left"><IMG height="62" src="../images/sklone_logo.jpg" width="223">
		</P>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
		<P align="center"><BR>
		</P>
		<P align="center">
			<TABLE bordercolor="#444444" cellspacing="0" cellpadding="0" width="80%" border="1">
				<TR>
					<TD align="center" bgcolor="#222222"><FONT face="verdana" size="1"><B>Login Message from 
								Sector Leader:</B></FONT></TD>
				</TR>
				<TR>
					<TD><FONT face="verdana" size="1"><ASP:LABEL id="lblSectorMessage" runat="server"></ASP:LABEL></FONT></TD>
				</TR>
			</TABLE>
		</P>
		<P align="center">
			<asp:Panel id="pnlAllianceMessage" runat="server">
				<P align="center">
					<TABLE id="Table1" borderColor="#444444" cellSpacing="0" cellPadding="0" width="80%" border="1">
						<TR>
							<TD align="center" bgColor="#222222"><FONT face="verdana" size="1"><B>Login Message from 
										Alliance Leader:</B></FONT></TD>
						</TR>
						<TR>
							<TD><FONT face="verdana" size="1">
									<ASP:LABEL id="lblAllianceMessage" runat="server"></ASP:LABEL></FONT></TD>
						</TR>
					</TABLE>
				</P>
			</asp:Panel><BR>
			<BR>
			<BR>
		<P align="center">
			<FONT face="verdana" size="2">
				<ASP:HYPERLINK id="aPreviousNews" runat="server" font-bold="True" navigateurl="RightFrame.aspx?action=OldNews">Previous News</ASP:HYPERLINK><ASP:LABEL id="lblPreviousNews" runat="server" visible="False">Previous News:</ASP:LABEL><BR>
				<BR>
				<ASP:LABEL id="lblNoNews" runat="server" visible="False">No News</ASP:LABEL></FONT><FONT face="verdana" size="2"><BR>
				<ASP:DATAGRID id="DataGrid1" runat="server" visible="False" cellspacing="2" bordercolor="#000022"
					cellpadding="0" borderwidth="1px" borderstyle="Solid" font-names="Verdana" font-size="XX-Small"
					width="80%" showheader="False" autogeneratecolumns="False">
					<COLUMNS>
						<ASP:BOUNDCOLUMN datafield="NewsDate" readonly="True" dataformatstring="{0:MMMM d, h:mm tt}">
							<HEADERSTYLE></HEADERSTYLE>
							<ITEMSTYLE horizontalalign="Center" verticalalign="Top" backcolor="#424242" width="15%"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
						<ASP:BOUNDCOLUMN datafield="NewsText" readonly="True">
							<HEADERSTYLE></HEADERSTYLE>
							<ITEMSTYLE horizontalalign="Left" backcolor="#222222" width="85%"></ITEMSTYLE>
						</ASP:BOUNDCOLUMN>
					</COLUMNS>
				</ASP:DATAGRID></P>
		</FONT>
		<P></P>
		<P align="center"><BR>
			<BR>
			<asp:Label id="lblAlliance" runat="server" Visible="False"></asp:Label>
			<BR>
			<BR>
			<BR>
			<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
