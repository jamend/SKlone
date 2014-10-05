<%@ Control Language="vb" AutoEventWireup="false" Codebehind="SOB.ascx.vb" Inherits="SKlone.SOB" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableViewState="False"%>
<TABLE border="1" cellpadding="0" cellspacing="0" width="100%">
	<TR>
		<TD>
			<FONT face="verdana" size="1">
				<ASP:LABEL id="lblKingdomName" runat="server" font-bold="True"></ASP:LABEL>'s 
				buildings as of (<ASP:LABEL id="lblDate" runat="server"></ASP:LABEL>)
				<BR>
				<BR>
				<ASP:PLACEHOLDER id="PlaceHolder1" runat="server"></ASP:PLACEHOLDER>
			</FONT>
		</TD>
	</TR>
</TABLE>
