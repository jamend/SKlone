Partial Class Forums
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Form1 As System.Web.UI.HtmlControls.HtmlForm

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

        Dim SL As Boolean = False
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            cmdDeleteThreads.Visible = True
            SL = True
        Else
            cmdDeleteThreads.Visible = False
        End If
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT ThreadID, ThreadName, dbo.SectorThreadPosts(ThreadID), dbo.SectorThreadViews(ThreadID), dbo.FullKingdomNameD(dbo.SectorThreadCreator(ThreadID)), dbo.FullKingdomNameD(dbo.SectorThreadLastPoster(ThreadID)), dbo.SectorThreadLastPostDate(ThreadID) FROM SectorForumsThreads WHERE SectorID = " & Session.Item("SectorID") & " ORDER BY dbo.SectorThreadLastPostDate(ThreadID) DESC"
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read()
            tblThreads.Rows.Add(New System.Web.UI.WebControls.TableRow)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblThreads.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            If SL = True Then
                tblThreads.Rows(x).Cells(0).Text = "<a href=ForumsThread.aspx?ThreadID=" & SqlData1.GetInt32(0).ToString & ">" & SqlData1.GetString(1) & "</a><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & "> Delete Topic"
            Else
                tblThreads.Rows(x).Cells(0).Text = "<a href=ForumsThread.aspx?ThreadID=" & SqlData1.GetInt32(0).ToString & ">" & SqlData1.GetString(1) & "</a>"
            End If
            If SqlData1.GetInt32(2) <= 1 Then
                tblThreads.Rows(x).Cells(1).Text = 0
            Else
                tblThreads.Rows(x).Cells(1).Text = SqlData1.GetInt32(2) - 1
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
        Session.Item("sqlConnection").Close()

        cmdNewThread.Attributes.Add("OnClick", "javascript:return doSubmit();")
        pnlForums.Visible = True
        pnlPosted.Visible = False
        pnlDeleted.Visible = False
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
                Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO SectorForumsThreads(ThreadName, Creator, SectorID) VALUES (@ThreadName, " & Session.Item("kdID") & ", " & Session.Item("SectorID") & "); INSERT INTO SectorForumsPosts(PostText, Poster, ThreadID) VALUES (@Message, " & Session.Item("kdID") & ", @@IDENTITY)", Session.Item("sqlConnection"))
                SqlCommand1.Parameters.Add("@ThreadName", ThreadName)
                SqlCommand1.Parameters.Add("@Message", Message)
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
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            Dim ThreadID As String
            Dim x As Int32
            For x = 0 To Request.Params.Count - 1
                ThreadID = Val(Request.Params.Item(x)).ToString
                SqlCommand1.CommandText = "IF dbo.SectorThreadSector(" & ThreadID & ") = " & Session.Item("SectorID") & " BEGIN DELETE FROM SectorForumsThreads WHERE ThreadID = " & ThreadID & "; DELETE FROM SectorForumsPosts WHERE ThreadID = " & ThreadID & " END"
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