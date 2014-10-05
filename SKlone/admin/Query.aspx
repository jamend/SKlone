<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Query.aspx.vb" Inherits="SKlone.admin.Query" %>
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
		<FORM runat="server">
			<FONT face="verdana" color="#ffffff" size="1">
				<P>&nbsp;</P>
				<P><ASP:TEXTBOX id="txtQuery" runat="server" width="624px" height="176px" textmode="MultiLine"></ASP:TEXTBOX></P>
				<P><ASP:BUTTON id="cmdExecute" runat="server" width="200px" text="Execute Query" forecolor="White"
						backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana" font-bold="True"
						font-size="9pt"></ASP:BUTTON></P>
				<P>Result:</P>
				<P><ASP:DATAGRID id="DataGrid1" runat="server" width="95%" forecolor="White" backcolor="#400000"
						bordercolor="Red" font-names="Verdana" font-size="XX-Small" borderwidth="1px" cellspacing="-1">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
