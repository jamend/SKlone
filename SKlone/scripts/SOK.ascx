<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SOK.ascx.vb" Inherits="SKlone.SOK" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableViewState="False"%>
<TABLE id="Table1" borderColor="#555555" cellSpacing="1" cellPadding="1" width="100%" bgColor="#222222"
	border="1">
	<TR>
		<TD align="center" bgColor="#000022"><FONT face="verdana" size="1">The kingdom of
				<ASP:LABEL id="lblKingdomName" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<ASP:LABEL id="lblDate" runat="server"></ASP:LABEL></FONT></TD>
	</TR>
	<TR>
		<TD align="center">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD width="10%"></TD>
					<TD width="*"><FONT face="verdana" size="1">Name:
							<ASP:LABEL id="lblRulerName" runat="server" font-bold="True"></ASP:LABEL><BR>
							<BR>
							Land:
							<ASP:LABEL id="lblLand" runat="server" font-bold="True"></ASP:LABEL><BR>
							Networth:
							<ASP:LABEL id="lblNetworth" runat="server" font-bold="True"></ASP:LABEL><BR>
							<BR>
							Money:
							<ASP:LABEL id="lblMoney" runat="server" font-bold="True"></ASP:LABEL><BR>
							Power:
							<ASP:LABEL id="lblPower" runat="server" font-bold="True"></ASP:LABEL><BR>
							Population:
							<ASP:LABEL id="lblPopulation" runat="server" font-bold="True"></ASP:LABEL><BR>
							<BR>
							MA Protection:
							<ASP:LABEL id="lblMA" runat="server" font-bold="True"></ASP:LABEL><BR>
						</FONT>
					</TD>
					<TD width="10%"></TD>
					<TD width="*"><FONT face="verdana" size="1">Planet Type:
							<ASP:LABEL id="lblPlanetType" runat="server" font-bold="True"></ASP:LABEL><BR>
							<FONT face="verdana" size="1">Race:
								<ASP:LABEL id="lblRaceType" runat="server" font-bold="True"></ASP:LABEL><BR>
								<BR>
								<ASP:LABEL id="lblSoldiers" runat="server"></ASP:LABEL><BR>
								<ASP:LABEL id="lblTroopers" runat="server"></ASP:LABEL><ASP:LABEL id="lblDragoons" runat="server" visible="False"></ASP:LABEL><BR>
								<ASP:LABEL id="lblLTroopers" runat="server"></ASP:LABEL><ASP:LABEL id="lblLDragoons" runat="server" visible="False"></ASP:LABEL><ASP:LABEL id="lblTFs" runat="server" visible="False"></ASP:LABEL><BR>
								<BR>
								<ASP:LABEL id="lblTanks" runat="server"></ASP:LABEL><BR>
								<ASP:LABEL id="lblScientists" runat="server"></ASP:LABEL><BR>
								Probes:
								<ASP:LABEL id="lblProbes" runat="server" font-bold="True"></ASP:LABEL></FONT></FONT></TD>
					<TD width="30%"></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
