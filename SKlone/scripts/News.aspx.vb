Partial Class News
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtGalaxy As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtSector As System.Web.UI.WebControls.TextBox
    Protected WithEvents cmdBrowse As System.Web.UI.WebControls.Button
    Protected WithEvents lblNetworth As System.Web.UI.WebControls.Label
    Protected WithEvents lblSectorName As System.Web.UI.WebControls.Label
    Protected WithEvents aAlliance As System.Web.UI.WebControls.HyperLink

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
        ViewNews(0)
    End Sub

    Private Sub ViewNews(ByVal NewsDate As Int32)
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter
        Dim SqlDataSet1 As New Data.DataSet
        Dim SelectCommand As String
        Select Case NewsDate
            Case 0
                SelectCommand = "SELECT '<img src=/images/' + CAST(NewsType AS nvarchar(1)) + '.gif>' AS img, NewsDate, NewsText FROM SectorNews WHERE DAY(NewsDate) = DAY(GETDATE()) AND SectorID = " & Session.Item("SectorID") & " ORDER BY NewsDate"
            Case 1
                SelectCommand = "SELECT '<img src=/images/' + CAST(NewsType AS nvarchar(1)) + '.gif>' AS img, NewsDate, NewsText FROM SectorNews WHERE DAY(NewsDate) = DAY(DATEADD(day, -1, GETDATE())) AND SectorID = " & Session.Item("SectorID") & " ORDER BY NewsDate"
            Case 2
                SelectCommand = "SELECT '<img src=/images/' + CAST(NewsType AS nvarchar(1)) + '.gif>' AS img, NewsDate, NewsText FROM SectorNews WHERE DAY(NewsDate) = DAY(DATEADD(day, -2, GETDATE())) AND SectorID = " & Session.Item("SectorID") & " ORDER BY NewsDate"
            Case 3
                SelectCommand = "SELECT '<img src=/images/' + CAST(NewsType AS nvarchar(1)) + '.gif>' AS img, NewsDate, NewsText FROM SectorNews WHERE DAY(NewsDate) = DAY(DATEADD(day, -3, GETDATE())) AND SectorID = " & Session.Item("SectorID") & " ORDER BY NewsDate"
        End Select
        Dim SqlCommand1 As New SqlClient.SqlCommand(SelectCommand, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        SqlData1.Read()
        If SqlData1.HasRows = False Then
            SqlAdapter1.SelectCommand = New SqlClient.SqlCommand("SELECT ' ' AS img, ' ' AS NewsDate, 'No Sector News Today' AS NewsText", Session.Item("sqlConnection"))
        Else
            SqlAdapter1.SelectCommand = New SqlClient.SqlCommand(SelectCommand, Session.Item("sqlConnection"))
        End If
        Session.Item("sqlConnection").Close()
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdView_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdView.Click
        Dim NewsDate As Int32 = Val(cboDate.SelectedItem.Value)
        If NewsDate < 0 Or NewsDate > 3 Then NewsDate = 0
        ViewNews(NewsDate)
    End Sub
End Class