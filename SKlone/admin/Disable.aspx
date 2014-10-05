<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Disable.aspx.vb" Inherits="SKlone.admin.Disable" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>SKlone Administration</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<BODY bgColor="#444444">
		<FORM id="Form1" runat="server">
			<FONT face="verdana" color="#ffffff" size="1">
				<BR>
				<P>&nbsp;<ASP:BUTTON id="cmdDisable" runat="server" font-bold="True" font-size="9pt" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" width="200px" forecolor="White" text="Disable Kingdom:"
						enabled="True"></ASP:BUTTON>
					&nbsp;
					<ASP:TEXTBOX id="txtkdID" runat="server" width="40px" maxlength="4"></ASP:TEXTBOX>&nbsp;Kingdoms 
					ID</P>
				<P>&nbsp;</P>
				<P>
					<ASP:BUTTON id="cmdEnable" runat="server" enabled="True" text="Enable Kingdom:" forecolor="White"
						width="200px" backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana"
						font-size="9pt" font-bold="True"></ASP:BUTTON>&nbsp;&nbsp;
					<ASP:TEXTBOX id="txtkdID2" runat="server" width="40px" maxlength="4"></ASP:TEXTBOX>&nbsp;Kingdoms 
					ID</P>
				<P>Result:</P>
				<P><ASP:DATAGRID id="DataGrid1" runat="server" font-size="XX-Small" font-names="Verdana" borderwidth="1px"
						bordercolor="Red" backcolor="#400000" width="95%" forecolor="White" cellspacing="-1">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
