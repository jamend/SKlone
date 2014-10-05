Partial Class SOM
    Inherits System.Web.UI.UserControl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Public kdID As Int32


    Public Sub Refresh()
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT TOP 1 'Status' AS UnitName, 'AVAILABLE (0)' AS [1], 'AVAILABLE (' + CAST(dbo.WLReturnTime(kdID, 0) AS nvarchar(2)) + ')' AS [2], 'AVAILABLE (' + CAST(dbo.WLReturnTime(kdID, 1) AS nvarchar(2)) + ')' AS [3], 'AVAILABLE (' + CAST(dbo.WLReturnTime(kdID, 2) AS nvarchar(2)) + ')' AS [4], 'AVAILABLE (' + CAST(dbo.WLReturnTime(kdID, 3) AS nvarchar(2)) + ')' AS [5] FROM WLs WHERE kdID = " & kdID, New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet
        Dim SqlDataSet2 As New Data.DataSet
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.UnitName(e.UnitType) AS UnitName, dbo.UnitsHome(e.kdID, e.UnitType) AS [1], a.[Out] AS [2], b.[Out] AS [3], c.[Out] AS [4], d.[Out] AS [5] FROM UnitsTraining e, UnitsOut a, UnitsOut b, UnitsOut c, UnitsOut d WHERE a.WLID = 0 AND b.WLID = 1 AND c.WLID = 2 AND d.WLID = 3 AND a.UnitType = e.UnitType AND b.UnitType = e.UnitType AND c.UnitType = e.UnitType AND d.UnitType = e.UnitType AND a.kdID = e.kdID AND b.kdID = e.kdID AND c.kdID = e.kdID AND d.kdID = e.kdID AND e.kdID = " & kdID & " AND dbo.UnitResearched(e.kdID, e.UnitType) = 1 ORDER BY e.UnitType", Session.Item("sqlConnection"))
        SqlAdapter1.SelectCommand = SqlCommand1
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet2)
        Session.Item("sqlConnection").Close()
        Dim x As Int32
        For x = 0 To SqlDataSet2.Tables(0).Rows.Count - 1
            Dim NewRow As System.Data.DataRow = SqlDataSet1.Tables(0).NewRow()
            NewRow.ItemArray = SqlDataSet2.Tables(0).Rows(x).ItemArray
            SqlDataSet1.Tables(0).Rows.InsertAt(NewRow, x + 1)
        Next
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
        DataGrid1.Style.Add("border-collapse", "asdfhsg")
    End Sub
End Class
