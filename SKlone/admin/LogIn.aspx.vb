Namespace admin
    Partial Class _Default
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
            If Session.Item("AdminRedirect") = "" Then Session.Item("AdminRedirect") = "admin/"
            lblError.Text = ""
            Session.Item("sqlAdminConnection") = New SqlClient.SqlConnection("server='localhost'; integrated security=True; packet size=4096;initial catalog=sklone")
        End Sub

        Private Sub cmdLogIn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLogIn.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AdminID FROM Admins WHERE Username = @Username AND Password = @Password", Session.Item("sqlAdminConnection"))
            SqlCommand1.Parameters.Add("@Username", txtUsername.Text)
            SqlCommand1.Parameters.Add("@Password", txtPassword.Text)
            Session.Item("sqlAdminConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            If SqlData1.HasRows = False Then
                lblError.Text = "Account not found or invalid password"
            Else
                SqlData1.Read()
                Session.Item("Admin") = True
                Session.Item("AdminID") = SqlData1.GetInt32(0)
                Session.Item("sqlAdminConnection").Close()
                SqlCommand1.CommandText = "INSERT INTO AdminLog (AdminID, IP, Action) VALUES (" & Session.Item("AdminID") & ", '" & Request.UserHostAddress & "', '" & "Logged In" & "')"
                Session.Item("sqlAdminConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlAdminConnection").Close()
                Response.Redirect(Session.Item("AdminRedirect"))
                Session.Item("AdminRedirect") = ""
                Response.End()
            End If
            Session.Item("sqlAdminConnection").Close()
        End Sub
    End Class
End Namespace