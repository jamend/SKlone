Namespace admin
    Partial Class Disable
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

        Private Sub cmdDisable_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDisable.Click
            Disable()
        End Sub

        Private Sub Disable()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DisableKingdom", Session.Item("sqlConnection"))
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
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Disabled kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdEnable_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdEnable.Click
            Enable()
        End Sub

        Private Sub Enable()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.EnableKingdom", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID2.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Enabled kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub


    End Class
End Namespace