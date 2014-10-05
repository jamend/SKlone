Partial Class Rewards
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
        If Session.Item("LoggedIn") = False Then
            Session.Item("LogInRedirect") = Request.RawUrl
            Response.Redirect("LogIn.aspx", True)
        End If
        If SKSession.Activated(Session.Item("kdID"), Session.Item("sqlConnection")) = False Then
            Session.Item("ActivateRedirect") = Request.RawUrl
            Response.Redirect("Activate.aspx", True)
        End If
        If SKSession.DeletePending(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("DeleteRedirect") = Request.RawUrl
            Response.Redirect("Delete.aspx", True)
        End If
        If SKSession.Dead(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("DeadRedirect") = Request.RawUrl
            Response.Redirect("Dead.aspx", True)
        End If
        If SKSession.Cheater(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("CheaterRedirect") = Request.RawUrl
            Response.Redirect("Dead.aspx", True)
        End If
        If SKSession.VacationPending(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("VacationRedirect") = Request.RawUrl
            Response.Redirect("Vacation.aspx", True)
        End If
        If SKSession.VacationMode(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("VacationRedirect") = Request.RawUrl
            Response.Redirect("Vacation.aspx?action=mode", True)
        End If
        If SKSession.VacationEnd(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Session.Item("VacationRedirect") = Request.RawUrl
            Response.Redirect("Vacation.aspx?action=end", True)
        End If

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT LastMoneyReward, LastLandReward, (SELECT NotStarted FROM ServerStatus) FROM Accounts WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If Request.Item("money") = "1" Then
            If SqlData1.GetBoolean(2) = True Then
                lblError.Text = "You cannot get your reward because the game has not started yet."
            Else
                If SqlData1.GetDateTime(0).DayOfYear = Now.DayOfYear Then
                    lblError.Text = "You have already received your money reward for today."
                Else
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "UPDATE Kingdoms SET [Money] = [Money] + (Income * 3) WHERE kdID = " & Session.Item("kdID") & "; UPDATE Accounts SET LastMoneyReward = GETDATE() WHERE kdID = " & Session.Item("kdID")
                    Session.Item("sqlConnection").Open()
                    sqlcommand1.ExecuteNonQuery()
                    lblError.Text = "Your money reward has just been added to your total money."
                End If
            End If
        End If
        If Request.Item("land") = "1" Then
            If SqlData1.GetBoolean(2) = True Then
                lblError.Text = "You cannot get your reward because the game has not started yet."
            Else
                If SqlData1.GetDateTime(1).DayOfYear = Now.DayOfYear Then
                    lblError.Text = "You have already received your land reward for today."
                Else
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "UPDATE Land SET Land = Land + 20 WHERE kdID = " & Session.Item("kdID") & "; UPDATE Accounts SET LastLandReward = GETDATE() WHERE kdID = " & Session.Item("kdID")
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    lblError.Text = "Your 20 land reward has been added to your total land."
                End If
            End If
        End If
        Session.Item("sqlConnection").Close()
        lblRulerName.Text = Session.Item("RulerName")
    End Sub

End Class