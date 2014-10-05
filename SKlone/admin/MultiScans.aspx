<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MultiScans.aspx.vb" Inherits="SKlone.admin.MultiScans" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>SKlone Administration</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<BODY bgcolor="#444444">
		<FORM runat="server">
			<FONT face="verdana" color="#ffffff" size="1">
				<BR>
				<P>Max Results:
					<ASP:TEXTBOX id="txtMax" runat="server" width="40px" maxlength="5">50</ASP:TEXTBOX></P>
				<P><ASP:BUTTON id="cmdScan1" runat="server" font-size="9pt" font-bold="True" font-names="Verdana" borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Kingdom Name Scan" width="200px"></ASP:BUTTON>&nbsp;<ASP:BUTTON id="cmdScan2" runat="server" font-size="9pt" font-bold="True" font-names="Verdana" borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Ruler Name Scan" width="200px"></ASP:BUTTON></P>
				<P><ASP:BUTTON id="cmdScan3" runat="server" font-size="9pt" font-bold="True" font-names="Verdana" borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Account Name Scan" width="200px"></ASP:BUTTON>&nbsp;<ASP:BUTTON id="cmdScan4" runat="server" font-size="9pt" font-bold="True" font-names="Verdana" borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Same Password Scan" width="200px"></ASP:BUTTON></P>
				<P><ASP:BUTTON id="cmdScan5" runat="server" font-size="9pt" font-bold="True" font-names="Verdana" borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="IP Activity Scan" width="200px"></ASP:BUTTON></P>
				<P align="center">
					<ASP:DATAGRID id="DataGrid1" runat="server" font-size="XX-Small" font-names="Verdana" bordercolor="Red" backcolor="#400000" width="95%" borderwidth="1px" cellspacing="-1" forecolor="White">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
