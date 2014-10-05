Imports SKlone.scripts

Partial Class Disband
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

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(@kdID, 5), dbo.PercentResearched(@kdID, 6), dbo.PercentResearched(@kdID, 7), dbo.PercentResearched(@kdID, 11), dbo.PercentResearched(@kdID, 12), dbo.PercentResearched(@kdID, 13)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(1) < 100 Then tblMilitary.Rows(2).Visible = False Else tblMilitary.Rows(2).Visible = True
        If SqlData1.GetByte(0) < 100 Then tblMilitary.Rows(4).Visible = False Else tblMilitary.Rows(4).Visible = True
        If SqlData1.GetByte(2) < 100 Then tblMilitary.Rows(5).Visible = False Else tblMilitary.Rows(5).Visible = True
        If SqlData1.GetByte(3) < 100 Then tblMilitary.Rows(9).Visible = False Else tblMilitary.Rows(9).Visible = True
        If SqlData1.GetByte(4) < 100 Then tblMilitary.Rows(10).Visible = False Else tblMilitary.Rows(10).Visible = True
        If SqlData1.GetByte(5) < 100 Then tblMilitary.Rows(11).Visible = False Else tblMilitary.Rows(11).Visible = True
        Session.Item("sqlConnection").Close()

        UpdateMilitary()

        pnlStatus.Visible = False
        pnlError.Visible = False

        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateMilitary()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Complete FROM UnitsTraining WHERE UnitType != 0 AND kdID = " & Session.Item("kdID") & " ORDER BY dbo.UnitOrderB(UnitType)", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblMilitary.Rows(x).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
            x += 1
        End While
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdDisband_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDisband.Click
        If Math.Abs(Val(Request.Item("txtLTroopers"))) + Math.Abs(Val(Request.Item("txtLDragoons"))) + Math.Abs(Val(Request.Item("txtTroopers"))) + Math.Abs(Val(Request.Item("txtDragoons"))) + Math.Abs(Val(Request.Item("txtTFs"))) + Math.Abs(Val(Request.Item("txtTanks"))) + Math.Abs(Val(Request.Item("txtScientists"))) + Math.Abs(Val(Request.Item("txtSpecialOps"))) + Math.Abs(Val(Request.Item("txtInterceptor"))) + Math.Abs(Val(Request.Item("txtSabres"))) + Math.Abs(Val(Request.Item("txtLancers"))) <= 0 Then
            lblError.Text = "I'm sorry, but you did not give us complete orders."
            pnlError.Visible = True
        Else
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT SUM(Complete) FROM UnitsTraining WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim TotalUnits As Int32 = SqlCommand1.ExecuteScalar
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT dbo.Disbandable(" & Session.Item("kdID") & ", 7)"
            Session.Item("sqlConnection").Open()
            If Val(Request.Item("txtScientists")) > SqlCommand1.ExecuteScalar Then
                lblError.Text = "You don't have that many scientists to disband. Please remove them from their projects and then disband them."
                Session.Item("sqlConnection").Close()
                pnlError.Visible = True
            Else
                Session.Item("sqlConnection").Close()
                SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
                SqlCommand1.Parameters(0).Value = Session.Item("kdID")
                SqlCommand1.CommandText = _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtTroopers"))) & ", 1; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtDragoons"))) & ", 2; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtLTroopers"))) & ", 3; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtLDragoons"))) & ", 4; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtTanks"))) & ", 5; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtTFs"))) & ", 6; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtScientists"))) & ", 7; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtSpecialOps"))) & ", 8; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtInterceptors"))) & ", 9; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtSabres"))) & ", 10; " & _
                    "EXEC dbo.Disband @kdID, " & Math.Abs(Val(Request.Item("txtLancers"))) & ", 11"
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "SELECT SUM(Complete) FROM UnitsTraining WHERE kdID = " & Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                Dim Disbanded As Int32 = TotalUnits - SqlCommand1.ExecuteScalar
                Session.Item("sqlConnection").Close()
                If Disbanded = 0 Then
                    lblError.Text = "I'm sorry, but you did not give us complete orders."
                    pnlError.Visible = True
                    pnlStatus.Visible = False
                Else
                    lblDisbanded.Text = Disbanded.ToString(NumberFormatString)
                    pnlError.Visible = False
                    pnlStatus.Visible = True
                End If
            End If
        End If
        txtLTroopers.Text = ""
        txtTroopers.Text = ""
        txtDragoons.Text = ""
        txtLDragoons.Text = ""
        txtTanks.Text = ""
        txtTFs.Text = ""
        txtSpecialOps.Text = ""
        txtInterceptors.Text = ""
        txtSabres.Text = ""
        txtScientists.Text = ""
        txtLancers.Text = ""
        UpdateMilitary()
        BottomInfoBar1.Refresh()
    End Sub

End Class