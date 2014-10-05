<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Attack.aspx.vb" Inherits="SKlone.scripts.Attack" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="KingdomChooser" Src="KingdomChooser.ascx" %>
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
		<P align="center"><BR>
		</P>
		<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
		<FONT face="verdana" size="1">
			<FORM id="Form1" runat="server">
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:LABEL id="lblMsg" runat="server" visible="False"></ASP:LABEL></P>
				<P align="center">&nbsp;</P>
				<P align="center"><ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER></P>
				<P align="center"><ASP:LABEL id="lblRulerName" runat="server"></ASP:LABEL>, you can 
					send out your army into enemy lands to capture land, money, power, and 
					civilians. You can send out standard attack units.</P>
				<P align="center"><ASP:TABLE id="tblMilitary" runat="server" horizontalalign="Center" gridlines="Both" borderstyle="Solid"
						borderwidth="1px" backcolor="#222222" bordercolor="Black" width="80%" font-names="Verdana" font-size="XX-Small">
						<ASP:TABLEROW horizontalalign="Center" backcolor="#424242">
							<ASP:TABLECELL text="Unit Name"></ASP:TABLECELL>
							<ASP:TABLECELL text="Available"></ASP:TABLECELL>
							<ASP:TABLECELL text="Attack"></ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Soldiers"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtSoldiers" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Troopers"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtTroopers" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Dragoons"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtDragoons" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Tactical Fighters"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtTFs" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Tanks"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtTanks" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Special Ops"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtSpecialOps" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Interceptors"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtInterceptors" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="Sabres"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtSabres" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL text="High Guard Lancers"></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="6" id="txtLancers" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
						<ASP:TABLEROW horizontalalign="Center">
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL></ASP:TABLECELL>
							<ASP:TABLECELL>
								<ASP:TEXTBOX runat="server" size="1" id="txtWLs" text="1" maxlength="1" font-name="verdana"></ASP:TEXTBOX>
							</ASP:TABLECELL>
						</ASP:TABLEROW>
					</ASP:TABLE></P>
				<P align="center"><ASP:BUTTON id="cmdAttack" runat="server" backcolor="#000488" bordercolor="#005AFF" font-names="Verdana"
						forecolor="White" text="Send out attack"></ASP:BUTTON></P>
				<P align="center">&nbsp;</P>
				<P align="left"><FONT face="verdana" size="2">&nbsp;&nbsp; ( <A href="MilitaryStatus.aspx">Military 
							Status</A> )</FONT>
				</P>
			</FORM>
		</FONT>
		<P align="center"><ASP:PLACEHOLDER id="PlaceHolder2" runat="server"></ASP:PLACEHOLDER></P>
	</BODY>
</HTML>
