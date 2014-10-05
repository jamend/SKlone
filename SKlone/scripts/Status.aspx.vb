Partial Class Status
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblKingdomName As System.Web.UI.WebControls.Label
    Protected WithEvents lblDate As System.Web.UI.WebControls.Label

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

        lblRulerName.Text = Session.Item("RulerName")
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Income, ShieldsPowerChange, PowerChange, PopulationChange, Wins, Losses, MA, LastAttacker, dbo.FullKingdomNameC(LastAttacker) FROM Kingdoms WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblIncome.Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
        lblShieldsPower.Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
        lblPowerChange.Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
        lblPopulationChange.Text = SqlData1.GetInt32(3).ToString(NumberFormatString)
        lblWins.Text = SqlData1.GetInt32(4).ToString(NumberFormatString)
        lblLosses.Text = SqlData1.GetInt32(5).ToString(NumberFormatString)
        lblMA.Text = SqlData1.GetByte(6).ToString & "%"
        If SqlData1.IsDBNull(7) Then
            lblLastAttacker.Visible = False
        Else
            lblLastAttacker.Visible = True
            lblLastAttacker.Text = "Last Attacker: <b>" & SqlData1.GetString(8) & "</b><BR><BR>"
        End If
        Session.Item("sqlConnection").Close()
    End Sub

End Class