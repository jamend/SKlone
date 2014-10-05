<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Explore.aspx.vb" Inherits="SKlone.Explore" %>
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
		<FONT face="verdana" size="1">
			<P align="center"><BR>
			</P>
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<P align="center">&nbsp;</P>
			<ASP:PANEL id="pnlExplored" runat="server" horizontalalign="Center">
				<P align="center">You send your workers out to explore
					<ASP:LABEL id="lblExplored" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>units 
						of land</B>. Here is a report of the land you will recieve in the next 24 
					hours:
				</P>
				<P align="center">
					<ASP:DATAGRID id="DataGrid1" runat="server" autogeneratecolumns="False" width="80%" backcolor="#222222"
						bordercolor="#444444" borderwidth="1px" borderstyle="Solid" font-names="Verdana" font-size="XX-Small"
						cellspacing="-1">
						<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
						<HEADERSTYLE horizontalalign="Center" backcolor="#222222"></HEADERSTYLE>
						<COLUMNS>
							<ASP:HYPERLINKCOLUMN text="LAND" headertext="Time (hours)">
								<HEADERSTYLE backcolor="#424242"></HEADERSTYLE>
								<ITEMSTYLE horizontalalign="Left"></ITEMSTYLE>
							</ASP:HYPERLINKCOLUMN>
							<ASP:BOUNDCOLUMN datafield="1" headertext="1" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="2" headertext="2" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="3" headertext="3" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="4" headertext="4" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="5" headertext="5" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="6" headertext="6" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="7" headertext="7" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="8" headertext="8" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="9" headertext="9" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="10" headertext="10" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="11" headertext="11" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="12" headertext="12" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="13" headertext="13" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="14" headertext="14" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="15" headertext="15" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="16" headertext="16" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="17" headertext="17" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="18" headertext="18" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="19" headertext="19" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="20" headertext="20" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="21" headertext="21" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="22" headertext="22" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="23" headertext="23" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
							<ASP:BOUNDCOLUMN datafield="24" headertext="24" dataformatstring="{0:###,###,###,###,##0}">
								<HEADERSTYLE font-bold="True"></HEADERSTYLE>
							</ASP:BOUNDCOLUMN>
						</COLUMNS>
					</ASP:DATAGRID></P>
			</ASP:PANEL>
			<P align="center"><ASP:LABEL id="lblError" runat="server" visible="false"></ASP:LABEL></P>
			<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, you can 
				send out skilled workers to explore and settle lands for you to control. These 
				workers are not cheap, but I'm sure you'll see that the land is well worth it.</P>
			<FORM id="Form1" method="get" runat="server">
				<P align="center">
					<TABLE id="Table1" cellspacing="0" cellpadding="0" width="60%" border="1">
						<TR>
							<TD align="center">
								<P><FONT face="verdana" size="1">One unit of land costs
										<ASP:LABEL id="lblExploreCost" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>money</B>. 
										It will take 24 hours to complete. You can explore a maximum of
										<ASP:LABEL id="lblExplorable" runat="server" font-bold="True"></ASP:LABEL>&nbsp;land.
										<BR>
										You are currently exploring
										<ASP:LABEL id="lblExploring" runat="server" font-bold="True"></ASP:LABEL>&nbsp;land.
										<BR>
										<BR>
										Units of Land:
										<ASP:TEXTBOX id="txtLand" runat="server" font-name="verdana" size="4"></ASP:TEXTBOX><BR>
										<ASP:BUTTON id="cmdExplore" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
											forecolor="White" text=" Explore "></ASP:BUTTON><BR>
										&nbsp; </FONT>
								</P>
							</TD>
						</TR>
					</TABLE>
				</P>
				<P align="center">&nbsp;</P>
			</FORM>
			<P align="left"><FONT face="verdana" size="2">&nbsp;&nbsp; ( <A href="ConstructionStatus.aspx">
						Construction Status</A> )</FONT>
			</P>
			<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
		</FONT>
	</BODY>
</HTML>
