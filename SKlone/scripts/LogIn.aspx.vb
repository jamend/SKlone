Partial Class LogIn
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
        If Session.Item("LogInRedirect") = "" Then Session.Item("LogInRedirect") = "RightFrame.aspx"
        If Session.Item("LoggedIn") = True Then
            Response.Redirect(Session.Item("LogInRedirect"))
            Session.Item("LogInRedirect") = ""
            Response.End()
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.LoggedIn(), COUNT(*) FROM Accounts", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblStatus.Text = SqlData1.GetInt32(0) & "/" & SqlData1.GetInt32(1) & " users online"
        Session.Item("sqlConnection").Close()
        lblServerTime.Text = System.DateTime.Now.ToString(DateTimeFormatString)
    End Sub

    Private Sub cmdLogIn_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLogIn.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Accounts.kdID, Kingdoms.SectorID, Sectors.Sector, Sectors.Galaxy, Kingdoms.[Name], Kingdoms.RulerName FROM Accounts, Kingdoms, Sectors WHERE Accounts.Account = @Account AND Accounts.Password = @Password AND Kingdoms.kdID = Accounts.kdID AND Sectors.SectorID = Kingdoms.SectorID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@Account", txtAccount.Text)
        SqlCommand1.Parameters.Add("@Password", HashPassword(txtPassword.Text, txtAccount.Text))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.HasRows = False Then
            lblError.Text = "Account not found or invalid password"
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "INSERT INTO FailedLogins(FailedIP) VALUES ('" & Request.UserHostAddress & "')"
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
        Else
            Session.Item("LoggedIn") = True
            Session.Item("kdID") = SqlData1.GetInt32(0)
            Session.Item("SectorID") = SqlData1.GetInt32(1)
            Session.Item("Sector") = SqlData1.GetByte(2)
            Session.Item("Galaxy") = SqlData1.GetByte(3)
            Session.Item("KingdomName") = SqlData1.GetString(4)
            Session.Item("RulerName") = SqlData1.GetString(5)
            SqlCommand1.CommandText = "EXEC dbo.LogIn " & Session.Item("kdID") & ", '" & Request.UserHostAddress & "'"
            Session.Item("sqlConnection").Close()
            SKSession.LoggedIn(Session.Item("kdID"), True, Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Response.Redirect(Session.Item("LogInRedirect"))
            Session.Item("LogInRedirect") = ""
            Response.End()
        End If
    End Sub
End Class
