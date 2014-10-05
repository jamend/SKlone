Partial Class TopInfoBar
    Inherits System.Web.UI.UserControl

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
        'Dim a As New System.Globalization.CultureInfo("de-DE") 'Request.UserLanguages(0)
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        lblDate.Text = System.DateTime.Now.ToString(DateTimeFormatString)
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Kingdoms.Population, Kingdoms.Money, Kingdoms.Power, dbo.CalcNetworth(Kingdoms.kdID), Land.Land FROM Kingdoms, Land WHERE Land.kdID = Kingdoms.kdID AND Kingdoms.kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblPopulation.Text = SqlData1.GetInt64(0).ToString(NumberFormatString)
        lblMoney.Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
        lblPower.Text = "Power: " & SqlData1.GetInt64(2).ToString(NumberFormatString)
        If SqlData1.GetInt64(2) = 0 Then
            lblPower.ForeColor = lblPower.ForeColor.FromArgb(&H78FF0000)
        Else
            lblPower.ForeColor = lblPower.ForeColor.FromArgb(&H78FFFFFF)
        End If
        lblNetworth.Text = SqlData1.GetInt64(3).ToString(NumberFormatString)
        lblLand.Text = SqlData1.GetInt32(4).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()

        Session.Item("sqlConnection").Open()
        SqlCommand1.CommandText = "SELECT COUNT(*) FROM Messages WHERE MessageRead = 0 AND Recipient = " & Session.Item("kdID")
        If SqlCommand1.ExecuteScalar = 0 Then
            aMessages.Text = "Read Messages"
        Else
            aMessages.Text = "<b>New Messages (" & SqlCommand1.ExecuteScalar & ")</b>"
        End If
        Session.Item("sqlConnection").Close()

        Session.Item("sqlConnection").Open()
        SqlCommand1.CommandText = "SELECT COUNT(*) FROM PersonalNews WHERE NewsRead = 0 AND kdID = " & Session.Item("kdID")
        If SqlCommand1.ExecuteScalar = 0 Then
            aNews.Text = "No News"
            aNews.NavigateUrl = ""
        Else
            aNews.Text = "<b>New News (" & SqlCommand1.ExecuteScalar & ")</b>"
            aNews.NavigateUrl = "RightFrame.aspx?action=NewNews"
        End If
        Session.Item("sqlConnection").Close()

        If Session.Item("Cancelled") = True Then
            lblVacation.Text = "You have cancelled vacation mode."
            P3.Visible = True
            Session.Item("Cancelled") = False
        End If
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            SqlCommand1.CommandText = "SELECT NewbieHours FROM AccountStatus WHERE kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            lblNewbieMode.Text = "YOU ARE IN NEWBIE STATUS FOR ANOTHER <b>" & SqlCommand1.ExecuteScalar & "</b> HOURS."
            Session.Item("sqlConnection").Close()
            P1.Visible = True
        Else
            lblNewbieMode.Text = ""
            P1.Visible = False
        End If
        Session.Item("sqlConnection").Open()
        SqlCommand1.CommandText = "SELECT NotStarted, StartDate, EndGame, EndDate FROM ServerStatus"
        SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetBoolean(0) = True Then
            lblGameState.Text = "THE GAME HAS NOT STARTED. YOUR LANDS WILL NOT GROW UNTIL <b>" & SqlData1.GetDateTime(1).ToString(DateTimeFormatString) & "</b>."
            P2.Visible = True
        Else
            If SqlData1.GetBoolean(2) = True Then
                lblGameState.Text = "THE GAME WILL END <b>" & SqlData1.GetDateTime(3).ToString(DateTimeFormatString) & "</b>. CHAOS MODE WILL BE ACTIVATED AT <b>10:00 P.M.</b> THE NIGHT OF THE RESET."
                P2.Visible = True
            Else
                lblGameState.Text = ""
                P2.Visible = False
            End If
        End If
        Session.Item("sqlConnection").Close()
    End Sub

End Class
