Namespace scripts

    Partial Class AllianceControl
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

        Public KingdomChooser1 As KingdomChooser
        Public AllianceChooser1 As AllianceChooser
        Public SectorChooser1 As SectorChooser


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
            KingdomChooser1 = LoadControl("KingdomChooser.ascx")
            PlaceHolder1.Controls.Add(KingdomChooser1)
            AllianceChooser1 = LoadControl("AllianceChooser.ascx")
            PlaceHolder2.Controls.Add(AllianceChooser1)
            lblError.Visible = False
            UpdateList()
        End Sub

        Private Sub UpdateList()
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT TOP 100 dbo.FullSectorNameC(SectorID), dbo.SectorNetworth(SectorID) AS Networth, SectorID FROM Sectors WHERE AllianceID = (SELECT AllianceID FROM Alliances WHERE AL = " & Session.Item("kdID") & ") ORDER BY Networth DESC", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
            Dim x As Int32 = 1
            While SqlData1.Read()
                tblScores.Rows.Add(New System.Web.UI.WebControls.TableRow)
                tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblScores.Rows(x).Cells(0).Text = x
                tblScores.Rows(x).Cells(1).Text = SqlData1.GetString(0)
                tblScores.Rows(x).Cells(2).Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
                tblScores.Rows(x).Cells(2).HorizontalAlign = HorizontalAlign.Center
                tblScores.Rows(x).Cells(3).Text = "<input type=checkbox name=" & SqlData1.GetInt32(2).ToString & " value=" & SqlData1.GetInt32(2).ToString & "> Boot"
                x += 1
            End While
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT AllianceMessage FROM Alliances WHERE AL = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            txtLoginMessage.Text = SqlData1.GetString(0)
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub cmdDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDelete.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Password FROM Alliances WHERE AL = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            If txtDeletePassword.Text = SqlCommand1.ExecuteScalar Then
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "dbo.deletealliance"
                SqlCommand1.CommandType = CommandType.StoredProcedure
                SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
                SqlCommand1.Parameters(0).Value = Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                lblError.Text = "Your Alliance has been successfully deleted."
                lblError.Visible = True
            Else
                Session.Item("sqlConnection").Close()
                lblError.Text = "The password you entered does not match your current password."
                lblError.Visible = True
            End If
        End Sub

        Private Sub cmdLoginMessage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLoginMessage.Click
            txtLoginMessage.Text = Filter(Request.Item("txtLoginMessage"))
            If txtLoginMessage.Text = "" Then
                lblError.Text = "Go back and fill in your alliance message then you can proceed."
                lblError.Visible = True
            Else
                Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Alliances SET AllianceMessage = @LoginMessage WHERE AL = " & Session.Item("kdID"), Session.Item("sqlConnection"))
                SqlCommand1.Parameters.Add("@LoginMessage", Filter(txtLoginMessage.Text))
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                lblError.Text = "You have changed the login message to <b>" + txtLoginMessage.Text + "</b>."
                lblError.Visible = True
                Session.Item("sqlConnection").Close()
            End If
        End Sub

        Private Sub cmdSetHelper_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSetHelper.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateHelper", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@HelperID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = KingdomChooser1.kdID
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = Session.Item("kdID")
            SqlCommand1.ExecuteNonQuery()
            lblError.Text = "Alliance helper has been set."
            lblError.Visible = True
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub cmdSectorBoot_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSectorBoot.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AL, AAL FROM Alliances WHERE AllianceID = (SELECT AllianceID FROM Alliances WHERE AL = " & Session.Item("kdID") & ")", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            Dim AAL As Boolean = False
            If SqlData1.IsDBNull(1) = False Then If Session.Item("kdID") = SqlData1.GetInt32(1) Then AAL = True
            If Session.Item("kdID") = SqlData1.GetInt32(0) Or AAL = True Then
                Dim SectorID As String
                Dim x As Int32
                For x = 0 To Request.Params.Count - 1
                    SectorID = Val(Request.Params.Item(x)).ToString
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "UPDATE Sectors SET AllianceID = 0 WHERE SectorID = " & SectorID
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                Next
                Session.Item("sqlConnection").Close()
                UpdateList()
                lblError.Text = "You have successfully booted the sectors."
                lblError.Visible = True
            End If
        End Sub

        Private Sub DeclareWar()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DeclareWar", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@AllianceID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = AllianceChooser1.AllianceID
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(2).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub DeclareNap()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DeclareNap", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@AllianceID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = AllianceChooser1.AllianceID
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(2).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub DeclareAlly()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DeclareAlly", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@AllianceID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = AllianceChooser1.AllianceID
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(2).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub DeclarePeace()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.DeclarePeace", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@AllianceID", SqlDbType.Int)
            SqlCommand1.Parameters(1).Value = AllianceChooser1.AllianceID
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(2).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub CancelPeace()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CancelPeace", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(1).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub CancelWar()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CancelWar", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(1).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub CancelAlly()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CancelAlly", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(1).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub CancelNap()
            Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CancelNap", Session.Item("sqlConnection"))
            SqlCommand1.CommandType = CommandType.StoredProcedure
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
            SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Dim Result As String = SqlCommand1.Parameters(1).Value
            lblError.Visible = True
            lblError.Text = Result
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub cmdSetRelation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSetRelation.Click
            Dim RelationType As Int32 = Val(cboRelationType.SelectedItem.Value)
            Select Case RelationType
                Case 0
                    DeclareWar()
                Case 1
                    DeclarePeace()
                Case 2
                    DeclareAlly()
                Case 3
                    DeclareNap()
            End Select
        End Sub

        Private Sub cmdCancelRelation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancelRelation.Click
            Dim RelationType As Int32 = Val(cboRelationType.SelectedItem.Value)
            Select Case RelationType
                Case 0
                    CancelWar()
                Case 1
                    CancelPeace()
                Case 2
                    CancelAlly()
                Case 3
                    CancelNap()
            End Select
        End Sub

        Private Sub cmdChangePassword_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChangePassword.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Password FROM Alliances WHERE AL = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
            SqlData1.Read()
            If txtOldPassword.Text = SqlData1.GetString(0) Then
                If Len(txtNewPassword.Text) = 0 Then
                    lblError.Text = "One of the password fields has been left blank."
                Else
                    If txtNewPassword.Text = txtConfirm.Text Then
                        Session.Item("sqlConnection").Close()
                        SqlCommand1.CommandText = "UPDATE Alliances SET Password = @Password WHERE AL = " & Session.Item("kdID")
                        SqlCommand1.Parameters.Add("@Password", txtNewPassword.Text)
                        Session.Item("sqlConnection").Open()
                        SqlCommand1.ExecuteNonQuery()
                        lblError.Text = "The current password has been changed to the password you provided. You will recieve an email shortly with the new password you entered."
                        'write email code here
                    Else
                        lblError.Text = "The new password field does not match the new password again field."
                    End If
                End If
            Else
                lblError.Text = "The password you entered does not match your current password."
            End If
            lblError.Visible = True
            Session.Item("sqlConnection").Close()
        End Sub

    End Class
End Namespace