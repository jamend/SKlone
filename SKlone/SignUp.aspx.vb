Partial Class SignUp
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblServerTime As System.Web.UI.WebControls.Label
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label

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
        If Session.Item("LoggedIn") = True Then
            Response.Redirect("/scripts/", True)
        End If
    End Sub

    Private Sub cmdSignUp_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSignUp.Click
        Response.Write("testtest")
        If txtPassword.Text = "" Then
            lblError.Text = "Password field is blank"
        Else
            If txtAccount.Text = "" Then
                lblError.Text = "Account field is blank"
            Else
                If txtEmail.Text = "" Then
                    lblError.Text = "Email field is blank"
                Else
                    If txtPassword.Text <> txtConfirm.Text Then
                        lblError.Text = "Passwords don't match"
                    Else
                        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CreateKingdom", Session.Item("sqlConnection"))
                        Dim AccountString As String = LCase(txtAccount.Text + txtPassword.Text + txtEmail.Text + txtKingdomName.Text + txtRuler.Text)
                        If InStr(AccountString, "kkk") > 0 Or InStr(AccountString, "klux") > 0 Then
                            lblError.Text = "You are banned."
                            SqlCommand1.CommandText = "INSERT INTO Bans(BanEmail, BanIP, BanKDName, BanRulerName, BanAccount) VALUES (@Email, @IP, @KingdomName, @RulerName, @Account)"
                            SqlCommand1.Parameters.Add("@IP", SqlDbType.NVarChar, 16)
                            SqlCommand1.Parameters(0).Value = Request.UserHostAddress
                            SqlCommand1.Parameters.Add("@Account", SqlDbType.NVarChar, 16)
                            SqlCommand1.Parameters(1).Value = txtAccount.Text
                            SqlCommand1.Parameters.Add("@Email", SqlDbType.NVarChar, 256)
                            SqlCommand1.Parameters(2).Value = Filter(txtEmail.Text)
                            SqlCommand1.Parameters.Add("@KingdomName", SqlDbType.NVarChar, 24)
                            SqlCommand1.Parameters(3).Value = Filter(txtKingdomName.Text)
                            SqlCommand1.Parameters.Add("@RulerName", SqlDbType.NVarChar, 24)
                            SqlCommand1.Parameters(4).Value = Filter(txtRuler.Text)
                            Session.Item("sqlConnection").open()
                            SqlCommand1.ExecuteNonQuery()
                        Else
                            Randomize()
                            Dim ActivationCode As Int64 = Math.Round(Rnd() * 9223372036854775807, 0)
                            SqlCommand1.CommandType = CommandType.StoredProcedure
                            SqlCommand1.Parameters.Clear()
                            SqlCommand1.Parameters.Add("@IP", SqlDbType.NVarChar, 16)
                            SqlCommand1.Parameters(0).Value = Request.UserHostAddress
                            SqlCommand1.Parameters.Add("@ActivationCode", SqlDbType.BigInt)
                            SqlCommand1.Parameters(1).Value = ActivationCode
                            SqlCommand1.Parameters.Add("@Account", SqlDbType.NVarChar, 16)
                            SqlCommand1.Parameters(2).Value = txtAccount.Text
                            SqlCommand1.Parameters.Add("@Password", SqlDbType.NVarChar, 16)
                            SqlCommand1.Parameters(3).Value = txtPassword.Text
                            SqlCommand1.Parameters.Add("@Email", SqlDbType.NVarChar, 256)
                            SqlCommand1.Parameters(4).Value = Filter(txtEmail.Text)
                            SqlCommand1.Parameters.Add("@KingdomName", SqlDbType.NVarChar, 24)
                            SqlCommand1.Parameters(5).Value = Filter(txtKingdomName.Text)
                            SqlCommand1.Parameters.Add("@RulerName", SqlDbType.NVarChar, 24)
                            SqlCommand1.Parameters(6).Value = Filter(txtRuler.Text)
                            SqlCommand1.Parameters.Add("@PlanetType", SqlDbType.TinyInt)
                            SqlCommand1.Parameters(7).Value = Val(cboPlanetType.Value)
                            SqlCommand1.Parameters.Add("@RaceType", SqlDbType.TinyInt)
                            SqlCommand1.Parameters(8).Value = Val(cboRaceType.Value)
                            SqlCommand1.Parameters.Add("@Result", 0)
                            SqlCommand1.Parameters("@Result").Direction = ParameterDirection.ReturnValue
                            Session.Item("sqlConnection").Open()
                            SqlCommand1.ExecuteNonQuery()
                            Select Case SqlCommand1.Parameters("@Result").Value
                                Case 0
                                    lblError.Text = "You've already signed up."
                                Case 1
                                    lblError.Text = "Account name in use."
                                Case 2
                                    lblError.Text = "Email in use."
                                Case 3
                                    lblError.Text = "Kingdom name in use."
                                Case 4
                                    lblError.Text = "You are banned."
                                    Session.Item("sqlConnection").Close()
                                    SqlCommand1.CommandType = CommandType.Text
                                    SqlCommand1.CommandText = "INSERT INTO Bans(BanEmail, BanIP, BanKDName, BanRulerName, BanAccount) VALUES (@Email, @IP, @KingdomName, @RulerName, @Account)"
                                    SqlCommand1.Parameters.Add("@IP", SqlDbType.NVarChar, 16)
                                    SqlCommand1.Parameters(0).Value = Request.UserHostAddress
                                    SqlCommand1.Parameters.Add("@Account", SqlDbType.NVarChar, 16)
                                    SqlCommand1.Parameters(1).Value = txtAccount.Text
                                    SqlCommand1.Parameters.Add("@Email", SqlDbType.NVarChar, 256)
                                    SqlCommand1.Parameters(2).Value = Filter(txtEmail.Text)
                                    SqlCommand1.Parameters.Add("@KingdomName", SqlDbType.NVarChar, 24)
                                    SqlCommand1.Parameters(3).Value = Filter(txtKingdomName.Text)
                                    SqlCommand1.Parameters.Add("@RulerName", SqlDbType.NVarChar, 24)
                                    SqlCommand1.Parameters(4).Value = Filter(txtRuler.Text)
                                    Session.Item("sqlConnection").open()
                                    SqlCommand1.ExecuteNonQuery()
                                Case 5
                                    'Dim ActivateEmail As New Mail.MailMessage()
                                    'ActivateEmail.To = Filter(txtEmail.Text)
                                    'ActivateEmail.From = "skloneadmin@sklone.no-ip.com"
                                    'ActivateEmail.Subject = "Your SKlone Activation Code"
                                    'ActivateEmail.BodyFormat = Mail.MailFormat.Text
                                    'ActivateEmail.Body = ActivationCode
                                    'Mail.SmtpMail.SmtpServer = "sklone.no-ip.com"
                                    'Mail.SmtpMail.Send(ActivateEmail)
                                    'Dim aCookie As New HttpCookie("SignUp2")
                                    'aCookie.Value = "1"
                                    'aCookie.Expires = DateTime.Now.AddDays(1)
                                    'Response.Cookies.Add(aCookie)
                                    lblError.Text = "Account created. Activation is not required because the email server is down."
                                Case 6
                                    lblError.Text = "Signups have reached the max amount of players."
                            End Select
                        End If
                        Session.Item("sqlConnection").Close()
                    End If
                End If
            End If
        End If
        'End If

    End Sub
End Class
