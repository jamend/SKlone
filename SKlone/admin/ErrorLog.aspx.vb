Namespace admin
    Partial Class ErrorLog
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
            UpdateList()
        End Sub

        Private Sub UpdateList()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT TOP " & Val(txtMax.Text) & " * FROM ErrorLog ORDER BY ErrorDate DESC", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
            Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Checked Error Log" & "')", Session.Item("sqlAdminConnection"))
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdRefresh_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRefresh.Click
            UpdateList()
        End Sub
    End Class
End Namespace