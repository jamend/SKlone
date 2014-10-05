Namespace scripts
    Partial Class Activate
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

        Dim ActivationCode As Int64
        Dim Email As String
        Dim Attempts As Byte

        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            If Session.Item("ActivateRedirect") = "" Then Session.Item("ActivateRedirect") = "/scripts/"
            If Session.Item("LoggedIn") = False Then
                Session.Item("LogInRedirect") = Request.RawUrl
                Response.Redirect("LogIn.aspx", True)
            End If
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Cheater, Dead FROM AccountStatus WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.GetBoolean(0) = True Then
                Session.Item("sqlConnection").Close()
                pnlError.Visible = True
                lblError.Text = "Your account has been disabled by the admins for breaking the game rules. If you believe this is a mistake email administrator@sklone.homeip.net"
            Else
                Session.Item("sqlConnection").Close()
                If SqlData1.GetBoolean(1) = True Then
                    pnlError.Visible = True
                    lblError.Text = "Your account has died."
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.CommandText = "exec dbo.DeleteKingdom " & Session.Item("kdID")
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                Else
                    If SKSession.Activated(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
                        pnlError.Visible = True
                        lblError.Text = "You have already activated your account."
                    Else
                        SqlCommand1.CommandText = "SELECT ActivationCode, ActivationAttempts FROM Activation WHERE kdID = " & Session.Item("kdID")
                        Session.Item("sqlConnection").Open()
                        SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                        SqlData1.Read()
                        ActivationCode = SqlData1.GetInt32(0)
                        Attempts = SqlData1.GetByte(1)
                        Session.Item("sqlConnection").Close()
                        SqlCommand1.CommandText = "SELECT Email FROM Accounts WHERE kdID = " & Session.Item("kdID")
                        Session.Item("sqlConnection").Open()
                        Email = SqlCommand1.ExecuteScalar
                        Session.Item("sqlConnection").Close()
                        cmdResend.Text = "Resend Email to: " & Email
                    End If
                End If
            End If
        End Sub

        Private Sub cmdActivate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdActivate.Click
            If ActivationCode = Val(txtActivationCode.Text) Then
                Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Activation SET Activated = 1 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
                Response.Redirect(Session.Item("ActivateRedirect"), True)
            Else
                If 10 - Attempts = 0 Then
                    Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET Dead = 1, DieDate = GETDATE(), Cheater = 1 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                    Response.Redirect("Activate.aspx", True)
                Else
                    lblError.Text = "The activation code you entered was incorrect. You have " & 10 - Attempts & " more attempts until your account gets disabled."
                    pnlError.Visible = True
                    Attempts = Attempts + 1
                    Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Activation SET ActivationAttempts = AcitvationAttempts + 1 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                End If
            End If
        End Sub

        Private Sub cmdResend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdResend.Click
            'Dim ActivateEmail As New Mail.MailMessage
            'ActivateEmail.To = Email
            'ActivateEmail.From = "administrator@sklone.homeip.net"
            'ActivateEmail.Subject = "Your SKlone Activation Code"
            'ActivateEmail.BodyFormat = Mail.MailFormat.Text
            'ActivateEmail.Body = ActivationCode
            'Mail.SmtpMail.SmtpServer = "127.0.0.1"
            'Mail.SmtpMail.Send(ActivateEmail)
            lblError.Text = "Activation is not required. Login and enjoy =)."
        End Sub
    End Class
End Namespace