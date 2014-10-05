<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" autoeventwireup="false" codebehind="SendAid.aspx.vb" Inherits="SKlone.SendAid" validaterequest="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Status</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<style>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</style>
	</HEAD>
	<body text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<p align="center">
			<br>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR>
		</p>
		<font face="verdana" size="1">
			<P align="center">
				<asp:Label id="lblError" runat="server"></asp:Label></P>
			<form id="Form1" method="post" runat="server">
				<p align="center">
				</p>
				<p align="center">
					<table id="Table1" border="2">
						<tbody>
							<tr>
								<td valign="middle" align="center" width="100%">
									<p>
										<font face="verdana" size="2">Choose a troubled kingdom to send aid to. </font>
									</p>
									<p>
										<ASP:DROPDOWNLIST id="cboKingdom" runat="server"></ASP:DROPDOWNLIST>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</p>
				<p align="center">
					<asp:Label id="lblRulerName" runat="server"></asp:Label>, you can send your 
					supplies and skilled soldiers to help out any kingdom that is in need. You 
					cannot send aid to a kingdom that does not have trouble status.
				</p>
				<p align="center">
					<ASP:TABLE id="tblBuildings" runat="server" gridlines="Both" borderwidth="1px" borderstyle="Solid"
						font-size="XX-Small" width="80%" backcolor="#222222" bordercolor="Black" font-names="Verdana"
						horizontalalign="Center">
						<ASP:TABLEROW horizontalalign="Center" backcolor="#424242">
							<ASP:TABLECELL text="Supply Type"></ASP:TABLECELL>
							<ASP:TABLECELL text="Available to send"></ASP:TABLECELL>
							<ASP:TABLECELL text="Send Amount"></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Soldiers"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" font-name="verdana" id="txtSoldiers"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Money"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" font-name="verdana" id="txtMoney"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Power"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" font-name="verdana" id="txtPower"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Population"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" font-name="verdana" id="txtPopulation"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
					</ASP:TABLE>
				</p>
				<p align="center">
					<ASP:BUTTON id="cmdSendAid" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						text="Send Aid" forecolor="White"></ASP:BUTTON>
				</p>
				<p align="center">
				</p>
				<p align="left">
					<font face="verdana" size="2">&nbsp;&nbsp; ( <a href="Status.aspx">Kingdom Status</a>
						)</font>
				</p>
				<p align="center">
					<ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER>
				</p>
			</form>
		</font>
	</body>
</HTML>
