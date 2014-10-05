<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Delete.aspx.vb" Inherits="SKlone.admin.Delete2" %>
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
				<P>&nbsp;</P>
				<P>
					<ASP:DATAGRID id="DataGrid1" runat="server" forecolor="White" width="95%" backcolor="#400000"
						bordercolor="Red" font-names="Verdana" font-size="XX-Small" cellspacing="-1" borderwidth="1px">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
				<P>&nbsp;</P>
				<P>
					<ASP:BUTTON id="cmdShowKingdoms" runat="server" enabled="True" text="Show Kingdoms" forecolor="White"
						width="111px" backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana"
						font-size="9pt" font-bold="True"></ASP:BUTTON>
					<ASP:TEXTBOX id="txtkdID" runat="server" width="40px" maxlength="4"></ASP:TEXTBOX>&nbsp;Kingdom 
					ID (Required)
					<BR>
				</P>
				<P><ASP:BUTTON id="cmdDelete" runat="server" font-bold="True" font-size="9pt" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" width="200px" forecolor="White"
						text="Delete Kingdom" enabled="True"></ASP:BUTTON></P>
				<P>&nbsp;</P>
				<P>&nbsp;</P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
