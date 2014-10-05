<%@ Control Language="vb" AutoEventWireup="false" Codebehind="TopInfoBar.ascx.vb" Inherits="SKlone.TopInfoBar" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableViewState="False"%>
<TABLE bordercolor="#000f99" cellspacing="0" cellpadding="0" width="100%" border="1">
	<TR align="center">
		<TD style="HEIGHT: 14px"><FONT face="verdana" size="1"><ASP:HYPERLINK id="aMessages" runat="server" navigateurl="Msg.aspx"></ASP:HYPERLINK></FONT></TD>
		<TD style="HEIGHT: 14px"><FONT face="verdana" size="1"><ASP:HYPERLINK id="aNews" runat="server"></ASP:HYPERLINK></FONT></TD>
		<TD style="HEIGHT: 14px"><FONT face="verdana" size="1"><ASP:LABEL id="lblDate" runat="server"></ASP:LABEL></FONT></TD>
		<TD style="HEIGHT: 14px" bgcolor="#00085a"><FONT face="verdana" size="1">Networth:
				<ASP:LABEL id="lblNetworth" runat="server"></ASP:LABEL></FONT></TD>
	</TR>
	<TR align="center">
		<TD bgcolor="#00085a"><FONT face="verdana" size="1">Money:
				<ASP:LABEL id="lblMoney" runat="server"></ASP:LABEL></FONT></TD>
		<TD bgcolor="#00085a"><FONT face="verdana" size="1"><ASP:LABEL id="lblPower" runat="server"></ASP:LABEL></FONT></TD>
		<TD bgcolor="#00085a"><FONT face="verdana" size="1">Population:
				<ASP:LABEL id="lblPopulation" runat="server"></ASP:LABEL></FONT></TD>
		<TD bgcolor="#00085a"><FONT face="verdana" size="1">Land:
				<ASP:LABEL id="lblLand" runat="server"></ASP:LABEL></FONT></TD>
	</TR>
</TABLE>
<FONT face="verdana" size="1">
	<P id="P1" align="center" runat="server"><ASP:LABEL id="lblNewbieMode" runat="server"></ASP:LABEL></P>
	<P id="P2" align="center" runat="server"><ASP:LABEL id="lblGameState" runat="server"></ASP:LABEL></P>
	<P id="P3" align="center" runat="server"><ASP:LABEL id="lblVacation" runat="server"></ASP:LABEL></P>
</FONT>
