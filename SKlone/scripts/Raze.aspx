<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Raze.aspx.vb" Inherits="SKlone.Raze" %>
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
			<P align="center"><ASP:PANEL id="pnlStatus" runat="server" horizontalalign="Center">You watch as your 
workers demolish 
<B>
						<ASP:LABEL id="lblRazed" runat="server"></ASP:LABEL>&nbsp;buildings</B>.</ASP:PANEL>
				<ASP:PANEL id="pnlError" runat="server" horizontalalign="Center" visible="False">I'm sorry, but you did not give us 
complete orders.</ASP:PANEL></P>
			<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, our 
				demolition squad can destroy as many buildings as you want. The cost is only <STRONG>
					50 money</STRONG> per building. We await your orders!
			</P>
			<FORM id="Form1" runat="server">
				<P align="center"><ASP:TABLE id="tblBuildings" runat="server" horizontalalign="Center" gridlines="Both" width="80%"
						backcolor="#440000" bordercolor="Black" borderwidth="1px" borderstyle="Solid" font-names="Verdana" font-size="XX-Small">
						<ASP:TABLEROW horizontalalign="Center" backcolor="#720000">
							<ASP:TABLECELL text="Building Name"></ASP:TABLECELL>
							<ASP:TABLECELL text="Number of buildings available"></ASP:TABLECELL>
							<ASP:TABLECELL text="Number to raze"></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Residence"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtResidences"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Barracks"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtBarracks"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Air Bays"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtAirBays"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Nuclear Power Plant"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtNuclearPlants"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Fusion Power Plant"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtFusionPlants"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Star Mine"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtStarMines"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Training Camp"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtTrainingCamps"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Left">
							<ASP:TABLECELL text="Probe Factory"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL horizontalalign="Center">
								<ASP:TEXTBOX runat="server" size="4" font-name="verdana" id="txtFactories"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
					</ASP:TABLE></P>
				<P align="center"><ASP:BUTTON id="cmdRaze" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						text=" Raze Buildings " forecolor="White"></ASP:BUTTON></P>
				<P align="center"><FONT size="2"><A href="Buildings.aspx">Construct&nbsp;Buildings</A> </FONT>
				</P>
				<P align="center">&nbsp;</P>
			</FORM>
		</FONT>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
	</BODY>
</HTML>
