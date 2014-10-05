Namespace admin
    Partial Class Tick
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

        Private Sub cmdTickMany_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTickMany.Click
            Dim x As Int32
            For x = 1 To Val(txtTimes.Text)
                Tick()
            Next
            Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Ticked " & Val(txtTimes.Text) & " times')", Session.Item("sqlAdminConnection"))
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub cmdTick_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTick.Click
            Tick()
            Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Ticked" & "')", Session.Item("sqlAdminConnection"))
            Session.Item("sqlAdminConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlAdminConnection").Close()
        End Sub

        Private Sub Tick()
            Dim SqlCommand1 As New SqlClient.SqlCommand("exec dbo.Tick", Session.Item("sqlConnection"))
            SqlCommand1.CommandTimeout = 10000000
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
        End Sub

    End Class
End Namespace