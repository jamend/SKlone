<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Disband.aspx.vb" Inherits="SKlone.Disband" %>
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
				<ASP:PANEL id="pnlStatus" runat="server">
					<P align="center">You disbanded <B>
							<ASP:LABEL id="lblDisbanded" runat="server"></ASP:LABEL>&nbsp;military units</B>
						into population.</P>
				</ASP:PANEL><ASP:PANEL id="pnlError" runat="server">
					<P align="center">
						<ASP:LABEL id="lblError" runat="server"></ASP:LABEL></P>
				</ASP:PANEL>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, we can 
					release any of your army back into population.</P>
				<P align="center"><ASP:TABLE id="tblMilitary" runat="server" horizontalalign="Center" gridlines="Both" borderstyle="Solid"
						borderwidth="1px" backcolor="#440000" bordercolor="Black" width="80%" font-names="Verdana" font-size="XX-Small">
						<asp:TableRow HorizontalAlign="Center" BackColor="#720000">
							<asp:TableCell Text="Unit name"></asp:TableCell>
							<asp:TableCell Text="You own"></asp:TableCell>
							<asp:TableCell Text="Disband"></asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Laser Troopers"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLTroopers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Laser Dragoons"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLDragoons" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Troopers"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTroopers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Dragoons"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtDragoons" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Tactical Fighters"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTFs" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Tanks"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtTanks" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Scientists"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtScientists" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Special Ops"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtSpecialOps" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Interceptors"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtInterceptors" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="Sabres"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtSabres" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
						<asp:TableRow HorizontalAlign="Left">
							<asp:TableCell Text="High Guard Lancers"></asp:TableCell>
							<asp:TableCell></asp:TableCell>
							<asp:TableCell HorizontalAlign="Center">
								<asp:TextBox runat="server" Font-Names="verdana" ID="txtLancers" size="4"></asp:TextBox>
							</asp:TableCell>
						</asp:TableRow>
					</ASP:TABLE></P>
				<P align="center"><ASP:BUTTON id="cmdDisband" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						forecolor="White" text=" Disband Army "></ASP:BUTTON></P>
				<P align="center"><FONT face="verdana" size="2"><A href="Military.aspx">Train Military</A>
					</FONT>
				</P>
				<P align="center">&nbsp;</P>
			</FONT>
			<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
		</FORM>
	</BODY>
</HTML>
