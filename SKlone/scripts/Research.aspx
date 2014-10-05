<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Research.aspx.vb" Inherits="SKlone.Research" %>
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
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FORM id="Form1" runat="server">
			<FONT face="verdana" size="1">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblMsg" runat="server" designtimedragdrop="595"></ASP:LABEL></P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, welcome 
					to the lab. We can send researchers to develop and discover new technology. You 
					have
					<ASP:LABEL id="lblScientists" runat="server"></ASP:LABEL>
					scientists and
					<ASP:LABEL id="lblAvailable" runat="server" font-bold="True"></ASP:LABEL>
					scientists are available for a new job.
				</P>
				<P align="center"><ASP:TABLE id="tblResearch" runat="server" gridlines="Both" horizontalalign="Center" borderstyle="Solid"
						borderwidth="1px" backcolor="#222222" bordercolor="Black" width="80%" font-names="Verdana" font-size="XX-Small">
						<asp:TableRow HorizontalAlign="Center" BackColor="#424242">
							<asp:TableCell Text="&#160;"></asp:TableCell>
							<asp:TableCell Text="Job"></asp:TableCell>
							<asp:TableCell Text="Number of Scientists on Job"></asp:TableCell>
							<asp:TableCell Text="Research Pts."></asp:TableCell>
							<asp:TableCell Text="Percent"></asp:TableCell>
							<asp:TableCell Text="Number to place"></asp:TableCell>
							<asp:TableCell Text="&#160;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="1"></asp:TableCell>
							<asp:TableCell Text="Population Bonus"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt1" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=1&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="2"></asp:TableCell>
							<asp:TableCell Text="Power Bonus"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt2" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=2&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="3"></asp:TableCell>
							<asp:TableCell Text="Military Strength"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt3" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=3&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="4"></asp:TableCell>
							<asp:TableCell Text="Money Bonus"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt4" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=4&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="5"></asp:TableCell>
							<asp:TableCell Text="Frequency Decryption Center"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt5" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=5&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="6"></asp:TableCell>
							<asp:TableCell Text="Dragoons"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt6" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=6&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="7"></asp:TableCell>
							<asp:TableCell Text="Laser Dragoons"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt7" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=7&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="8"></asp:TableCell>
							<asp:TableCell Text="Vesudian Core and AI Technology"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt8" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=8&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="9"></asp:TableCell>
							<asp:TableCell Text="Fusion Technology"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt9" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=9&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="10"></asp:TableCell>
							<asp:TableCell Text="S.C.O.U.T.E.R."></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt10" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=10&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="11"></asp:TableCell>
							<asp:TableCell Text="Energy Core"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt11" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=11&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="12"></asp:TableCell>
							<asp:TableCell Text="Interceptors"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt12" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=12&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="13"></asp:TableCell>
							<asp:TableCell Text="Sabres"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt13" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=13&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Center">
							<asp:TableCell Text="14"></asp:TableCell>
							<asp:TableCell Text="High Guard Lancers"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell>
								<asp:TextBox runat="server" Font-Names="verdana" ID="txt14" size="4"></asp:TextBox>
							</asp:TableCell>
							<asp:TableCell Text="&lt;A HREF=&quot;Research.aspx?cancel=14&quot;&gt;Cancel Job&lt;/A&gt;"></asp:TableCell>
						</asp:TableRow>
					</ASP:TABLE></P>
				<P align="center"><ASP:BUTTON id="cmdResearch" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						forecolor="White" text="  Research  "></ASP:BUTTON></P>
				<P align="center"><ASP:LINKBUTTON id="aCancelAll" runat="server" font-size="X-Small">Cancel All Jobs</ASP:LINKBUTTON></P>
				<P align="center">&nbsp;</P>
			</FONT>
		</FORM>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
