<%@ Page Language="vb" AutoEventWireup="false" Codebehind="News.aspx.vb" Inherits="SKlone.News" validateRequest="false" %>
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
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FONT face="verdana" size="1">
			<FORM id="Form1" method="post" runat="server">
				<P align="center">&nbsp;</P>
				<P align="center">
					<TABLE id="Table1" width="50%" border="2">
						<TBODY>
							<TR>
								<TD valign="middle" align="center" width="100%">
									<P><FONT face="verdana" size="1">View news from </FONT>
										<ASP:DROPDOWNLIST id="cboDate" runat="server">
											<ASP:LISTITEM value="0" selected="True">today</ASP:LISTITEM>
											<ASP:LISTITEM value="1">one day ago</ASP:LISTITEM>
											<ASP:LISTITEM value="2">two days ago</ASP:LISTITEM>
											<ASP:LISTITEM value="3">three days ago</ASP:LISTITEM>
										</ASP:DROPDOWNLIST>&nbsp;<ASP:BUTTON id="cmdView" runat="server" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488" text="View" forecolor="White"></ASP:BUTTON>
									</P>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome 
					to the sector news. View current or past wars that have taken place concerning 
					our sector.</P>
				<P align="center"><ASP:DATAGRID id="DataGrid1" runat="server" font-names="Verdana" bordercolor="Black" backcolor="#222222" autogeneratecolumns="False" cellspacing="-1" font-size="XX-Small" borderwidth="1px" width="80%">
						<HEADERSTYLE horizontalalign="Center" backcolor="#424242"></HEADERSTYLE>
						<COLUMNS>
							<ASP:BOUNDCOLUMN datafield="img" headertext="&#160;">
								<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="NewsDate" headertext="Date" dataformatstring="{0:MMMM d, h:mm tt}"></ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="NewsText" headertext="Description"></ASP:BOUNDCOLUMN>
						</COLUMNS>
					</ASP:DATAGRID></P>
				<P align="center">&nbsp;</P>
				<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
			</FORM>
		</FONT>
	</BODY>
</HTML>
