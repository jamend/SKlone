Namespace scripts
    Partial Class AllianceForums
        Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub
        Protected WithEvents Form2 As System.Web.UI.HtmlControls.HtmlForm

        'NOTE: The following placeholder declaration is required by the Web Form Designer.
        'Do not delete or move it.
        Private designerPlaceholderDeclaration As System.Object

        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Dim AllianceID As Int32

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

            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AllianceID FROM Sectors WHERE SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.IsDBNull(0) Or SqlData1.GetInt32(0) = 0 Then
                pnlNoAlliance.Visible = True
                pnlForums.Visible = False
            Else
                pnlNoAlliance.Visible = False
                pnlForums.Visible = True
                AllianceID = SqlData1.GetInt32(0)
                Dim AL As Boolean = False
                SqlCommand1.CommandText = "SELECT AL, AAL, AllianceName, dbo.FullKingdomNameC(AL) FROM Alliances WHERE AllianceID = " & AllianceID
                Session.Item("sqlConnection").Close()
                Session.Item("sqlConnection").Open()
                SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                SqlData1.Read()
                Dim AAL As Boolean = False
                If SqlData1.IsDBNull(1) = False Then If Session.Item("kdID") = SqlData1.GetInt32(1) Then AAL = True
                If Session.Item("kdID") = SqlData1.GetInt32(0) Or AAL = True Then
                    cmdDeleteThreads.Visible = True
                    AL = True
                Else
                    cmdDeleteThreads.Visible = False
                End If
                lblAlliance.Text = SqlData1.GetString(2)
                lblAL.Text = SqlData1.GetString(3)
                Session.Item("sqlConnection").Close()

                SqlCommand1.CommandText = "SELECT ThreadID, ThreadName, dbo.AllianceThreadPosts(ThreadID), dbo.AllianceThreadViews(ThreadID), dbo.FullKingdomNameE(dbo.AllianceThreadCreator(ThreadID)), dbo.FullKingdomNameE(dbo.AllianceThreadLastPoster(ThreadID)), dbo.AllianceThreadLastPostDate(ThreadID) FROM AllianceForumsThreads WHERE AllianceID = " & AllianceID & " ORDER BY dbo.AllianceThreadLastPostDate(ThreadID) DESC"
                Session.Item("sqlConnection").Open()
                SqlData1 = SqlCommand1.ExecuteReader
                Dim x As Int32 = 1
                While SqlData1.Read()
                    tblThreads.Rows.Add(New System.Web.UI.WebControls.TableRow)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    If AL = True Then
                        tblThreads.Rows(x).Cells(0).Text = "<a href=AllianceForumsThread.aspx?ThreadID=" & SqlData1.GetInt32(0).ToString & ">" & SqlData1.GetString(1) & "</a><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & "> Delete Topic"
                    Else
                        tblThreads.Rows(x).Cells(0).Text = "<a href=AllianceForumsThread.aspx?ThreadID=" & SqlData1.GetInt32(0).ToString & ">" & SqlData1.GetString(1) & "</a>"
                    End If
                    If SqlData1.GetInt32(2) <= 1 Then
                        tblThreads.Rows(x).Cells(1).Text = 0
                    Else
                        tblThreads.Rows(x).Cells(1).Text = (SqlData1.GetInt32(2) - 1).ToString(NumberFormatString)
                    End If
                    tblThreads.Rows(x).Cells(2).Text = SqlData1.GetInt32(3).ToString(NumberFormatString)
                    tblThreads.Rows(x).Cells(3).Text = SqlData1.GetString(4)
                    tblThreads.Rows(x).Cells(4).Text = SqlData1.GetString(5)
                    If SqlData1.IsDBNull(6) Then
                        tblThreads.Rows(x).Cells(5).Text = "&nbsp;"
                    Else
                        tblThreads.Rows(x).Cells(5).Text = SqlData1.GetDateTime(6).ToString(DateTimeFormatString)
                    End If
                    tblThreads.Rows(x).HorizontalAlign = HorizontalAlign.Center
                    tblThreads.Rows(x).Cells(0).HorizontalAlign = HorizontalAlign.Left
                    x += 1
                End While
            End If
            Session.Item("sqlConnection").Close()
            pnlPosted.Visible = False
            pnlDeleted.Visible = False

            cmdNewThread.Attributes.Add("OnClick", "javascript:return doSubmit();")
        End Sub

        Private Sub cmdNewThread_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdNewThread.Click
            Dim Message As String = Filter(txtMessage.Text)
            Dim ThreadName As String = Filter(txtThreadName.Text)
            If Len(Message) = 0 Or Len(ThreadName) = 0 Then
                Response.Redirect("PostError.aspx", True)
            Else
                If Len(Message) > 1500 Or Len(ThreadName) > 50 Then
                    Response.Redirect("PostErrorB.aspx", True)
                Else
                    Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO AllianceForumsThreads(ThreadName, Creator, AllianceID) VALUES (@ThreadName, " & Session.Item("kdID") & ", " & AllianceID & "); INSERT INTO AllianceForumsPosts(PostText, Poster, ThreadID) VALUES (@Message, " & Session.Item("kdID") & ", @@IDENTITY)", Session.Item("sqlConnection"))
                    SqlCommand1.Parameters.Add("@Message", Message)
                    SqlCommand1.Parameters.Add("@ThreadName", ThreadName)
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                    pnlForums.Visible = False
                    pnlPosted.Visible = True
                End If
            End If
            txtThreadName.Text = ""
            txtMessage.Text = ""
        End Sub

        Private Sub cmdDeleteThreads_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDeleteThreads.Click
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AL, AAL FROM Alliances WHERE AllianceID = " & AllianceID, Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            Dim AAL As Boolean = False
            If SqlData1.IsDBNull(1) = False Then If Session.Item("kdID") = SqlData1.GetInt32(1) Then AAL = True
            If Session.Item("kdID") = SqlData1.GetInt32(0) Or AAL = True Then
                Dim ThreadID As String
                Dim x As Int32
                For x = 0 To Request.Params.Count - 1
                    ThreadID = Val(Request.Params.Item(x)).ToString
                    SqlCommand1.CommandText = "IF dbo.AllianceThreadAlliance(" & ThreadID & ") = " & AllianceID & " BEGIN DELETE FROM AllianceForumsThreads WHERE ThreadID = " & ThreadID & "; DELETE FROM AllianceForumsPosts WHERE ThreadID = " & ThreadID & " END"
                    Session.Item("sqlConnection").Close()
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                Next
                Session.Item("sqlConnection").Close()
                pnlForums.Visible = False
                pnlDeleted.Visible = True
            End If
        End Sub
    End Class
End Namespace