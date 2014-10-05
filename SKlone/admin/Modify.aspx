<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Modify.aspx.vb" Inherits="SKlone.admin.Modify" %>
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
					<ASP:DATAGRID id="DataGrid1" runat="server" width="95%" forecolor="White" backcolor="#400000"
						bordercolor="Red" font-names="Verdana" font-size="XX-Small" cellspacing="-1" borderwidth="1px">
						<HEADERSTYLE backcolor="Maroon"></HEADERSTYLE>
					</ASP:DATAGRID></P>
				<P>&nbsp;</P>
				<P>&nbsp;
					<ASP:BUTTON id="cmdShowKingdoms" runat="server" width="111px" enabled="True" text="Show Kingdoms"
						forecolor="White" backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana"
						font-size="9pt" font-bold="True"></ASP:BUTTON>
					<ASP:TEXTBOX id="txtkdID" runat="server" width="40px" maxlength="4"></ASP:TEXTBOX>Kingdom 
					ID (Required)</P>
				<P title="<< General Account Information >>" style="FONT-WEIGHT: bold; FONT-SIZE: medium"
					align="center">&lt;&lt; General Account Information &gt;&gt;</P>
				<P>User&nbsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<ASP:TEXTBOX id="txtUserName" runat="server" maxlength="24" width="106px"></ASP:TEXTBOX>&nbsp;
					<ASP:BUTTON id="cmdSubmit2" runat="server" width="64px" font-bold="True" font-size="9pt" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Submit" enabled="True"></ASP:BUTTON></P>
				<P>User Password:&nbsp;&nbsp;&nbsp;&nbsp;
					<ASP:TEXTBOX id="txtUserPassword" runat="server" maxlength="24" width="106px"></ASP:TEXTBOX>&nbsp;
					<ASP:BUTTON id="cmdSubmit3" runat="server" width="64px" font-bold="True" font-size="9pt" font-names="Verdana"
						borderstyle="Outset" bordercolor="Red" backcolor="Red" forecolor="White" text="Submit" enabled="True"></ASP:BUTTON></P>
				<P>
					Kingdom Name:&nbsp;&nbsp;&nbsp;
					<ASP:TEXTBOX id="txtKingdomName" runat="server" width="106px" maxlength="24"></ASP:TEXTBOX>&nbsp;
					<ASP:BUTTON id="cmdSubmit1" runat="server" enabled="True" text="Submit" forecolor="White" width="64px"
						backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana" font-size="9pt"
						font-bold="True"></ASP:BUTTON></P>
				<P>
					Ruler Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<ASP:TEXTBOX id="txtRulerName" runat="server" width="106px" maxlength="24"></ASP:TEXTBOX>&nbsp;
					<ASP:BUTTON id="cmdSubmit" runat="server" enabled="True" text="Submit" forecolor="White" width="64px"
						backcolor="Red" bordercolor="Red" borderstyle="Outset" font-names="Verdana" font-size="9pt"
						font-bold="True"></ASP:BUTTON></P>
				<P>&nbsp;</P>
				<P>&nbsp;</P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
