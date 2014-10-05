<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Buildings.aspx.vb" Inherits="SKlone.Buildings" %>
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
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FONT face="verdana" size="1">
			<P align="center">&nbsp;</P>
			<P align="center"><ASP:PANEL id="pnlStatus" runat="server" horizontalalign="Center">
			You watch as your 
workers begin constructing the buildings. <BR><BR>
<ASP:DATAGRID id="DataGrid1" runat="server" cellspacing="-1" autogeneratecolumns="False" font-size="XX-Small"
						font-names="Verdana" borderstyle="Solid" borderwidth="1px" bordercolor="#444444"
						backcolor="#222222" width="80%">
						<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
						<HEADERSTYLE horizontalalign="Center"></HEADERSTYLE>
						<COLUMNS>
							<ASP:BOUNDCOLUMN datafield="BuildingName" headertext="Time (hours)">
								<HEADERSTYLE backcolor="#424242"></HEADERSTYLE>
								<ITEMSTYLE horizontalalign="Left"></ITEMSTYLE>
							</ASP:BOUNDCOLUMN>
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
					</ASP:DATAGRID></ASP:PANEL></P>
			<P align="center">
				<ASP:LABEL id="lblError" runat="server" forecolor="White"></ASP:LABEL></P>
			<P align="center">
				<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, you have
				<ASP:LABEL id="lblFreeLand" runat="server" font-bold="True"></ASP:LABEL>&nbsp;free 
				land to build on. The cost of each building is
				<ASP:LABEL id="lblCost" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>money</B>. 
				With the resources you have you can build:
				<ASP:LABEL id="lblBuildable" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>buildings</B>. 
				It will take <STRONG>16 hours</STRONG> to complete the constructions.
			</P>
			<FORM id="Form1" runat="server">
				<P align="center">
					<ASP:TABLE id="tblBuildings" runat="server" horizontalalign="Center" width="80%" backcolor="#222222"
						bordercolor="Black" borderwidth="1px" borderstyle="Solid" font-names="Verdana" font-size="XX-Small"
						gridlines="Both">
						<ASP:TABLEROW horizontalalign="Center" backcolor="#424242">
							<ASP:TABLECELL text="Building Name"></ASP:TABLECELL>
							<ASP:TABLECELL text="Number of buildings already built"></ASP:TABLECELL>
							<ASP:TABLECELL text="Number of buildings in production"></ASP:TABLECELL>
							<ASP:TABLECELL text="Number to build"></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Residence"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtResidences"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Barracks"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtBarracks"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Air Support Bay"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtAirBays"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Nuclear Power Plant"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtNuclearPlants"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Fusion Power Plant"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtFusionPlants"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Star Mine"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtStarMines"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Training Camp"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtTrainingCamps"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Probe Factory"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtFactories"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
					</ASP:TABLE></P>
				<P align="center">
					<ASP:BUTTON id="cmdConstruct" runat="server" backcolor="#000488" bordercolor="#005AFF" forecolor="White"
						text=" Construct Buildings " font-names="Verdana"></ASP:BUTTON></P>
				<P align="center"><FONT size="2"><A href="Raze.aspx">Raze Buildings</A> </FONT>
				</P>
				<P align="center">&nbsp;</P>
			</FORM>
			<P align="left"><FONT face="verdana" size="2">&nbsp;&nbsp; ( <A href="ConstructionStatus.aspx">
						Construction Status</A> )</FONT>
			</P>
		</FONT>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
	</BODY>
</HTML>
