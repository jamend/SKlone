<%@ Control Language="vb" AutoEventWireup="false" Codebehind="ConstructionStatus.ascx.vb" Inherits="SKlone.ConstructionStatus" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<TABLE cellSpacing="0" cellPadding="0" width="100%" bgColor="#424242" border="0">
	<TR>
		<TD align="center" colSpan="26"><FONT face="verdana" size="1">Name : Amount : Percent : 
				Buildings built in 24 hours time </FONT>
		</TD>
	</TR>
</TABLE>
<ASP:DATAGRID id="DataGrid1" backcolor="#222222" autogeneratecolumns="False" gridlines="None"
	width="100%" cellpadding="0" font-size="XX-Small" font-names="Verdana" runat="server">
	<ITEMSTYLE horizontalalign="Center"></ITEMSTYLE>
	<HEADERSTYLE backcolor="#440000"></HEADERSTYLE>
	<COLUMNS>
		<ASP:BOUNDCOLUMN datafield="BuildingName" headertext="&nbsp;">
			<HEADERSTYLE backcolor="#222222"></HEADERSTYLE>
			<ITEMSTYLE horizontalalign="Left"></ITEMSTYLE>
		</ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="Built" headertext="&nbsp;" dataformatstring="{0:###,###,###,###,##0}">
			<HEADERSTYLE backcolor="#222222"></HEADERSTYLE>
			<ITEMSTYLE font-bold="True" horizontalalign="Left"></ITEMSTYLE>
		</ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="BuildingPercent" headertext="&amp;nbsp;">
			<HEADERSTYLE backcolor="#222222"></HEADERSTYLE>
			<ITEMSTYLE horizontalalign="Left"></ITEMSTYLE>
		</ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="1" headertext="1" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="2" headertext="2" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="3" headertext="3" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="4" headertext="4" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="5" headertext="5" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="6" headertext="6" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="7" headertext="7" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="8" headertext="8" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="9" headertext="9" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="10" headertext="10" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="11" headertext="11" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="12" headertext="12" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="13" headertext="13" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="14" headertext="14" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="15" headertext="15" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="16" headertext="16" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="17" headertext="17" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="18" headertext="18" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="19" headertext="19" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="20" headertext="20" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="21" headertext="21" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="22" headertext="22" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="23" headertext="23" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="24" headertext="24" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
	</COLUMNS>
</ASP:DATAGRID>
