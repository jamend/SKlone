<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ConstructionStatus.aspx.vb" Inherits="SKlone.ConstructionStatusContainer" %>
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
		<P align="center"><FONT face="verdana" size="4"><B>Construction Status</B> </FONT>
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
												<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, this table represents 
												the amount of free land and buildings that will be constructed in the next 24 
												hours.
												<BR>
												<BR>
												<ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER>
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
	</BODY>
</HTML>
