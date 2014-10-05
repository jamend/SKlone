Namespace scripts
    Partial Class Alliances
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents Button1 As System.Web.UI.WebControls.Button

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

            tblAlliances.Rows(0).Cells(0).Controls.Add(pnlSL)
            tblAlliances.Rows(1).Cells(0).Controls.Add(pnlCreate)
            tblAlliances.Rows(2).Cells(0).Controls.Add(pnlAccess)

            Dim SqlCommand2 As New SqlClient.SqlCommand("SELECT AllianceID FROM Sectors WHERE SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim InAlliance As Boolean
            Dim SqlData2 As SqlClient.SqlDataReader = SqlCommand2.ExecuteReader
            SqlData2.Read()
            If SqlData2.GetInt32(0) = 0 Then
                InAlliance = False
                pnlAllianceInfo.Visible = False
                lblCurrentAlliance.Text = "Your sector is currently not in an alliance. Only your sector leader can join an alliance."
            Else
                Session.Item("sqlConnection").Close()
                Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Alliances.AllianceID, Alliances.AllianceName FROM Sectors, Alliances WHERE Alliances.AllianceID = Sectors.AllianceID AND Sectors.SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
                Session.Item("sqlConnection").Open()
                Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
                SqlData1.Read()
                InAlliance = True
                pnlAllianceInfo.Visible = True
                lblCurrentAlliance.Text = "Your sector is currently in the <b>" & SqlData1.GetString(1) & "</b> alliance."
                aInfo.Text = "View the " & SqlData1.GetString(1) & " alliance information screen."
                aInfo.NavigateUrl = "AllianceInfo.aspx?AllianceID=" & SqlData1.GetInt32(0)
                aSectors.Text = "View a list of the sectors involved in the " & SqlData1.GetString(1) & " alliance."
                aSectors.NavigateUrl = "AllianceSectors.aspx?AllianceID=" & SqlData1.GetInt32(0)
                aForums.Text = "Enter the " & SqlData1.GetString(1) & " alliance forums."
            End If
            Session.Item("sqlConnection").Close()

            SqlCommand2.CommandText = "SELECT dbo.GetSL(" & Session.Item("SectorID") & ")"
            Session.Item("sqlConnection").Open()
            If Session.Item("kdID") = SqlCommand2.ExecuteScalar Then
                tblAlliances.Rows(0).Visible = True
                If InAlliance = False Then
                    pnlLeave.Visible = False
                    pnlJoin.Visible = True
                Else
                    pnlLeave.Visible = True
                    pnlJoin.Visible = False
                End If
            Else
                tblAlliances.Rows(0).Visible = False
            End If
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub cmdLeave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLeave.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
                lblError.Visible = False
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "UPDATE Sectors SET AllianceID = 0, AllianceWait = 12 WHERE SectorID = " & Session.Item("SectorID")
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                lblError.Text = "You can't join another alliance for <b>12</b> hours."
            Else
                lblError.Text = "You're not the sector leader"
                lblError.Visible = True
            End If
            Session.Item("sqlConnection").Close()
            Response.Redirect("Alliances.aspx", True)
        End Sub

        Private Sub cmdJoin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdJoin.Click
            If Filter(txtAllianceName.Text) = "" Then
                lblError.Visible = True
                lblError.Text = "You didn't give complete orders."
            Else
                If Filter(txtAlliancePassword.Text) = "" Then
                    lblError.Visible = True
                    lblError.Text = "You didn't give complete orders."
                Else
                    Dim SqlCommand2 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
                    Session.Item("sqlConnection").Open()
                    If Session.Item("kdID") = SqlCommand2.ExecuteScalar Then
                        lblError.Visible = False
                        Session.Item("sqlConnection").Close()
                        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.JoinAlliance", Session.Item("sqlConnection"))
                        SqlCommand1.CommandType = CommandType.StoredProcedure
                        SqlCommand1.Parameters.Add("@SectorID", SqlDbType.Int)
                        SqlCommand1.Parameters(0).Value = Session.Item("SectorID")
                        SqlCommand1.Parameters.Add("@AllianceName", SqlDbType.NVarChar, 16)
                        SqlCommand1.Parameters(1).Value = Filter(txtAllianceName.Text)
                        SqlCommand1.Parameters.Add("@AlliancePassword", SqlDbType.NVarChar, 16)
                        SqlCommand1.Parameters(2).Value = Filter(txtAlliancePassword.Text)
                        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
                        SqlCommand1.Parameters(3).Direction = ParameterDirection.Output

                        Session.Item("sqlConnection").Open()
                        SqlCommand1.ExecuteNonQuery()
                        Dim Result As String = SqlCommand1.Parameters(3).Value
                        Select Case Result
                            Case "0"
                                lblError.Text = "You can't attack this kingdom because you have a NAP with them."
                            Case "1"
                                lblError.Text = "You don't have this many war leaders to send out."
                            Case "2"
                                lblError.Text = "You don't have this many units to send out."
                            Case "3"
                                lblError.Text = "You can't attack this kingdom because it is protected by the newbie laws."
                            Case "4"
                                lblError.Text = "You can't attack this kingdom because it is dead."
                            Case Else
                                lblError.Text = Result
                        End Select
                        lblError.Visible = True
                        Session.Item("sqlConnection").Close()
                    Else
                        lblError.Text = "You're not the sector leader"
                        lblError.Visible = True
                    End If
                End If
            End If
        End Sub

        Private Sub cmdCreate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCreate.Click
            If Filter(txtCreateName.Text) = "" Then
                lblError.Visible = True
                lblError.Text = "You didn't give complete orders."
            Else
                If Filter(txtCreatePassword.Text) = "" Then
                    lblError.Visible = True
                    lblError.Text = "You didn't give complete orders."
                Else
                    Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.MakeAlliance", Session.Item("sqlConnection"))
                    SqlCommand1.CommandType = CommandType.StoredProcedure
                    SqlCommand1.Parameters.Add("@AllianceName", SqlDbType.NVarChar, 16)
                    SqlCommand1.Parameters(0).Value = Filter(txtCreateName.Text)
                    SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
                    SqlCommand1.Parameters(1).Value = Session.Item("kdID")
                    SqlCommand1.Parameters.Add("@Password", SqlDbType.NVarChar, 16)
                    SqlCommand1.Parameters(2).Value = Filter(txtCreatePassword.Text)
                    SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
                    SqlCommand1.Parameters(3).Direction = ParameterDirection.Output
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Dim Result As String = SqlCommand1.Parameters(3).Value
                    lblError.Visible = True
                    lblError.Text = Result
                    Session.Item("sqlConnection").Close()
                    txtCreateName.Text = ""
                    txtCreatePassword.Text = ""
                End If
            End If
        End Sub

        Private Sub cmdAccess_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAccess.Click
            If Filter(txtAccessName.Text) = "" Then
                lblError.Visible = True
                lblError.Text = "You must enter an alliance name."
                Exit Sub
            End If
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.AccessControl", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@AllianceName", SqlDbType.NVarChar, 16)
            SqlCommand1.Parameters(0).Value = Filter(txtAccessName.Text)
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
            SqlCommand1.Parameters.Add("@Success", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(3).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(2).Value
            lblError.Visible = True
            lblError.Text = Result
            Dim Success As String = SqlCommand1.Parameters(3).Value
            lblSuccess.Text = Success
            Session.Item("sqlConnection").Close()
            If lblSuccess.Text = "Failed" Then
                Response.Redirect("Alliances.aspx", True)
            End If
            If lblSuccess.Text = "Success" Then
                Response.Redirect("Alliancecontrol.aspx", True)
            End If

        End Sub

    End Class
End Namespace