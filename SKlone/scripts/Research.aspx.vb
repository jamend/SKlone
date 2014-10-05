Partial Class Research
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtLand As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblExplorable As System.Web.UI.WebControls.Label
    Protected WithEvents lblExploring As System.Web.UI.WebControls.Label

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
        lblMsg.Visible = False

        Dim Cancel As Int32 = Val(Request.Item("cancel"))
        If Cancel > 0 And Cancel < 12 Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Research SET Scientists = 0 WHERE ResearchType = " & Cancel - 1 & " AND kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            lblMsg.Text = "Job " & Cancel & " has been canceled, and all the scientists are now free to work on any other job."
            lblMsg.Visible = True
        End If

        UpdateResearch()
    End Sub

    Private Sub UpdateResearch()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(kdID, 8), Complete, dbo.ScientistsAvailable(kdID) FROM UnitsTraining WHERE UnitType = 7 AND kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(0) < 100 Then tblResearch.Rows(11).Visible = False Else tblResearch.Rows(11).Visible = True
        tblResearch.Rows(12).Visible = False
        tblResearch.Rows(13).Visible = False
        tblResearch.Rows(14).Visible = False
        lblScientists.Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
        lblAvailable.Text = SqlData1.GetInt32(2).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT Scientists, Points, ResearchPercent FROM Research WHERE kdID = " & Session.Item("kdID") & " ORDER BY ResearchType"
        Session.Item("sqlConnection").Open()
        SqlData1 = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblResearch.Rows(x).Cells(2).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
            tblResearch.Rows(x).Cells(3).Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
            tblResearch.Rows(x).Cells(4).Text = SqlData1.GetFloat(2) & "%"
            x += 1
        End While
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub aCancelAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles aCancelAll.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Research SET Scientists = 0 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        lblMsg.Text = "You cancel all the research jobs and all of your scientists are now free to work on any other research job."
        lblMsg.Visible = True
        UpdateResearch()
    End Sub

    Private Sub cmdResearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdResearch.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(" & Session.Item("kdID") & ", 8)", Session.Item("sqlConnection"))
        Dim EnergyCore As Boolean
        Session.Item("sqlConnection").Open()
        If SqlCommand1.ExecuteScalar < 100 Then
            EnergyCore = False
        Else
            EnergyCore = True
        End If
        Session.Item("sqlConnection").Close()
        SqlCommand1.CommandText = "SELECT dbo.ScientistsAvailable(" & Session.Item("kdID") & ")"
        Session.Item("sqlConnection").Open()
        Dim ScientistsAvailable As Int32 = SqlCommand1.ExecuteScalar
        Session.Item("sqlConnection").Close()
        Dim ScientistsTotal As Int32 = (Math.Abs(Val(Request.Item("txt1"))) + Math.Abs(Val(Request.Item("txt2"))) + Math.Abs(Val(Request.Item("txt3"))) + Math.Abs(Val(Request.Item("txt4"))) + Math.Abs(Val(Request.Item("txt5"))) + Math.Abs(Val(Request.Item("txt6"))) + Math.Abs(Val(Request.Item("txt7"))) + Math.Abs(Val(Request.Item("txt8"))) + Math.Abs(Val(Request.Item("txt9"))) + Math.Abs(Val(Request.Item("txt10"))))
        If EnergyCore = True Then ScientistsTotal += Val(Request.Item("txt11"))
        If ScientistsTotal <= 0 Then
            lblMsg.Text = "I'm sorry, but you did not give us complete orders."
        Else
            If ScientistsTotal > ScientistsAvailable Then
                lblMsg.Text = "I'm sorry, but you don't have <B>" & ScientistsTotal.ToString(NumberFormatString) & "</B> scientists available for researching."
            Else
                SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
                SqlCommand1.CommandText = _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt1"))) & " WHERE ResearchType = 0 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt2"))) & " WHERE ResearchType = 1 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt3"))) & " WHERE ResearchType = 2 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt4"))) & " WHERE ResearchType = 3 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt5"))) & " WHERE ResearchType = 4 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt6"))) & " WHERE ResearchType = 5 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt7"))) & " WHERE ResearchType = 6 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt8"))) & " WHERE ResearchType = 7 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt9"))) & " WHERE ResearchType = 8 AND kdID = @kdID; " & _
                    "UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt10"))) & " WHERE ResearchType = 9 AND kdID = @kdID"
                If EnergyCore = True Then
                    SqlCommand1.CommandText &= "; UPDATE Research SET Scientists = Scientists + " & Math.Abs(Val(Request.Item("txt11"))) & " WHERE ResearchType = 10 AND kdID = @kdID"
                End If
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
                lblMsg.Text = "You watch as your scientists begin researching."
            End If
        End If
        txt1.Text = ""
        txt2.Text = ""
        txt3.Text = ""
        txt4.Text = ""
        txt5.Text = ""
        txt6.Text = ""
        txt7.Text = ""
        txt8.Text = ""
        txt9.Text = ""
        txt10.Text = ""
        txt11.Text = ""
        lblMsg.Visible = True
        UpdateResearch()
    End Sub
End Class