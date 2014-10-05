Imports SKlone.scripts

Partial Class Explore
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

    Dim BottomInfoBar1 As BottomInfoBar


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
        pnlExplored.Visible = False
        lblError.Visible = False
        UpdateLand()
        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateLand()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.Exploring(@kdID), dbo.Explorable(@kdID), dbo.ExploreCost(@kdID)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblExploring.Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
        lblExplorable.Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
        lblExploreCost.Text = SqlData1.GetInt32(2).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdExplore_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdExplore.Click
        Dim Land As Int32 = Val(txtLand.Text)
        If Land < 0 Then
            lblError.Text = "I'm sorry " & Session.Item("RulerName") & ", but you did not give us complete orders."
            lblError.Visible = True
            Exit Sub
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.Explorable(" & Session.Item("kdID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim MaxLand As Int64 = SqlCommand1.ExecuteScalar
        Session.Item("sqlConnection").Close()
        If MaxLand < Land Then
            lblError.Text = "I'm sorry " & Session.Item("RulerName") & ", but you can only explore up to a maximum of <b>" & MaxLand.ToString(NumberFormatString) & "</b> land."
            lblError.Visible = True
            pnlExplored.Visible = False
        Else
            SqlCommand1.CommandText = "EXEC dbo.Explore " & Session.Item("kdID") & ", " & Land
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT Land0 AS [1], Land1 AS [2], Land2 AS [3], Land3 AS [4], Land4 AS [5], Land5 AS [6], Land6 AS [7], Land7 AS [8], Land8 AS [9], Land9 AS [10], Land10 AS [11], Land11 AS [12], Land12 AS [13], Land13 AS [14], Land14 AS [15], Land15 AS [16], Land16 AS [17], Land17 AS [18], Land18 AS [19], Land19 AS [20], Land20 AS [21], Land21 AS [22], Land22 AS [23], Land23 AS [24] FROM Land WHERE kdID = " & Session.Item("kdID"), New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
            lblExplored.Text = Land
            pnlExplored.Visible = True
        End If
        txtLand.Text = ""
        UpdateLand()
        BottomInfoBar1.Refresh()
    End Sub
End Class