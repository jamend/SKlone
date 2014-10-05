<%@ Page Language="vb" AutoEventWireup="false" Codebehind="AllianceForums.aspx.vb" Inherits="SKlone.scripts.AllianceForums" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
		<ASP:LABEL id="lblLand" runat="server"></ASP:LABEL>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</STYLE>
		<SCRIPT language="JavaScript">
var noClick = 1;

function doSubmit() {

 if (noClick == 1) {
   noClick = 0
   return true;
 }
 else { 
  return false;
 }

}
</SCRIPT>
	</HEAD>
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<FORM runat="server" id="Form1">
			<P align="center"><BR>
			</P>
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlForums" runat="server" horizontalalign="Center">
					<P align="center">Alliance forums for the
						<ASP:LABEL id="lblAlliance" runat="server" font-bold="True"></ASP:LABEL>&nbsp;alliance.
						<BR>
						Your alliance leader is
						<ASP:LABEL id="lblAL" runat="server" font-bold="True"></ASP:LABEL></P>
					<P align="center">
						<ASP:TABLE id="tblThreads" runat="server" horizontalalign="Center" gridlines="Both" width="80%" backcolor="#222222" bordercolor="Black" borderwidth="1px" borderstyle="Solid" font-names="Verdana" font-size="XX-Small">
							<ASP:TABLEROW horizontalalign="Center" backcolor="#424242">
								<ASP:TABLECELL text="Topic"></ASP:TABLECELL>
								<ASP:TABLECELL text="Replies"></ASP:TABLECELL>
								<ASP:TABLECELL text="Views"></ASP:TABLECELL>
								<ASP:TABLECELL text="Origin"></ASP:TABLECELL>
								<ASP:TABLECELL text="Last Post"></ASP:TABLECELL>
								<ASP:TABLECELL text="Date"></ASP:TABLECELL>
							</ASP:TABLEROW>
						</ASP:TABLE></P>
					<P align="center">
						<ASP:BUTTON id="cmdDeleteThreads" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana" visible="False" text="Delete Selected Threads" forecolor="White"></ASP:BUTTON></P>
					<P align="center">
						<TABLE borderColor="black" width="60%" bgColor="#222222" border="1">
							<TR>
								<TD align="middle" bgColor="#424242"><FONT face="verdana" size="1">Post a new topic </FONT>
								</TD>
							</TR>
							<TR>
								<TD>
									<TABLE borderColor="#000000" width="100%" bgColor="#222222" border="1">
										<TR>
											<TD align="right"><FONT face="verdana" size="1">Topic Name: </FONT>
											</TD>
											<TD>
												<ASP:TEXTBOX id="txtThreadName" runat="server" font-names="Verdana" maxlength="32" size="15" enableviewstate="False"></ASP:TEXTBOX></TD>
										</TR>
										<TR>
											<TD vAlign="top" align="right"><FONT face="verdana" size="1">Message: </FONT>
											</TD>
											<TD>
												<ASP:TEXTBOX id="txtMessage" runat="server" font-names="Verdana" enableviewstate="False" rows="8" columns="40" textmode="MultiLine" MaxLength="2000"></ASP:TEXTBOX></TD>
										</TR>
										<TR>
											<TD></TD>
											<TD align="right">
												<ASP:BUTTON id="cmdNewThread" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana" text="Post New Topic" forecolor="White"></ASP:BUTTON></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</P>
				</ASP:PANEL><ASP:PANEL id="pnlPosted" runat="server" horizontalalign="Center" visible="False">
					<P align="center">Your topic has been posted.<BR>
						<A href="AllianceForums.aspx">Return to Topic Directory</A></P>
				</ASP:PANEL><ASP:PANEL id="pnlNoAlliance" runat="server" horizontalalign="Center" visible="False">
					<P align="center">You cannot view the alliance news because your sector is 
						currently not in an alliance. Only your sector leader can join alliances.</P>
				</ASP:PANEL>
				<ASP:PANEL id="pnlDeleted" runat="server" horizontalalign="Center" visible="False">
					<P align="center">The selected topics were deleted.<BR>
						<A href="AllianceForums.aspx">Return to Topic Directory</A></P>
				</ASP:PANEL>
				<P align="center">&nbsp;</P>
			</FONT>
			<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		</FORM>
	</BODY>
</HTML>
