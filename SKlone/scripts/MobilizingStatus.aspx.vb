Partial Class MobilizingStatus
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

        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.UnitName(UnitType) AS UnitName, Training0 AS [1], Training1 AS [2], Training2 AS [3], Training3 AS [4], Training4 AS [5], Training5 AS [6], Training6 AS [7], Training7 AS [8], Training8 AS [9], Training9 AS [10], Training10 AS [11], Training11 AS [12], Training12 AS [13], Training13 AS [14], Training14 AS [15], Training15 AS [16], Training16 AS [17], Training17 AS [18], Training18 AS [19], Training19 AS [20], Training20 AS [21], Training21 AS [22], Training22 AS [23], Training23 AS [24] FROM UnitsTraining WHERE kdID = " & Session.Item("kdID") & " AND dbo.UnitResearched(kdID, UnitType) = 1 ORDER BY dbo.UnitOrder(UnitType)", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
    End Sub

End Class