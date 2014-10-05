Namespace admin
    Partial Class Delete2
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

        Private Sub cmdShowKingdoms_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdShowKingdoms.Click
            ShowKingdoms()
        End Sub

        Private Sub ShowKingdoms()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT kdID FROM Accounts", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet()
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

        Private Sub cmdDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDelete.Click
            Delete()
        End Sub

        Private Sub Delete()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DeleteKingdom", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet()
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Deleted kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub


    End Class
End Namespace