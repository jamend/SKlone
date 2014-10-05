<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Status.aspx.vb" Inherits="SKlone.Status" %>
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
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<P align="center"><FONT face="verdana" size="4"><B>Kingdom Status</B> </FONT>
		</P>
		<P align="left">
		</P>
		<P align="center">
			<TABLE width="95%" cellpadding="1" cellspacing="1" border="1" bgcolor="#222222" bordercolor="#555555">
				<TBODY>
					<TR>
						<TD align="center">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TBODY>
									<TR align="center">
										<TD>
											<FONT face="verdana" size="1">
												<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, I have prepared a 
												list of last hour's general changes to your economy.
												<BR>
												<BR>
												Income Change:
												<ASP:LABEL id="lblIncome" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												Power Change:&nbsp;<ASP:LABEL id="lblPowerChange" runat="server"></ASP:LABEL>&nbsp;(shields) 
												=
												<ASP:LABEL id="lblShieldsPower" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												Population Change:
												<ASP:LABEL id="lblPopulationChange" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												Total Wins:
												<ASP:LABEL id="lblWins" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												Total Losses:
												<ASP:LABEL id="lblLosses" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												MA Protection:
												<ASP:LABEL id="lblMA" runat="server" font-bold="True"></ASP:LABEL>
												<BR>
												<BR>
												<ASP:LABEL id="lblLastAttacker" runat="server" visible="False"></ASP:LABEL>
											</FONT>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="center">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TR align="center">
									<TD>
										<FONT face="verdana" size="1">
											<BR>
											<B>| <A href="Status.aspx">Kingdom Status</A> | <A href="ConstructionStatus.aspx">Construction 
													Status</A> | <A href="MilitaryStatus.aspx">Military Status</A> | <A href="MobilizingStatus.aspx">
													Mobilizing Status</A> |</B> </FONT>
									</TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<BR>
			<SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		</FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY>
		<P></P>
		<P></P>
		<P></P>
	</BODY>
</HTML>
