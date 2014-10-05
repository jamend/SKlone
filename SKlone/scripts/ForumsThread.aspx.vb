Partial Class ForumsThread
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

    Dim ThreadID As Int32

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

        ThreadID = Val(Request.Item("ThreadID"))
        Dim SL As Boolean = False
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            SL = True
            cmdDeletePosts.Visible = True
        Else
            cmdDeletePosts.Visible = False
        End If
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT dbo.SectorThreadSector(" & ThreadID & ")"
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.IsDBNull(0) Then
            pnlBadThread.Visible = True
            pnlForums.Visible = False
        Else
            If SqlData1.GetInt32(0) = Session.Item("SectorID") Then
                Session.Item("sqlConnection").Close()
                pnlBadThread.Visible = False
                pnlForums.Visible = True
                aReturn.NavigateUrl = "ForumsThread.aspx?ThreadID=" & ThreadID

                SqlCommand1.CommandText = "UPDATE SectorForumsThreads SET Views = Views + 1 WHERE ThreadID = " & ThreadID.ToString
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()

                SqlCommand1.CommandText = "SELECT SectorForumsPosts.PostID, SectorForumsPosts.PostText, dbo.FullKingdomNameD(SectorForumsPosts.Poster), Kingdoms.RulerName, SectorForumsPosts.PostDate, Kingdoms.Avatar FROM SectorForumsPosts, Kingdoms WHERE Kingdoms.kdID = SectorForumsPosts.Poster AND SectorForumsPosts.ThreadID = " & ThreadID.ToString & " ORDER BY SectorForumsPosts.PostDate"
                Session.Item("sqlConnection").Open()
                SqlData1 = SqlCommand1.ExecuteReader
                Dim x As Int32 = 0
                While SqlData1.Read()
                    tblMessages.Rows.Add(New System.Web.UI.WebControls.TableRow)
                    tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                    If SL = True Then
                        If SqlData1.IsDBNull(5) = True Then
                            tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & ">Delete"
                        Else
                            tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><img src=" & SqlData1.GetString(5) & " width=64 height=64><br><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & ">Delete<br>"
                        End If
                    End If
                    If SL = False Then
                        If SqlData1.IsDBNull(5) = True Then
                            tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br>"
                        Else
                            tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><img src=" & SqlData1.GetString(5) & " width=64 height=64>"
                        End If
                    End If
                    tblMessages.Rows(x).Cells(0).BackColor = tblMessages.Rows(x).BackColor.FromArgb(&H78424242)
                    tblMessages.Rows(x).Cells(0).VerticalAlign = VerticalAlign.Top
                    tblMessages.Rows(x).Cells(0).Width = New System.web.ui.WebControls.Unit("15%")
                    Dim MessageBody As New System.Web.UI.WebControls.Label
                    tblMessages.Rows(x).Cells(1).Text = "<pre>" & SqlData1.GetDateTime(4).ToString(DateTimeFormatString) & "</pre>" & SqlData1.GetString(1) & "<br><br><i>" & SqlData1.GetString(3) & "</i>"
                    tblMessages.Rows(x).Cells(1).Width = New System.web.ui.WebControls.Unit("85%")
                    x += 1
                End While
                Session.Item("sqlConnection").Close()
            Else
                pnlBadThread.Visible = True
                pnlForums.Visible = False
            End If
        End If
        Session.Item("sqlConnection").Close()
        pnlPosted.Visible = False
        pnlDeleted.Visible = False
        cmdReply.Attributes.Add("OnClick", "javascript:return doSubmit();")

    End Sub

    Private Sub cmdReply_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdReply.Click
        Dim Message As String = Filter(txtMessage.Text)
        If Len(Message) = 0 Then
            Response.Redirect("PostError.aspx", True)
        Else
            If Len(Message) > 1500 Then
                Response.Redirect("PostErrorB.aspx", True)
            Else
                Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO SectorForumsPosts(PostText, Poster, ThreadID) VALUES (@Message, " & Session.Item("kdID") & ", " & ThreadID & ")", Session.Item("sqlConnection"))
                SqlCommand1.Parameters.Add("@Message", Message)
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
                pnlForums.Visible = False
                pnlPosted.Visible = True
            End If
        End If
        txtMessage.Text = ""
    End Sub

    Private Sub cmdDeletePosts_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDeletePosts.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            Dim x As Int32
            For x = 0 To Request.Params.Count - 1
                SqlCommand1.CommandText = "IF dbo.SectorThreadSector(" & ThreadID & ") = " & Session.Item("SectorID") & " BEGIN DELETE FROM SectorForumsPosts WHERE ThreadID = " & ThreadID & " AND PostID = " & Val(Request.Params.Item(x)) & " END"
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