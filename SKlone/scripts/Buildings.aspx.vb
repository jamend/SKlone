Imports SKlone.scripts

Partial Class Buildings
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
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(@kdID, 7), dbo.PercentResearched(@kdID, 8)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(0) < 100 Then tblBuildings.Rows(3).Visible = False Else tblBuildings.Rows(3).Visible = True
        If SqlData1.GetByte(1) < 100 Then tblBuildings.Rows(5).Visible = False Else tblBuildings.Rows(5).Visible = True
        Session.Item("sqlConnection").Close()
        UpdateBuildings()
        lblError.Visible = False
        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateBuildings()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Built, dbo.UnderConstruction(kdID, BuildingType) FROM Buildings WHERE kdID = " & Session.Item("kdID") & " ORDER BY BuildingType", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblBuildings.Rows(x).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
            tblBuildings.Rows(x).Cells(2).Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
            x += 1
        End While
        Session.Item("sqlConnection").Close()
        SqlCommand1.CommandText = "SELECT dbo.FreeLand(@kdID), dbo.BuildCost(@kdID), dbo.Buildable(@kdID)"
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblFreeLand.Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
        lblCost.Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
        lblBuildable.Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdConstruct_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdConstruct.Click
        Dim BuildingsTotal As Int64 = (Math.Abs(Val(Request.Item("txtResidences"))) + Math.Abs(Val(Request.Item("txtBarracks"))) + Math.Abs(Val(Request.Item("txtAirBays"))) + Math.Abs(Val(Request.Item("txtNuclearPlants"))) + Math.Abs(Val(Request.Item("txtFusionPlants"))) + Math.Abs(Val(Request.Item("txtStarMines"))) + Math.Abs(Val(Request.Item("txtTrainingCamps"))) + Math.Abs(Val(Request.Item("txtFactories"))))
        If BuildingsTotal <= 0 Then
            lblError.Text = "I'm sorry " & Session.Item("RulerName") & ", but you did not give us complete orders."
            lblError.Visible = True
        Else
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.Buildable(" & Session.Item("kdID") & ")", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim Buildable As Int64 = SqlCommand1.ExecuteScalar
            If Buildable < BuildingsTotal Then
                lblError.Text = "I'm sorry " & Session.Item("RulerName") & ", you gave us orders to build <b>" & BuildingsTotal.ToString(NumberFormatString) & " buildings</b>, but there is only enough recources to build <b>" & Buildable.ToString(NumberFormatString) & " buildings</b>."
                lblError.Visible = True
            Else
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "SELECT dbo.PercentResearched(@kdID, 7), dbo.PercentResearched(@kdID, 8)"
                SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
                SqlCommand1.Parameters(0).Value = Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                SqlData1.Read()
                If Val(Request.Item("txtAirBays")) > 0 And SqlData1.GetByte(0) < 100 Then
                    lblError.Text = "You don't have the technology to build Air Bays yet."
                    lblError.Visible = True
                Else
                    If Val(Request.Item("txtFusionPlants")) > 0 And SqlData1.GetByte(1) < 100 Then
                        lblError.Text = "You don't have the technology to build Fusion Power Plants yet."
                        lblError.Visible = True
                    Else
                        Session.Item("sqlConnection").Close()
                        SqlCommand1.CommandText = _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtResidences"))) & ", 0; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtBarracks"))) & ", 1; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtAirBays"))) & ", 2; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtNuclearPlants"))) & ", 3; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtFusionPlants"))) & ", 4; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtStarMines"))) & ", 5; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtTrainingCamps"))) & ", 6; " & _
                            "EXEC dbo.Build @kdID, " & Math.Abs(Val(Request.Item("txtFactories"))) & ", 7"
                        Session.Item("sqlConnection").Open()
                        SqlCommand1.ExecuteNonQuery()
                        UpdateConstruction()
                        pnlStatus.Visible = True
                    End If
                End If
            End If
        End If
        Session.Item("sqlConnection").Close()
        txtResidences.Text = ""
        txtBarracks.Text = ""
        txtAirBays.Text = ""
        txtNuclearPlants.Text = ""
        txtFusionPlants.Text = ""
        txtStarMines.Text = ""
        txtTrainingCamps.Text = ""
        txtFactories.Text = ""
        UpdateBuildings()
        BottomInfoBar1.Refresh()
    End Sub

    Public Sub UpdateConstruction()
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.BuildingName(BuildingType) AS BuildingName, Construction0 AS [1], Construction1 AS [2], Construction2 AS [3], Construction3 AS [4], Construction4 AS [5], Construction5 AS [6], Construction6 AS [7], Construction7 AS [8], Construction8 AS [9], Construction9 AS [10], Construction10 AS [11], Construction11 AS [12], Construction12 AS [13], Construction13 AS [14], Construction14 AS [15], Construction15 AS [16], '0' AS [17], '0' AS [18], '0' AS [19], '0' AS [20], '0' AS [21], '0' AS [22], '0' AS [23], '0' AS [24] FROM Buildings WHERE kdID = " & Session.Item("kdID") & " ORDER BY BuildingType", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet
        If Session.Item("sqlConnection").State = ConnectionState.Open Then Session.Item("sqlConnection").Close()
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
    End Sub
End Class