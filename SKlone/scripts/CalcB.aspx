<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="CalcB.aspx.vb" Inherits="SKlone.CalcB" %>
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
		<FONT face="verdana" size="1">
			<FORM id="Form1" runat="server">
				<P align="center">
					<asp:Label id="lblerror" runat="server"></asp:Label></P>
				<P align="center">Calc version Beta 1 for SKlone Game 1</P>
				<P align="center">Soldiers:
					<asp:TextBox id="txtASoldiers" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Soldiers: 
					&nbsp;
					<asp:TextBox id="txtDSoldiers" runat="server" Width="58px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;</P>
				<P align="center">Dragoons:
					<asp:TextBox id="txtADragoons" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Laser 
					Dragoons: &nbsp;
					<asp:TextBox id="txtDLDragoons" runat="server" Width="58px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;</P>
				<P align="center">Troopers:
					<asp:TextBox id="txtATroopers" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					&nbsp;Laser Troopers: &nbsp;
					<asp:TextBox id="txtDLTroopers" runat="server" Width="58px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P>
				<P align="center">Tanks:
					<asp:TextBox id="txtATanks" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tanks:&nbsp;&nbsp;
					<asp:TextBox id="txtDTanks" runat="server" Width="58px"></asp:TextBox>&nbsp;&nbsp;</P>
				<P align="center">TFs:
					<asp:TextBox id="txtATFs" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					&nbsp;&nbsp; TFs:&nbsp;&nbsp;
					<asp:TextBox id="txtDTFs" runat="server" Width="58px"></asp:TextBox>&nbsp;&nbsp;
				</P>
				<P align="center">Special Ops:
					<asp:TextBox id="txtASpecialOps" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Special 
					Ops: &nbsp;
					<asp:TextBox id="txtDSpecialOps" runat="server" Width="58px"></asp:TextBox>&nbsp;</P>
				<P align="center">Interceptors:
					<asp:TextBox id="txtAInterceptors" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Interceptors: 
					&nbsp;
					<asp:TextBox id="txtDInterceptors" runat="server" Width="58px"></asp:TextBox>&nbsp;</P>
				<P align="center">Lancers:
					<asp:TextBox id="txtALancers" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lancers: 
					&nbsp;
					<asp:TextBox id="txtDLancers" runat="server" Width="58px"></asp:TextBox>&nbsp;</P>
				<P align="center">Sabres:
					<asp:TextBox id="txtASabres" runat="server" Width="61px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sabres: 
					&nbsp;
					<asp:TextBox id="txtDSabres" runat="server" Width="58px"></asp:TextBox>&nbsp;</P>
				<P align="center"><SELECT id="cboAPlanet" style="WIDTH: 100px" name="cboPlanetType" runat="server">
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
					</SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<SELECT id="cboDPlanet" style="WIDTH: 102px" name="cboPlanetType" runat="server">
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
				<P align="center"><SELECT id="cboARace" style="WIDTH: 102px" name="cboRaceType" runat="server">
						<OPTION value="0" selected>Terran</OPTION>
						<OPTION value="1">Xivornai</OPTION>
						<OPTION value="2">Gistrami</OPTION>
						<OPTION value="3">Mafielven</OPTION>
					</SELECT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<SELECT id="cboDRace" style="WIDTH: 106px" name="cboRaceType" runat="server">
						<OPTION value="0" selected>Terran</OPTION>
						<OPTION value="1">Xivornai</OPTION>
						<OPTION value="2">Gistrami</OPTION>
						<OPTION value="3">Mafielven</OPTION>
					</SELECT></P>
				<P align="center">Research Percent:
					<asp:TextBox id="txtAResearch" runat="server" Width="26px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Research 
					Percent:&nbsp;
					<asp:TextBox id="txtDResearch" runat="server" Width="26px"></asp:TextBox>
				</P>
				<P align="center">War Leaders:
					<asp:TextBox id="txtWls" runat="server" Width="33px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</P>
				<P align="center">
					<asp:Button id="cmdCalc" runat="server" Text="Calc Attack"></asp:Button></P>
				<P align="center">&nbsp;</P>
				<P align="center">&nbsp;</P>
			</FORM>
		</FONT>
		<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
	</BODY>
</HTML>
