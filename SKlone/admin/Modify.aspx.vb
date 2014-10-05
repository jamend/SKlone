Namespace admin
    Partial Class Modify
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

        Private Sub cmdSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSubmit.Click
            RulerName()
        End Sub

        Private Sub RulerName()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateKingdomsRulerName", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID.Text
            SqlCommand1.Parameters.Add("@Number", SqlDbType.NVarChar, 24)
            SqlCommand1.Parameters(1).Value = txtRulerName.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet()
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Changed ruler name of kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdSubmit1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSubmit1.Click
            KingdomName()
        End Sub

        Private Sub KingdomName()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateKingdomName", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID.Text
            SqlCommand1.Parameters.Add("@Number", SqlDbType.NVarChar, 24)
            SqlCommand1.Parameters(1).Value = txtKingdomName.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Changed kingdom name of kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdSubmit2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSubmit2.Click
            UserName()
        End Sub

        Private Sub UserName()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateKingdomUser", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID.Text
            SqlCommand1.Parameters.Add("@Number", SqlDbType.NVarChar, 24)
            SqlCommand1.Parameters(1).Value = txtUserName.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Changed username of kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdSubmit3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSubmit3.Click
            UserPassword()
        End Sub

        Private Sub UserPassword()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateKingdomPassword", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Clear()
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = txtkdID.Text
            SqlCommand1.Parameters.Add("@Number", SqlDbType.NVarChar, 24)
            SqlCommand1.Parameters(1).Value = txtUserPassword.Text
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Changed password of kdID " & Val(txtkdID.Text) & "')"
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdShowKingdoms_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdShowKingdoms.Click
            ShowKingdoms()
        End Sub

        Private Sub ShowKingdoms()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("exec dbo.KingdomIDs", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
        End Sub

    End Class
End Namespace