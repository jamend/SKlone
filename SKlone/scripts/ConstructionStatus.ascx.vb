Partial Class ConstructionStatus
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
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.BuildingName(BuildingType) AS BuildingName, Built, dbo.BuildingPercent(kdID, BuildingType) AS BuildingPercent, Construction0 AS [1], Construction1 AS [2], Construction2 AS [3], Construction3 AS [4], Construction4 AS [5], Construction5 AS [6], Construction6 AS [7], Construction7 AS [8], Construction8 AS [9], Construction9 AS [10], Construction10 AS [11], Construction11 AS [12], Construction12 AS [13], Construction13 AS [14], Construction14 AS [15], Construction15 AS [16], '0' AS [17], '0' AS [18], '0' AS [19], '0' AS [20], '0' AS [21], '0' AS [22], '0' AS [23], '0' AS [24] FROM Buildings WHERE kdID = " & kdID & " ORDER BY dbo.BuildingOrder(BuildingType)", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet
        Dim SqlDataSet2 As New Data.DataSet
        If Session.Item("sqlConnection").State = ConnectionState.Open Then Session.Item("sqlConnection").Close()
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        SqlAdapter1.SelectCommand = New SqlClient.SqlCommand("SELECT 'Land' AS BuildingName, Land AS Built, '100%' AS BuildingPercent, Land0 AS [1], Land1 AS [2], Land2 AS [3], Land3 AS [4], Land4 AS [5], Land5 AS [6], Land6 AS [7], Land7 AS [8], Land8 AS [9], Land9 AS [10], Land10 AS [11], Land11 AS [12], Land12 AS [13], Land13 AS [14], Land14 AS [15], Land15 AS [16], Land16 AS [17], Land17 AS [18], Land18 AS [19], Land19 AS [20], Land20 AS [21], Land21 AS [22], Land22 AS [23], Land23 AS [24] FROM Land WHERE kdID = " & kdID, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet2)
        Session.Item("sqlConnection").Close()
        Dim NewRow As System.Data.DataRow = SqlDataSet1.Tables(0).NewRow()
        NewRow.ItemArray = SqlDataSet2.Tables(0).Rows(0).ItemArray
        SqlDataSet1.Tables(0).Rows.InsertAt(NewRow, 6)
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
    End Sub

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class