<%@ Page Language="vb" AutoEventWireup="false" Codebehind="MobilizingStatus.aspx.vb" Inherits="SKlone.MobilizingStatus" %>
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
		<P align="center"><BR>
			<SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<P align="center"><FONT face="verdana" size="4"><B>Mobilizing&nbsp;Status</B> </FONT>
		</P>
		<P align="left">
		</P>
		<P align="center">
			<TABLE width="95%" cellpadding="1" cellspacing="1" border="1" bgcolor="#222222" bordercolor="#555555">
				<TBODY>
					<TR>
						<TD align="middle">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TBODY>
									<TR align="middle">
										<TD>
											<FONT face="verdana" size="1">
												<ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, I prepared a report 
												on your current army mobilization statistics.
												<BR>
												<BR>
												Name : Units trained in X hours </FONT>
											<ASP:DATAGRID id="DataGrid1" runat="server" font-names="Verdana" font-size="XX-Small" cellpadding="1" width="100%" gridlines="None" autogeneratecolumns="False" cellspacing="1">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle HorizontalAlign="Center" BackColor="#444444"></HeaderStyle>
												<Columns>
													<asp:BoundColumn DataField="UnitName" HeaderText="&amp;nbsp;">
														<HeaderStyle BackColor="#222222"></HeaderStyle>
														<ItemStyle BackColor="#444444"></ItemStyle>
													</asp:BoundColumn>
													<asp:BoundColumn DataField="1" HeaderText="1" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="2" HeaderText="2" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="3" HeaderText="3" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="4" HeaderText="4" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="5" HeaderText="5" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="6" HeaderText="6" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="7" HeaderText="7" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="8" HeaderText="8" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="9" HeaderText="9" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="10" HeaderText="10" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="11" HeaderText="11" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="12" HeaderText="12" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="13" HeaderText="13" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="14" HeaderText="14" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="15" HeaderText="15" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="16" HeaderText="16" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="17" HeaderText="17" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="18" HeaderText="18" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="19" HeaderText="19" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="20" HeaderText="20" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="21" HeaderText="21" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="22" HeaderText="22" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="23" HeaderText="23" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
													<asp:BoundColumn DataField="24" HeaderText="24" DataFormatString="{0:###,###,###,###,##0}"></asp:BoundColumn>
												</Columns>
											</ASP:DATAGRID>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD align="middle">
							<TABLE cellspacing="0" cellpadding="0" width="100%" border="0">
								<TR align="middle">
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
