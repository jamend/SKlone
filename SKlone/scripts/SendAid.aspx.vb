Imports SKlone.scripts

Partial Class SendAid
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
        UpdateList()
        UpdateMilitary()

        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateList()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT kdID, dbo.FullKingdomNameC(kdID), TroubleMode FROM Kingdoms WHERE SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        cboKingdom.Items.Clear()
        cboKingdom.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
        While SqlData1.Read
            cboKingdom.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1), SqlData1.GetInt32(0)))
        End While
        Session.Item("sqlConnection").Close()
        cboKingdom.Items.FindByValue(Session.Item("kdID")).Text &= " -- Your Kingdom"
        SqlCommand1.CommandText = "SELECT dbo.GetSL(" & Session.Item("SectorID") & ")"
        Session.Item("sqlConnection").Open()
        Try
            Dim SL As Int32 = SqlCommand1.ExecuteScalar
            If Session.Item("kdID") <> SL Then
                cboKingdom.Items.FindByValue(SL).Text &= " -- Sector Leader"
            End If
        Catch ex As Exception
        End Try
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub UpdateMilitary()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.SoldiersHome(kdID), dbo.MoneyAid(kdID), dbo.PowerAid(kdID), dbo.PopulationAid(kdID) FROM Kingdoms WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        SqlData1.Read()
        tblBuildings.Rows(1).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
        tblBuildings.Rows(2).Cells(1).Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
        tblBuildings.Rows(3).Cells(1).Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
        tblBuildings.Rows(4).Cells(1).Text = SqlData1.GetInt64(3).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdSendAid_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSendAid.Click
        Dim kdID As Object = Val(Request.Item("cboKingdom"))
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblError.Text = "You can't send aid because you are still in newbie status."
            Exit Sub
        Else
            If Request.Item("cboKingdom") = "NULL" Then
                lblError.Text = "You didn't give complete orders."
                Exit Sub
            Else
                If Session.Item("kdID") = kdID Then
                    lblError.Text = "What are you thinking? You can't send aid back to your own people!"
                    Exit Sub
                Else
                    If Val(Request.Item("txtSoldiers")) < 0 Then
                        lblError.Text = "What are you thinking? You can't send negative soldiers!"
                        Exit Sub
                    Else
                        If Val(Request.Item("txtPower")) < 0 Then
                            lblError.Text = "What are you thinking? You can't send negative power!"
                            Exit Sub
                        Else
                            If Val(Request.Item("txtPopulation")) < 0 Then
                                lblError.Text = "What are you thinking? You can't send negative population!"
                                Exit Sub
                            Else
                                If Val(Request.Item("txtMoney")) < 0 Then
                                    lblError.Text = "What are you thinking? You can't send negative money!"
                                    Exit Sub
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
        Dim UnitsToTrain As Int64 = Val(Request.Item("txtMoney")) + Val(Request.Item("txtPower")) + Val(Request.Item("txtPopulation")) + Val(Request.Item("txtSoldiers"))
        If UnitsToTrain < 0 Then
            lblError.Text = "I'm sorry, but you did not give us complete orders."
            lblError.Visible = True
        Else
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.SendAid", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = kdID
            SqlCommand1.Parameters.Add("@Soldiers", SqlDbType.Int)
            SqlCommand1.Parameters(2).Value = Val(Request.Item("txtSoldiers"))
            SqlCommand1.Parameters.Add("@Power", SqlDbType.Int)
            SqlCommand1.Parameters(3).Value = Val(Request.Item("txtPower"))
            SqlCommand1.Parameters.Add("@Money", SqlDbType.Int)
            SqlCommand1.Parameters(4).Value = Val(Request.Item("txtMoney"))
            SqlCommand1.Parameters.Add("@Population", SqlDbType.Int)
            SqlCommand1.Parameters(5).Value = Val(Request.Item("txtPopulation"))
            SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
            SqlCommand1.Parameters(6).Value = System.DateTime.Now.ToString("MMMM d")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(7).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(7).Value
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
            txtMoney.Text = ""
            txtSoldiers.Text = ""
            txtPopulation.Text = ""
            txtPower.Text = ""
            BottomInfoBar1.Refresh()
            UpdateMilitary()
        End If
        BottomInfoBar1.Refresh()
    End Sub
End Class