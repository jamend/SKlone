<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MilitaryStatus.aspx.vb" Inherits="SKlone.MilitaryStatus" %>
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
		<P align="center"><FONT face="verdana" size="4"><B>Military&nbsp;Status</B> </FONT>
		</P>
		<P align="left"></P>
		<P align="center">
			<TABLE bordercolor="#555555" cellspacing="1" cellpadding="1" width="95%" bgcolor="#222222"
				border="1">
				<TBODY>
					<TR>
						<TD style="HEIGHT: 5px" align="center">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TBODY>
									<TR align="center">
										<TD><FONT face="verdana" size="1"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, 
												this table represents your military status. You can tell if any of your army is 
												away by looking at the data located in the Table Rows.
												<BR>
												<BR>
												<ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></FONT></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="center">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TR align="center">
									<TD><FONT face="verdana" size="1"><BR>
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
