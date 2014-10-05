<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Tick.aspx.vb" Inherits="SKlone.admin.Tick" %>
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
				<P><ASP:BUTTON id="cmdTick" runat="server" font-size="9pt" font-bold="True" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="tick" width="200px"
						enabled="True"></ASP:BUTTON>&nbsp;</P>
				<P><ASP:BUTTON id="cmdTickMany" runat="server" font-size="9pt" font-bold="True" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="tick:" width="200px"
						enabled="True"></ASP:BUTTON>
					&nbsp;
					<ASP:TEXTBOX id="txtTimes" runat="server" width="40px" maxlength="3">5</ASP:TEXTBOX>&nbsp;times</P>
				<P>Result:</P>
				<P><ASP:DATAGRID id="DataGrid1" runat="server" width="95%" forecolor="White" backcolor="#400000"
						bordercolor="Red" font-names="Verdana" font-size="XX-Small" cellspacing="-1" borderwidth="1px">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
