Imports SKlone.scripts

Partial Class Raze
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
        pnlStatus.Visible = False
        pnlError.Visible = False
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(kdID, 7), dbo.PercentResearched(kdID, 8) FROM Research WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(0) < 100 Then tblBuildings.Rows(3).Visible = False Else tblBuildings.Rows(3).Visible = True
        If SqlData1.GetByte(1) < 100 Then tblBuildings.Rows(5).Visible = False Else tblBuildings.Rows(5).Visible = True
        Session.Item("sqlConnection").Close()
        UpdateBuildings()
        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateBuildings()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Built FROM Buildings WHERE kdID = " & Session.Item("kdID") & " ORDER BY BuildingType", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblBuildings.Rows(x).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
            x += 1
        End While
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdRaze_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdRaze.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT SUM(Built) FROM Buildings WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim BuildingsTotal As Int32 = SqlCommand1.ExecuteScalar
        Session.Item("sqlConnection").Close()
        If (Math.Abs(Val(Request.Item("txtResidences"))) + Math.Abs(Val(Request.Item("txtBarracks"))) + Math.Abs(Val(Request.Item("txtAirBays"))) + Math.Abs(Val(Request.Item("txtNuclearPlants"))) + Math.Abs(Val(Request.Item("txtFusionPlants"))) + Math.Abs(Val(Request.Item("txtStarMines"))) + Math.Abs(Val(Request.Item("txtTrainingCamps"))) + Math.Abs(Val(Request.Item("txtFactories")))) < 1 Then
            pnlError.Visible = True
        Else
            SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
            SqlCommand1.CommandText = _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtResidences"))) & ", 0; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtBarracks"))) & ", 1; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtAirBays"))) & ", 2; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtNuclearPlants"))) & ", 3; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtFusionPlants"))) & ", 4; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtStarMines"))) & ", 5; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtTrainingCamps"))) & ", 6; " & _
                "EXEC dbo.Raze @kdID, " & Math.Abs(Val(Request.Item("txtFactories"))) & ", 7"
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT SUM(Built) FROM Buildings WHERE kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            Dim Razed As Int32 = BuildingsTotal - SqlCommand1.ExecuteScalar
            Session.Item("sqlConnection").Close()
            lblRazed.Text = Razed.ToString(NumberFormatString)
            pnlStatus.Visible = True
        End If
        Session.Item("sqlConnection").Close()
        UpdateBuildings()
        txtResidences.Text = ""
        txtBarracks.Text = ""
        txtAirBays.Text = ""
        txtNuclearPlants.Text = ""
        txtFusionPlants.Text = ""
        txtStarMines.Text = ""
        txtTrainingCamps.Text = ""
        txtFactories.Text = ""
        BottomInfoBar1.Refresh()
    End Sub
End Class