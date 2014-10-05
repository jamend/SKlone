<%@ Control language="VB" AutoEventWireup="false" Codebehind="SOM.ascx.vb" Inherits="SKlone.SOM" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" enableViewState="False"%>
<ASP:DATAGRID id="DataGrid1" runat="server" font-names="Verdana" font-size="XX-Small" cellpadding="0"
	width="100%" autogeneratecolumns="False">
	<ITEMSTYLE horizontalalign="Center" backcolor="#222222"></ITEMSTYLE>
	<HEADERSTYLE horizontalalign="Center" backcolor="#444444"></HEADERSTYLE>
	<COLUMNS>
		<ASP:BOUNDCOLUMN datafield="UnitName" headertext=" ">
			<HEADERSTYLE backcolor="#444444"></HEADERSTYLE>
			<ITEMSTYLE backcolor="#444444"></ITEMSTYLE>
		</ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="1" headertext="Home Leader" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="2" headertext="Leader #2" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="3" headertext="Leader #3" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="4" headertext="Leader #4" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
		<ASP:BOUNDCOLUMN datafield="5" headertext="Leader #5" dataformatstring="{0:###,###,###,###,##0}"></ASP:BOUNDCOLUMN>
	</COLUMNS>
</ASP:DATAGRID>
