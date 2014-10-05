<%@ Page Language="vb" AutoEventWireup="false" Inherits="SKlone.SignUp" CodeBehind="SignUp.aspx.vb" %>
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
		<SCRIPT language="javascript">
			<!--
				if (parent.frames.length != 0) {
					self.parent.location.href = location.href;
				}
			-->
		</SCRIPT>
	</HEAD>
	<BODY bottomMargin="0" bgColor="#000000" leftMargin="0" topMargin="0" rightMargin="0">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR vAlign="top" height="60">
				<TD background="images/sklonebar1.gif">
					<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
						<TR>
							<TD width="11"></TD>
							<TD vAlign="top"><IMG height="12" src="images/spacer.gif"><BR>
								<IMG height="41" src="images/sklone.gif" width="138"></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR vAlign="top" height="111">
				<TD>
					<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
						<TR>
							<TD align="center" width="66%"><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
									<input type="hidden" name="cmd" value="_xclick"> <input type="hidden" name="business" value="cephas_is@hotmail.com">
									<input type="hidden" name="item_name" value="SKlone"> <input type="hidden" name="no_note" value="1">
									<input type="hidden" name="currency_code" value="CAD"> <input type="hidden" name="tax" value="0">
									<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" border="0"
										name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
								</form>
							</TD>
							<TD><FONT face="verdana" size="2"><B><A href="LogIn.aspx">LOGIN TO SERVER 1</A> </B></FONT>
							</TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR vAlign="top" height="*">
				<TD>
					<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
						<TR vAlign="top">
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
									cellSpacing="0" cellPadding="0" width="100%" bgColor="#222222">
									<TR height="61">
										<TD background="images/sklonebanner.jpg">&nbsp;</TD>
									</TR>
									<TR>
										<TD align="center">
											<FORM id="Form1" runat="server">
												<FONT face="verdana" color="#ffffff" size="2">
													<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%">
														<TBODY>
															<TR>
																<TD width="10"></TD>
																<TD><FONT face="verdana" color="#ffffff" size="2"><BR>
																		<P align="center"><ASP:LABEL id="lblError" runat="server"></ASP:LABEL></P>
																		<P align="left"><FONT size="2"><B>Server 1</B></FONT>
																		</P>
																		<TABLE style="FONT-SIZE: xx-small; COLOR: white; FONT-FAMILY: verdana" cellSpacing="0"
																			cellPadding="0" width="500" align="center" bgColor="#000022">
																			<TBODY>
																				<TR>
																					<TD align="center" background="images/signuphr.gif" colSpan="2" height="30"><FONT style="FILTER: blur(strength=2); WIDTH: 204px; HEIGHT: 18px" face="verdana" color="#ffffff"
																							size="3"><B>« Create an account » </B></FONT>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px"><FONT color="#efefaf" size="2"><B>Account Information:</B> </FONT>
																					</TD>
																					<TD></TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">Username:
																					</TD>
																					<TD><ASP:TEXTBOX id="txtAccount" runat="server" width="160px" maxlength="16"></ASP:TEXTBOX></TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px; HEIGHT: 24px">Password:
																					</TD>
																					<TD style="HEIGHT: 24px"><ASP:TEXTBOX id="txtPassword" runat="server" width="160px" maxlength="16" textmode="Password"></ASP:TEXTBOX></TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">
																						<P>Confirm Password:</P>
																					</TD>
																					<TD>
																						<P><ASP:TEXTBOX id="txtConfirm" runat="server" width="160px" maxlength="16" textmode="Password"></ASP:TEXTBOX></P>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px"><FONT color="#efefaf" size="2"><B>Contact Information:</B> </FONT>
																					</TD>
																					<TD></TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px; HEIGHT: 35px">
																						<P>Email Address:</P>
																					</TD>
																					<TD>
																						<P><ASP:TEXTBOX id="txtEmail" runat="server" width="160px" maxlength="255"></ASP:TEXTBOX></P>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px"><FONT color="#efefaf" size="2"><B>Kingdom Information:</B> </FONT>
																					</TD>
																					<TD></TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">Kingdom Name:</TD>
																					<TD>
																						<P><ASP:TEXTBOX id="txtKingdomName" runat="server" width="160px" maxlength="24"></ASP:TEXTBOX></P>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">Ruler Name:
																					</TD>
																					<TD>
																						<P><ASP:TEXTBOX id="txtRuler" runat="server" width="160px" maxlength="24"></ASP:TEXTBOX></P>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">Planet Type:
																					</TD>
																					<TD>
																						<P><SELECT id="cboPlanetType" style="WIDTH: 160px" name="cboPlanetType" runat="server">
																								<OPTION value="0" selected>Ice Lands</OPTION>
																								<OPTION value="1">Grass Lands</OPTION>
																								<OPTION value="2">Astro-Station</OPTION>
																								<OPTION value="3">Acidic Aura</OPTION>
																								<OPTION value="4">Fire Blaze</OPTION>
																								<OPTION value="5">Jagged Lava</OPTION>
																								<OPTION value="6">Misty Phantom</OPTION>
																								<OPTION value="7">Shadow Lands</OPTION>
																								<OPTION value="8">Gaseous Waste</OPTION>
																								<OPTION value="9">Dense Jungle</OPTION>
																							</SELECT></P>
																					</TD>
																				</TR>
																				<TR>
																					<TD style="WIDTH: 108px">Race Type:
																					</TD>
																					<TD>
																						<P><SELECT id="cboRaceType" style="WIDTH: 160px" name="cboRaceType" runat="server">
																								<OPTION value="0" selected>Terran</OPTION>
																								<OPTION value="1">Xivornai</OPTION>
																								<OPTION value="2">Gistrami</OPTION>
																								<OPTION value="3">Mafielven</OPTION>
																							</SELECT>&nbsp;&nbsp;
																							<asp:HyperLink id="racehelp" runat="server" NavigateUrl="Help.aspx">Race and Planet Help</asp:HyperLink><BR>
																						</P>
																					</TD>
																				</TR>
																				<TR>
																					<TD align="center" colSpan="2"><FONT face="verdana" color="#ffffff" size="1">
																							<br>
																							<ASP:BUTTON id="cmdSignUp" runat="server" forecolor="White" text="Submit (Click Once)" font-names="Verdana"
																								bordercolor="#005AFF" backcolor="#000488"></ASP:BUTTON><br>
																							<br>
																						</FONT>
																					</TD>
																				</TR>
																			</TBODY>
																		</TABLE>
																	</FONT>
																</TD>
																<TD width="10"></TD>
															</TR>
														</TBODY>
													</TABLE>
												</FONT>
											</FORM>
										</TD>
									</TR>
								</TABLE>
								</FONT></TD>
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
