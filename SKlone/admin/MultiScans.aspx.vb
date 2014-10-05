Namespace admin
    Partial Class MultiScans
        Inherits System.Web.UI.Page

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

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            If Session.Item("Admin") = False Then
                Session.Item("AdminRedirect") = Request.RawUrl
                Response.Redirect("LogIn.aspx", True)
            End If
        End Sub

        Private Sub cmdScan1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScan1.Click
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT kdID, [Name], RulerName FROM Kingdoms WHERE dbo.Similarities([Name]) > 1 ORDER BY SOUNDEX([Name])", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

        Private Sub cmdScan2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScan2.Click
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT kdID, [Name], RulerName FROM Kingdoms WHERE dbo.Similarities2(RulerName) > 1 ORDER BY SOUNDEX(RulerName)", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

        Private Sub cmdScan3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScan3.Click
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT kdID, dbo.FullKingdomNameC(kdID) AS [Name], Account, [Password] FROM Accounts WHERE dbo.Similarities3(Account) > 1 ORDER BY SOUNDEX(Account)", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

        Private Sub cmdScan4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScan4.Click
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT kdID, dbo.FullKingdomNameC(kdID) AS [Name], Account, [Password] FROM Accounts WHERE dbo.Similarities4([Password]) > 1 ORDER BY [Password]", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

        Private Sub cmdScan5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdScan5.Click
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.LogIns.LogInIP, multi1 = CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END, multi2 = CASE WHEN logins.kdid < logins_1.kdid THEN logins_1.kdid ELSE logins.kdid END FROM dbo.LogIns INNER JOIN dbo.LogIns LogIns_1 ON dbo.LogIns.LogInIP = LogIns_1.LogInIP AND dbo.LogIns.kdID <> LogIns_1.kdID GROUP BY dbo.LogIns.LogInIP, CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END, CASE WHEN logins.kdid < logins_1.kdid THEN logins_1.kdid ELSE logins.kdid END ORDER BY CASE WHEN logins.kdid < logins_1.kdid THEN logins.kdid ELSE logins_1.kdid END", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub
    End Class
End Namespace