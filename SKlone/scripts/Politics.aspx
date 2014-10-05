<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Politics.aspx.vb" Inherits="SKlone.Politics" validateRequest="false" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
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
		<FORM runat="server" id="Form1">
			<P align="center"><BR>
				<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:PANEL id="pnlChangeVote" runat="server" visible="False" horizontalalign="center">You 
have changed your vote to 
<ASP:LABEL id="lblNewVote" runat="server" font-bold="True"></ASP:LABEL></ASP:PANEL><ASP:LABEL id="lblError" runat="server" forecolor="Red"></ASP:LABEL>
					<ASP:LABEL id="lblMsg" runat="server" forecolor="White"></ASP:LABEL></P>
				<P align="center">Hello
					<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome to the sector 
					politics. Here you will vote for your sector leader who will lead your sector 
					to victory, or death.
				</P>
				<P align="center">You are currently voting for
					<ASP:LABEL id="lblCurrentVote" runat="server" font-bold="True"></ASP:LABEL></P>
				<P align="center"><ASP:DROPDOWNLIST id="cboVote" runat="server" font-names="Verdana"></ASP:DROPDOWNLIST><ASP:BUTTON id="cmdChangeVote" runat="server" forecolor="White" text="Change Vote" backcolor="#000488"
						bordercolor="#005AFF" font-names="Verdana"></ASP:BUTTON></P>
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:DATAGRID id="DataGrid1" runat="server" backcolor="#222222" bordercolor="Black" font-names="Verdana"
						borderwidth="1px" borderstyle="Solid" font-size="XX-Small" width="80%" cellspacing="-1">
						<HEADERSTYLE horizontalalign="Center" backcolor="#424242"></HEADERSTYLE>
					</ASP:DATAGRID></P>
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlSectorLeader" runat="server" visible="False">
					<P align="center">&nbsp;</P>
					<P align="center">You are the sector leader so you get to choose the sector name. 
						It can be anything as long as it is not offending.</P>
					<P align="center">Sector Name:
						<ASP:TEXTBOX id="txtSectorName" runat="server" font-names="Verdana" size="20" maxlength="40"></ASP:TEXTBOX>
						<ASP:BUTTON id="cmdSectorName" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
							backcolor="#000488" text="Change Name"></ASP:BUTTON></P>
					<P align="center">You can also choose to type a message to the people in your 
						sector that they will see whenever they login.<BR>
						<BR>
						<BR>
						Login Message:
						<ASP:TEXTBOX id="txtLoginMessage" runat="server" font-names="Verdana" size="42" maxlength="250"></ASP:TEXTBOX><BR>
						<ASP:BUTTON id="cmdLoginMessage" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
							backcolor="#000488" text="Submit Login Message"></ASP:BUTTON></P>
					<P align="center">You can also choose to change your sector password here. This is 
						the password used for users to group sign up.</P>
					<P align="center">Group Sign Up Password :
						<ASP:TEXTBOX id="txtGroupPassword" runat="server" font-names="Verdana" size="42" maxlength="15"
							Width="139px"></ASP:TEXTBOX>
						<ASP:BUTTON id="cmdPassword" runat="server" forecolor="White" font-names="Verdana" bordercolor="#005AFF"
							backcolor="#000488" text="Change Password"></ASP:BUTTON></P>
					<P align="center">&nbsp;</P>
					<P align="center">&nbsp;</P>
				</ASP:PANEL>
				<P>&nbsp;</P>
				<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
			</FONT>
		</FORM>
	</BODY>
</HTML>
