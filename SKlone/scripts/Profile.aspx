<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Profile.aspx.vb" Inherits="SKlone.Profile" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
  <HEAD>
		<TITLE>Status</TITLE>
<ASP:LABEL id=lblLand runat="server"></ASP:LABEL>
<META content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<META content="Visual Basic .NET 7.1" name=CODE_LANGUAGE>
<META content=JavaScript name=vs_defaultClientScript>
<META content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
	</STYLE>
</HEAD>
<BODY text=#ffffff bgColor=#000000 leftMargin=0 topMargin=0 onload=self.focus(); ?>
<P align=center><BR></P>
<P align=center><SKLONE:TOPINFOBAR id=Topinfobar1 runat="server"></SKLONE:TOPINFOBAR></P><FONT 
face=verdana size=1>
<FORM id=Form1 runat="server">
<div class=heading align=center><font color=#ffffff>SKlone Profile</font></div><br>
<div align=center>
<table style="WIDTH: 550px; HEIGHT: 570px" cellSpacing=0 cellPadding=1 width=550 
align=center bgColor=#999999 border=0>
  <TBODY>
  <tr>
    <td>
      <table style="WIDTH: 548px; HEIGHT: 553px" cellSpacing=0 cellPadding=0 
      width=548 bgColor=#ffffff border=0>
        <TBODY>
        <tr>
          <td style="HEIGHT: 570px" bgColor=#ffffff color="#000000">
            <table cellSpacing=1 cellPadding=4 width="100%" bgColor=#ffffff
            border=0>
              <TBODY>
              <tr>
                <td class=tHeading background=forum_images/table_bg_image.gif
                bgColor=#a6aad3 colSpan=2><font color=#000000>Profile: <ASP:LABEL id=lblKingdomName runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right width="25%" background=""
                bgColor=#f4f4fb><font color=#000000>Username:</font></td></FONT>
                <td class=text width="75%" background="" bgColor=#f4f4fb
                ><font color=#000000><ASP:LABEL id=lblKingdomNameB runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text vAlign=top align=right background="" 
                bgColor=#f4f4fb><font color=#000000>Avatar:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblAvatar runat="server"></ASP:LABEL></font></td></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Member Title:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblMemberTitle runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Group:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblGroupName runat="server"></ASP:LABEL><ASP:LABEL id=lblRankPic runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Account Status:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblAccountStatus runat="server"></ASP:LABEL></font></td></tr></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Online Status:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblOnlineStatus runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right width="25%" background="" 
                bgColor=#f4f4fb><font color=#000000>Real Name:</font></td></FONT>
                <td class=text width="75%" background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblRealName runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Location:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblLocation runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Date of Birth:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblBirth runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Homepage:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblWebSite runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Occupation:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblOccupation runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Interests:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblInterests runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Email Address:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblEmail runat="server"></ASP:LABEL></font></td></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>MSN Messenger:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblMSM runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>AIM Address:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblAIM runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>Yahoo Messenger:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblYahoo runat="server"></ASP:LABEL></font></td></tr></FONT>
              <tr>
                <td class=text align=right background="" bgColor=#f4f4fb 
                ><font color=#000000>ICQ Number:</font></td></FONT>
                <td class=text background="" bgColor=#f4f4fb 
                ><font color=#000000><ASP:LABEL id=lblICQNumber runat="server"></ASP:LABEL></font></td></tr></FONT></TBODY></TABLE></TD></tr></TBODY></TABLE></TD></TR></TBODY></TABLE><br></FORM></FONT>
<P align=center>
<ASP:PLACEHOLDER id=PlaceHolder1 runat="server"></ASP:PLACEHOLDER></P></DIV></FORM>
	</BODY>
</HTML>
