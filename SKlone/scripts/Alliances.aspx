<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Alliances.aspx.vb" Inherits="SKlone.scripts.Alliances" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
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
		<FORM runat="server" id="Form3">
			<P align="center"><BR>
			</P>
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome 
					to the alliance HQ for your sector. Here we will provide you with the alliance 
					you are joined with, and access to the alliance forums.
				</P>
				<P align="center"><ASP:LABEL id="lblError" runat="server" forecolor="Red" visible="False" font-size="X-Small"></ASP:LABEL>
					<ASP:LABEL id="lblSuccess" runat="server" font-size="X-Small" visible="False" forecolor="Red"></ASP:LABEL></P>
				<P align="center"><ASP:LABEL id="lblCurrentAlliance" runat="server"></ASP:LABEL></P>
				<ASP:PANEL id="pnlAllianceInfo" runat="server" visible="False">
					<P align="center">
						<ASP:HYPERLINK id="aInfo" runat="server"></ASP:HYPERLINK></P>
					<P align="center">
						<ASP:HYPERLINK id="aSectors" runat="server" navigateurl="AllianceSectors.aspx"></ASP:HYPERLINK></P>
					<P align="center">
						<ASP:HYPERLINK id="aForums" runat="server" navigateurl="AllianceForums.aspx"></ASP:HYPERLINK></P>
				</ASP:PANEL>
				<P align="center"><ASP:PANEL id="pnlSL" runat="server"><BR>
						<ASP:PANEL id="pnlJoin" runat="server">Alliance Name: 
<ASP:TEXTBOX id="txtAllianceName" runat="server" font-names="Verdana" maxlength="16" size="8"></ASP:TEXTBOX><BR>Alliance 
Password: 
<ASP:TEXTBOX id="txtAlliancePassword" runat="server" font-names="Verdana" maxlength="16" size="8"></ASP:TEXTBOX><BR><BR>
<ASP:BUTTON id="cmdJoin" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
								text="Join Alliance" backcolor="#000488"></ASP:BUTTON></ASP:PANEL>
						<ASP:PANEL id="pnlLeave" runat="server">
							<ASP:BUTTON id="cmdLeave" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
								text="Leave Your Current Alliance" backcolor="#000488"></ASP:BUTTON>
						</ASP:PANEL>
						<BR>
						<BR>
					</ASP:PANEL></P>
				<P align="center"><ASP:PANEL id="pnlCreate" runat="server">
					Any kingdom in the universe can create an alliance, however only 
your sector leader may choose which alliance it will join. <BR><BR>
<TABLE style="FONT-SIZE: xx-small; FONT-FAMILY: Verdana" cellSpacing="0" cellPadding="0"
							width="50%" border="1">
							<TR align="center" bgColor="#222222">
								<TD>Create an alliance
								</TD>
							</TR>
							<TR align="center">
								<TD>Alliance Name:
									<ASP:TEXTBOX id="txtCreateName" runat="server" font-names="Verdana" maxlength="16" size="8"></ASP:TEXTBOX><BR>
									Password:
									<ASP:TEXTBOX id="txtCreatePassword" runat="server" font-names="Verdana" maxlength="16" size="8"></ASP:TEXTBOX><BR>
									<BR>
									<ASP:BUTTON id="cmdCreate" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
										text="Create Alliance" backcolor="#000488"></ASP:BUTTON></TD>
							</TR>
						</TABLE><BR><BR></ASP:PANEL></P>
				<P align="center"><ASP:PANEL id="pnlAccess" runat="server">
					If you are currently in charge of an alliance you may either 
choose to delete it, change the alliance password, or remove sectors from your 
alliance. Only the kingdom that first created in the alliance is 'in charge' of 
the alliance. <BR><BR>Alliance Name: 
<ASP:TEXTBOX id="txtAccessName" runat="server" font-names="Verdana" maxlength="16" size="8"></ASP:TEXTBOX><BR>
<ASP:BUTTON id="cmdAccess" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
							text="Access Alliance Control Centre" backcolor="#000488"></ASP:BUTTON><BR><BR></ASP:PANEL></P>
				<P align="center"><ASP:TABLE id="tblAlliances" runat="server" bordercolor="#444444" font-names="Verdana" width="80%"
						font-size="XX-Small" gridlines="Both" borderwidth="1px">
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL></ASP:TABLECELL>
						</ASP:TABLEROW>
					</ASP:TABLE></P>
				<P align="center">&nbsp;</P>
			</FONT>
			<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		</FORM>
	</BODY>
</HTML>
