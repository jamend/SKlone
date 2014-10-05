<%@ Page Language="vb" AutoEventWireup="false" Codebehind="LogIn.aspx.vb" Inherits="SKlone.LogInB" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>SKlone</TITLE>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: none }
	FONT.hr { FONT-SIZE: 8pt; FILTER: dropshadow(color=#141414, offx=2, offy=2, positive=1); COLOR: #ffffff; HEIGHT: 0px }
		</STYLE>
	</HEAD>
	<BODY bottommargin="0" bgcolor="#000000" leftmargin="0" topmargin="0" rightmargin="0">
		<TABLE cellspacing="0" cellpadding="0" width="100%">
			<TR valign="top" height="60">
				<TD background="images/sklonebar1.gif">
					<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%">
						<TR>
							<TD width="11"></TD>
							<TD valign="top"><IMG height="12" src="images/spacer.gif"><BR>
								<IMG src="images/sklone.gif"></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR valign="top" height="111">
				<TD>
					<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%">
						<TR>
							<TD align="center" width="66%"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
									<input type="hidden" name="cmd" value="_xclick"> <input type="hidden" name="business" value="cephas_is@hotmail.com">
									<input type="hidden" name="item_name" value="SKlone"> <input type="hidden" name="no_note" value="1">
									<input type="hidden" name="currency_code" value="CAD"> <input type="hidden" name="tax" value="0">
									<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" border="0"
										name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
								</form>
							</TD>
							<TD>
								<FONT face="verdana" size="2"><B><A href="LogIn.aspx">LOGIN TO SERVER 1</A></FONT>
								</B>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR valign="top" height="*">
				<TD>
					<TABLE height="100%" cellspacing="0" cellpadding="0" width="100%">
						<TR valign="top">
							<TD width="10"></TD>
							<TD width="202">
								<TABLE id="Table1" style="BORDER-RIGHT: #444444 1px solid; BORDER-TOP: #444444 1px solid; BORDER-LEFT: #444444 1px solid; BORDER-BOTTOM: #444444 1px solid"
									cellSpacing="0" cellPadding="0" width="100%" bgColor="#222222">
									<TR>
										<TD style="PADDING-TOP: 1px" vAlign="top" align="center" background="images/th.gif"
											height="20"><FONT class="hr" face="verdana"><B>« Navigation »</B> </FONT>
										</TD>
									</TR>
									<TR>
										<TD><FONT face="verdana" color="#ffffff" size="1"><BR>
												&nbsp;» <A href="Default.aspx">Main Page</A>
												<BR>
												<BR>
												&nbsp;» <A href="Help.aspx">Help</A>&nbsp;
												<BR>
												<BR>
												&nbsp;» <A href="LogIn.aspx">Login</A>
												<BR>
												<BR>
												&nbsp;» <A href="SignUp.aspx">Sign Up</A>&nbsp;| <A href="SignUpGroup.aspx">Group</A>
												<BR>
												<BR>
											</FONT>
										</TD>
									</TR>
									<TR>
										<TD style="PADDING-TOP: 2px" vAlign="top" align="center" background="images/th.gif"
											height="20"><FONT class="hr" face="verdana"><B>« Interact »</B> </FONT>
										</TD>
									</TR>
									<TR>
										<TD><FONT face="verdana" color="#ffffff" size="1"><BR>
												&nbsp;» <A href="SKloneChat.aspx">TEN-ARC</A>
												<BR>
												<BR>
											</FONT>
										</TD>
									</TR>
								</TABLE>
							</TD>
							<TD width="5"></TD>
							<TD width="562">
								<TABLE style="BORDER-RIGHT: #444444 1px solid; BORDER-TOP: #444444 1px solid; BORDER-LEFT: #444444 1px solid; BORDER-BOTTOM: #444444 1px solid"
									cellspacing="0" cellpadding="0" width="100%" bgcolor="#222222">
									<TR height="61">
										<TD background="images/sklonebanner.jpg">&nbsp;</TD>
									</TR>
									<TR>
										<TD align="center">
											<FORM id="Form1" runat="server">
												<FONT face="verdana" color="#ffffff" size="2">
													<BR>
													<P align="center">
														<ASP:LABEL id="lblError" runat="server"></ASP:LABEL>
													</P>
													<P align="center">
														<FONT size="2"><B>Server 1</B> </FONT>
													</P>
													<TABLE cellspacing="0" cellpadding="0" width="50%" bgcolor="#000044">
														<TR>
															<TD align="center" background="images/loginhr.gif" colspan="2" height="19"><FONT face="verdana" color="#ffffff" size="2"><B>« 
																		Manage your account »</B> </FONT>
															</TD>
														</TR>
														<TR>
															<TD><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;Account: </FONT>
															</TD>
															<TD><ASP:TEXTBOX id="txtAccount" width="144px" runat="server" maxlength="16"></ASP:TEXTBOX></TD>
														</TR>
														<TR>
															<TD><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;Password: </FONT>
															</TD>
															<TD><ASP:TEXTBOX id="txtPassword" width="144px" runat="server" textmode="Password" maxlength="16"></ASP:TEXTBOX></TD>
														</TR>
														<TR>
															<TD colspan="2"><FONT face="verdana" color="#ffffff" size="1">&nbsp;&nbsp;<ASP:BUTTON id="cmdLogIn" runat="server" forecolor="White" text="Login" font-names="Verdana"
																		bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON></FONT></TD>
														</TR>
													</TABLE>
													<BR>
													<BR>
													Server Time:
													<ASP:LABEL id="lblServerTime" runat="server"></ASP:LABEL><BR>
													Users online:
													<ASP:LABEL id="lblStatus" runat="server"></ASP:LABEL><BR>
													<BR>
													<A href="/SignUp.aspx">Click Here to sign up for a free account</A> </FONT>
											</FORM>
										</TD>
									</TR>
								</TABLE>
							</TD>
							<TD width="5"></TD>
							<TD width="100"></TD>
						</TR>
						<TR>
							<TD height="4"></TD>
						</TR>
						<TR>
							<TD background="images/sklonebar2.gif" colspan="6" height="26"><FONT face="verdana" color="#fffff0" style="FONT-SIZE: 8pt; FILTER: blur(strength=2); WIDTH: 336px; HEIGHT: 17px"><B>&nbsp;&nbsp;© 
										2002-2004 Jonathan Amend, Richard Allen Paul</B> </FONT>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</BODY>
</HTML>
