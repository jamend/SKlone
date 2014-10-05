<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Military.aspx.vb" Inherits="SKlone.Military" %>
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
	</HEAD>
	<BODY text="#ffffff" vLink="#447cff" aLink="#4e9f5f" link="#447cff" bgColor="#000000">
		<FORM id="Form1" runat="server">
			<P align="center"><BR>
			</P>
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<ASP:PANEL id="pnlMilitaryUnits" runat="server">
					<P align="center">You watch as your army starts drafting. They will be done 
						drafting in 24 hours.
						<BR>
						<BR>
						<ASP:DATAGRID id="DataGrid1" runat="server" cellspacing="-1" autogeneratecolumns="False" font-size="XX-Small"
							font-names="Verdana" width="80%" bordercolor="#424242" backcolor="#222222" borderwidth="1px"
							borderstyle="Solid">
							<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
							<HEADERSTYLE horizontalalign="Center"></HEADERSTYLE>
							<COLUMNS>
								<ASP:BOUNDCOLUMN datafield="UnitName" headertext="Time (hours)">
									<HEADERSTYLE backcolor="#424242"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="1" headertext="1" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="2" headertext="2" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="3" headertext="3" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="4" headertext="4" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="5" headertext="5" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="6" headertext="6" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="7" headertext="7" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="8" headertext="8" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="9" headertext="9" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="10" headertext="10" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="11" headertext="11" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="12" headertext="12" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="13" headertext="13" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="14" headertext="14" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="15" headertext="15" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="16" headertext="16" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="17" headertext="17" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="18" headertext="18" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="19" headertext="19" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="20" headertext="20" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="21" headertext="21" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="22" headertext="22" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="23" headertext="23" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
								<ASP:BOUNDCOLUMN datafield="24" headertext="24" dataformatstring="{0:###,###,###,###,##0}">
									<HEADERSTYLE font-bold="True"></HEADERSTYLE>
								</ASP:BOUNDCOLUMN>
							</COLUMNS>
						</ASP:DATAGRID></P>
				</ASP:PANEL><ASP:PANEL id="pnlSoldiers" runat="server">
					<P align="center">You watch as your population starts training into soldiers. They 
						will be done training in 24 hours.
						<BR>
						<BR>
						<ASP:DATAGRID id="DataGrid2" runat="server" cellspacing="-1" font-size="XX-Small" font-names="Verdana"
							width="80%" bordercolor="#424242" backcolor="#222222" borderwidth="1px" borderstyle="Solid">
							<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
							<HEADERSTYLE horizontalalign="Center"></HEADERSTYLE>
							<COLUMNS>
								<ASP:HYPERLINKCOLUMN text="Soldiers" headertext="Time (hours)">
									<HEADERSTYLE backcolor="#424242"></HEADERSTYLE>
								</ASP:HYPERLINKCOLUMN>
							</COLUMNS>
						</ASP:DATAGRID></P>
				</ASP:PANEL>
				<P align="center"><ASP:LABEL id="lblError" runat="server" visible="False"></ASP:LABEL></P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome 
					to the training room. You can give orders to train soldiers, draft troops, or 
					build tanks.</P>
				<P align="center">
					<TABLE borderColor="#000000" width="80%" bgColor="#222222" border="1">
						<TR align="center" bgColor="#424242">
							<TD><FONT face="verdana" size="1">Train Soldiers </FONT>
							</TD>
						</TR>
						<TR align="center">
							<TD><FONT face="verdana" size="1"><BR>
									You currently have
									<ASP:LABEL id="lblSoldiersTraining" runat="server" font-bold="True"></ASP:LABEL>&nbsp;soldiers 
									in training.
									<BR>
									You can train a maximum of
									<ASP:LABEL id="lblSoldiersMax" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>soldiers</B>. 
									Each soldier costs <B>150 money</B>.
									<BR>
									Number to train:&nbsp;<ASP:TEXTBOX id="txtSoldiers" runat="server" font-name="verdana" size="6"></ASP:TEXTBOX>
									<BR>
									<ASP:BUTTON id="cmdTrain" runat="server" backcolor="#000488" bordercolor="#005AFF" forecolor="White"
										text="Train Soldiers"></ASP:BUTTON><BR>
									<BR>
								</FONT>
							</TD>
						</TR>
					</TABLE>
				</P>
				<P align="center"><BR>
					You have
					<ASP:LABEL id="lblSoldiers" runat="server" font-bold="True"></ASP:LABEL>&nbsp;<B>soldiers</B>
					to draft into elite units.
				</P>
				<P align="center"><ASP:TABLE id="tblMilitary" runat="server" borderstyle="Solid" borderwidth="1px" backcolor="#222222"
						bordercolor="Black" width="80%" font-names="Verdana" font-size="XX-Small" horizontalalign="Center" gridlines="Both">
						<asp:TableRow HorizontalAlign="Center" BackColor="#424242">
							<asp:TableCell Text="Unit Name"></asp:TableCell>
							<asp:TableCell Text="You own"></asp:TableCell>
							<asp:TableCell Text="In training"></asp:TableCell>
							<asp:TableCell Text="Cost"></asp:TableCell>
							<asp:TableCell Text="Maximum"></asp:TableCell>
							<asp:TableCell Text="Train"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Laser Trooper"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLTroopers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Laser Dragoon"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLDragoons" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Trooper"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTroopers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Dragoon"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtDragoons" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Tactical Fighters"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTFs" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Tanks"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTanks" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Scientists"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtScientists" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Special Ops"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtSpecialOps" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Interceptors"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtInterceptors" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="Sabres"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtSabres" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="High Guard Lancers"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLancers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
					</ASP:TABLE></P>
				<P align="center"><ASP:BUTTON id="cmdMobolize" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						forecolor="White" text="Mobilize Armies"></ASP:BUTTON></P>
				<P align="center"><FONT face="verdana" size="2"><A href="Disband.aspx">Disband Armies</A>
					</FONT>
				</P>
				<P align="center">&nbsp;</P>
				<P align="left"><FONT face="verdana" size="2">&nbsp;&nbsp; ( <A href="MobilizingStatus.aspx">
							Mobilizing Status</A> )</FONT>
				</P>
			</FONT>
			<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
		</FORM>
	</BODY>
</HTML>
