<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Alliancecontrol.aspx.vb" Inherits="SKlone.scripts.AllianceControl" %>
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
	<BODY text="#ffffff" vLink="#447cff" aLink="#4e9f5f" link="#447cff" bgColor="#000000">
		<FORM id="Form1" runat="server">
			<P align="center"><BR>
				<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center"></P>
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblError" runat="server" visible="False"></ASP:LABEL></P>
				<P align="center">
					<TABLE id="Table6" borderColor="#000000" width="391" bgColor="#222222" border="1" style="WIDTH: 391px; HEIGHT: 364px">
						<TBODY>
							<TR>
								<TD style="HEIGHT: 1px" align="center" bgColor="#424242"><FONT face="verdana" size="1">&nbsp;<FONT size="1">Change 
											Alliance Password</FONT> </FONT>
								</TD>
							</TR>
							<TR align="center">
								<TD>
									<P><FONT face="verdana"></FONT><FONT size="1">Old Password<BR>
											<ASP:TEXTBOX id="txtOldPassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
											<BR>
											New Password<BR>
											<ASP:TEXTBOX id="txtNewPassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
											<BR>
											New Password Again<BR>
											<ASP:TEXTBOX id="txtConfirm" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX></FONT><BR>
										<BR>
										<ASP:BUTTON id="cmdChangePassword" runat="server" font-names="Verdana" text="Change Password"
											forecolor="White" backcolor="#000488" bordercolor="#005AFF"></ASP:BUTTON><BR>
										<BR>
									</P>
			</FONT></TD></TR>
			<TR>
				<TD align="center" bgColor="#424242"><FONT face="verdana" size="1">Delete Alliance</FONT></TD>
			</TR>
			<TR align="center">
				<TD>
					<P><FONT face="verdana"></FONT><FONT size="1">Password<BR>
							<ASP:TEXTBOX id="txtDeletePassword" runat="server" textmode="Password" font-names="Verdana"></ASP:TEXTBOX><BR>
						</FONT>
						<BR>
						<ASP:BUTTON id="cmdDelete" runat="server" font-names="Verdana" text="Delete Alliance" forecolor="White"
							backcolor="#000488" bordercolor="#005AFF"></ASP:BUTTON></P>
					<P></P>
					<FONT face="verdana" size="1">Alliance Message</FRONT>
						<P></P>
						<P>
							<ASP:TEXTBOX id="txtLoginMessage" runat="server" font-names="Verdana" maxlength="250" size="42"></ASP:TEXTBOX><BR>
							<ASP:BUTTON id="cmdLoginMessage" runat="server" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488"
								forecolor="White" text="Submit Login Message"></ASP:BUTTON></P>
					</FONT>
				</TD>
			</TR>
			</TBODY></TABLE></P>
			<P align="center">Choose Alliance Helper</P>
			<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
			<P align="center"><ASP:BUTTON id="cmdSetHelper" runat="server" font-names="Verdana" text="Set Helper" forecolor="White"
					backcolor="#000488" bordercolor="#005AFF"></ASP:BUTTON></P>
			<P align="center"><ASP:PLACEHOLDER id="PlaceHolder2" runat="server"></ASP:PLACEHOLDER>&nbsp;</P>
			<P align="center"><ASP:DROPDOWNLIST id="cboRelationType" runat="server">
					<asp:ListItem Value="0">War</asp:ListItem>
					<asp:ListItem Value="1">Peace</asp:ListItem>
					<asp:ListItem Value="2">Ally</asp:ListItem>
					<asp:ListItem Value="3">Nap</asp:ListItem>
				</ASP:DROPDOWNLIST></P>
			<P align="center"><ASP:BUTTON id="cmdSetRelation" runat="server" font-names="Verdana" text="Set Relation" forecolor="White"
					backcolor="#000488" bordercolor="#005AFF"></ASP:BUTTON></P>
			<P align="center">
				<ASP:BUTTON id="cmdCancelRelation" runat="server" font-names="Verdana" bordercolor="#005AFF"
					backcolor="#000488" forecolor="White" text="Cancel Relation"></ASP:BUTTON></P>
			<P align="center">&nbsp;</P>
			<P align="center">
				<ASP:TABLE id="tblScores" runat="server" font-names="Verdana" bordercolor="Black" backcolor="#222222"
					gridlines="Both" horizontalalign="Center" borderstyle="Solid" borderwidth="1px" font-size="XX-Small"
					width="80%">
					<asp:TableRow HorizontalAlign="Center" BackColor="#424242">
						<asp:TableCell Text="&#160;"></asp:TableCell>
						<asp:TableCell Text="Sector"></asp:TableCell>
						<asp:TableCell Text="Networth"></asp:TableCell>
						<asp:TableCell Text="Boot"></asp:TableCell>
					</asp:TableRow>
				</ASP:TABLE></P>
			<P align="center">
				<ASP:BUTTON id="cmdSectorBoot" runat="server" font-names="Verdana" bordercolor="#005AFF" backcolor="#000488"
					forecolor="White" text="Boot Sector"></ASP:BUTTON></P>
			<P align="center">&nbsp;</P>
			<P align="center">
				<SKLONE:BOTTOMINFOBAR runat="server" id="BottomInfoBar1"></SKLONE:BOTTOMINFOBAR></P>
			</FONT></FORM>
	</BODY>
</HTML>
