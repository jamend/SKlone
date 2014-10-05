<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Help.aspx.vb" Inherits="SKlone.Help" %>
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
								<FONT face="verdana" size="2"><B><A href="LogIn.aspx">LOGIN TO SERVER 1</A>&nbsp; </B>
								</FONT>
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
								<TABLE id="Table3" style="BORDER-RIGHT: #444444 1px solid; BORDER-TOP: #444444 1px solid; BORDER-LEFT: #444444 1px solid; BORDER-BOTTOM: #444444 1px solid"
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
									height="99%" cellspacing="0" cellpadding="0" width="100%" bgcolor="#222222">
									<TR height="61">
										<TD colspan="3" background="images/sklonebanner.jpg">&nbsp;</TD>
									</TR>
									<TR>
										<TD width="2%"></TD>
										<TD width="*" align="left">
											<FORM id="Form1" runat="server">
												<FONT face="verdana" size="2" color="#ffffff">
													<BR>
													<P align="center"><FONT face="arial" color="#ffffd9" size="4"> SKLONE -- Help </FONT>
													</P>
													<P align="center" style="FONT-WEIGHT: bold; FONT-SIZE: 14pt">----Planet Types----
													</P>
													<P style="FONT-SIZE: 10pt" align="center">
														<TABLE id="tblScores" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FONT-SIZE: xx-small; BORDER-LEFT: black 1px solid; COLOR: white; BORDER-BOTTOM: black 1px solid; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #222222"
															borderColor="black" rules="all" align="center" border="1" width="95%">
															<TR style="BACKGROUND-COLOR: #424242" align="center">
																<TD>Planet Type</TD>
																<TD>Pros</TD>
																<TD>Cons</TD>
																<TD>Research Specials</TD>
															</TR>
															<TR>
																<TD>Ice Lands</TD>
																<TD align="center">+25% income</TD>
																<TD align="center">-10% population capacity and growth</TD>
																<TD align="center">none</TD>
															</TR>
															<TR>
																<TD>Grass Lands</TD>
																<TD align="center">+25% population capacity and growth</TD>
																<TD align="center">-10% defensive strength</TD>
																<TD align="center">dragoons</TD>
															</TR>
															<TR>
																<TD>Astro-Station</TD>
																<TD align="center">-70% research needed</TD>
																<TD align="center">-5% offensive strength</TD>
																<TD align="center">fusion tech, energy core</TD>
															</TR>
															<TR>
																<TD>Acidic Aura</TD>
																<TD align="center">-40% return time</TD>
																<TD align="center">+10% power needed</TD>
																<TD align="center">fusion tech, scouter</TD>
															</TR>
															<TR>
																<TD>Fire Blaze</TD>
																<TD align="center">+22% offensive strength</TD>
																<TD align="center">-5% income</TD>
																<TD align="center">laser dragoons</TD>
															</TR>
															<TR>
																<TD>Jagged Lava</TD>
																<TD align="center">no power needed</TD>
																<TD align="center">+20% research needed</TD>
																<TD align="center">none</TD>
															</TR>
															<TR>
																<TD>Misty Phantom</TD>
																<TD align="center">+25% defensive strength</TD>
																<TD align="center">+10% research needed</TD>
																<TD align="center">none</TD>
															</TR>
															<TR>
																<TD>Shadow Lands</TD>
																<TD align="center">+25% probe production</TD>
																<TD align="center">-5% offensive strength</TD>
																<TD align="center">none</TD>
															</TR>
															<TR>
																<TD>Gaseous Waste</TD>
																<TD align="center">none</TD>
																<TD align="center">none</TD>
																<TD align="center">dragoons, laser dragoons, vesudian core ai</TD>
															</TR>
															<TR>
																<TD>Dense Jungle</TD>
																<TD align="center">-20% unit cost</TD>
																<TD align="center">-15% probe production</TD>
																<TD align="center">none</TD>
															</TR>
														</TABLE>
													</P>
													<P style="FONT-WEIGHT: bold; FONT-SIZE: 14pt" align="center">----Races----</P>
													<P style="FONT-SIZE: 9pt" align="center">
														<TABLE id="Table1" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FONT-SIZE: xx-small; BORDER-LEFT: black 1px solid; COLOR: white; BORDER-BOTTOM: black 1px solid; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #222222"
															borderColor="black" rules="all" align="center" border="1" width="95%">
															<TR style="BACKGROUND-COLOR: #424242" align="center">
																<TD>Race Type</TD>
																<TD>Pros</TD>
																<TD>Cons</TD>
																<TD>Special Unit</TD>
															</TR>
															<TR>
																<TD>Terran</TD>
																<TD align="center">+12% population capacity and growth</TD>
																<TD align="center">+10% return time</TD>
																<TD align="center">Sabres</TD>
															</TR>
															<TR>
																<TD>Xivornai</TD>
																<TD align="center">+20% research production</TD>
																<TD align="center">-5% population capacity and growth</TD>
																<TD align="center">Interceptors</TD>
															</TR>
															<TR>
																<TD>Gistrami</TD>
																<TD align="center">+12% offensive strength</TD>
																<TD align="center">+7% research needed</TD>
																<TD align="center">Sabres</TD>
															</TR>
															<TR>
																<TD>Mafielven</TD>
																<TD align="center">-17% power needed</TD>
																<TD align="center">-5% offensive strength</TD>
																<TD align="center">High Guard Lancers</TD>
															</TR>
														</TABLE>
													</P>
													<P style="FONT-WEIGHT: bold; FONT-SIZE: 14pt" align="center">----Units----</P>
													<P style="FONT-WEIGHT: bold; FONT-SIZE: 14pt" align="center">
														<TABLE id="Table2" style="BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; FONT-SIZE: xx-small; BORDER-LEFT: black 1px solid; COLOR: white; BORDER-BOTTOM: black 1px solid; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #222222"
															borderColor="black" rules="all" align="center" border="1" width="95%">
															<TR style="BACKGROUND-COLOR: #424242" align="center">
																<TD>Unit Type</TD>
																<TD>Offensive Strength</TD>
																<TD>Defensive Strength</TD>
																<TD>Networth</TD>
															</TR>
															<TR>
																<TD>Soldiers</TD>
																<TD align="center">1</TD>
																<TD align="center">1</TD>
																<TD align="center">3</TD>
															</TR>
															<TR>
																<TD>Troopers</TD>
																<TD align="center">4</TD>
																<TD align="center">0</TD>
																<TD align="center">6</TD>
															</TR>
															<TR>
																<TD>Laser Troopers</TD>
																<TD align="center">0</TD>
																<TD align="center">4</TD>
																<TD align="center">7</TD>
															</TR>
															<TR>
																<TD>Dragoons</TD>
																<TD align="center">5</TD>
																<TD align="center">0</TD>
																<TD align="center">7</TD>
															</TR>
															<TR>
																<TD>Laser Dragoons</TD>
																<TD align="center">0</TD>
																<TD align="center">5</TD>
																<TD align="center">8</TD>
															</TR>
															<TR>
																<TD>Tanks</TD>
																<TD align="center">9</TD>
																<TD align="center">9</TD>
																<TD align="center">22</TD>
															</TR>
															<TR>
																<TD>Tactical Fighters</TD>
																<TD align="center">10</TD>
																<TD align="center">4</TD>
																<TD align="center">18</TD>
															</TR>
															<TR>
																<TD>Sabres</TD>
																<TD align="center">5</TD>
																<TD align="center">1</TD>
																<TD align="center">8</TD>
															</TR>
															<TR>
																<TD>High Guard Lancers</TD>
																<TD align="center">5</TD>
																<TD align="center">5</TD>
																<TD align="center">12</TD>
															</TR>
															<TR>
																<TD>Interceptors</TD>
																<TD align="center">3</TD>
																<TD align="center">5</TD>
																<TD align="center">9</TD>
															</TR>
															<TR>
																<TD>Special Ops</TD>
																<TD align="center">4</TD>
																<TD align="center">3</TD>
																<TD align="center">9</TD>
															</TR>
														</TABLE>
													</P>
												</FONT>
											</FORM>
										</TD>
										<TD width="2%"></TD>
									</TR>
								</TABLE>
							</TD>
							<TD width="5" style="WIDTH: 5px"></TD>
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
