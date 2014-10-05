Partial Class UniversalForumsThread
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
    Dim PublicID As Int32

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
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT PublicID FROM Sectors WHERE SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.IsDBNull(0) Then
            pnlNoAlliance.Visible = True
            pnlForums.Visible = False
            pnlBadThread.Visible = False
        Else
            PublicID = SqlData1.GetInt32(0)
            SqlCommand1.CommandText = "SELECT dbo.PublicThreadAlliance(" & ThreadID & ")"
            Session.Item("sqlConnection").Close()
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.IsDBNull(0) Then
                pnlBadThread.Visible = True
                pnlForums.Visible = False
                pnlNoAlliance.Visible = False
            Else
                If SqlData1.GetInt32(0) = PublicID Then
                    Session.Item("sqlConnection").Close()
                    pnlBadThread.Visible = False
                    pnlForums.Visible = True
                    pnlNoAlliance.Visible = False
                    aReturn.NavigateUrl = "UniversalForumsThread.aspx?ThreadID=" & ThreadID

                    SqlCommand1.CommandText = "UPDATE PublicForumsThreads SET Views = Views + 1 WHERE ThreadID = " & ThreadID.ToString
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()

                    Dim AL As Boolean = False
                    SqlCommand1.CommandText = "SELECT AL, AAL, Dev, Hadmin, Admin, PublicName, dbo.FullKingdomNameF(AL) FROM Publics WHERE PublicID = " & PublicID
                    Session.Item("sqlConnection").Open()
                    SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                    SqlData1.Read()
                    Dim AAL As Boolean = False
                    Dim Dev As Boolean = False
                    Dim Hadmin As Boolean = False
                    Dim Admin As Boolean = False
                    If SqlData1.IsDBNull(1) = False Then If Session.Item("kdID") = SqlData1.GetInt32(1) Then AAL = True
                    If SqlData1.IsDBNull(2) = False Then If Session.Item("kdID") = SqlData1.GetInt32(2) Then Dev = True
                    If SqlData1.IsDBNull(3) = False Then If Session.Item("kdID") = SqlData1.GetInt32(3) Then Hadmin = True
                    If SqlData1.IsDBNull(4) = False Then If Session.Item("kdID") = SqlData1.GetInt32(4) Then Admin = True
                    If Session.Item("kdID") = SqlData1.GetInt32(0) Or AAL Or Dev Or Hadmin Or Admin = True Then
                        cmdDeletePosts.Visible = True
                        AL = True
                    Else
                        cmdDeletePosts.Visible = False
                    End If
                    lblPublic.Text = SqlData1.GetString(5)
                    lblAL.Text = SqlData1.GetString(6)
                    Session.Item("sqlConnection").Close()

                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "SELECT PublicForumsPosts.PostID, PublicForumsPosts.PostText, dbo.FullKingdomNameH(PublicForumsPosts.Poster), dbo.FullSirName(PublicForumsPosts.Poster), PublicForumsPosts.PostDate, Kingdoms.Avatar FROM PublicForumsPosts LEFT OUTER JOIN Kingdoms ON PublicForumsPosts.Poster = Kingdoms.kdID WHERE PublicForumsPosts.ThreadID = " & ThreadID.ToString & " ORDER BY PublicForumsPosts.PostDate"
                    Session.Item("sqlConnection").Open()
                    SqlData1 = SqlCommand1.ExecuteReader
                    Dim x As Int32 = 0
                    While SqlData1.Read()
                        tblMessages.Rows.Add(New System.Web.UI.WebControls.TableRow)
                        tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                        tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                        If AL = True Then
                            If SqlData1.IsDBNull(5) = True Then
                                tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & ">Delete"
                            Else
                                tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><img src=" & SqlData1.GetString(5) & " width=64 height=64><br><br><input type=checkbox name=" & SqlData1.GetInt32(0).ToString & " value=" & SqlData1.GetInt32(0).ToString & ">Delete<br>"
                            End If
                        End If
                        If AL = False Then
                            If SqlData1.IsDBNull(5) = True Then
                                tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br>"
                            Else
                                tblMessages.Rows(x).Cells(0).Text = "<b>" & SqlData1.GetString(2) & "</b><br><img src=" & SqlData1.GetString(5) & " width=64 height=64>"
                            End If
                        End If
                        tblMessages.Rows(x).Cells(0).BackColor = tblMessages.Rows(x).BackColor.FromArgb(&H78424242)
                        tblMessages.Rows(x).Cells(0).VerticalAlign = VerticalAlign.Top
                        tblMessages.Rows(x).Cells(0).Width = New System.Web.UI.WebControls.Unit("15%")
                        tblMessages.Rows(x).Cells(1).Text = "<pre>" & SqlData1.GetDateTime(4).ToString(DateTimeFormatString) & "</pre><br>" & SqlData1.GetString(1) & "<br><br><br><i>" & SqlData1.GetString(3) & "</i>"
                        tblMessages.Rows(x).Cells(1).Width = New System.Web.UI.WebControls.Unit("85%")
                        x += 1
                    End While
                Else
                    pnlBadThread.Visible = True
                    pnlForums.Visible = False
                    pnlNoAlliance.Visible = False
                End If
            End If
        End If
        Session.Item("sqlConnection").Close()
        pnlPosted.Visible = False
        pnlDeleted.Visible = False
        cmdReply.Attributes.Add("OnClick", "javascript:return doSubmit();")

    End Sub

    Private Sub cmdReply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdReply.Click
        cmdReply.Enabled = False
        Dim Message As String = Filter(txtMessage.Text)
        If Len(Message) = 0 Then
            Response.Redirect("PostError.aspx", True)
        Else
            If Len(Message) > 1500 Then
                Response.Redirect("PostErrorB.aspx", True)
            Else
                Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Locked FROM PublicForumsThreads WHERE ThreadID = " & ThreadID, Session.Item("sqlConnection"))
                Session.Item("sqlConnection").Open()
                Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
                SqlData1.Read()
                If SqlData1.GetByte(0) = 1 Then
                    Session.Item("sqlConnection").Close()
                    lblError.Visible = True
                    lblError.Text = "This thread has been locked by the administrators."
                Else
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "INSERT INTO PublicForumsPosts(PostText, Poster, ThreadID) VALUES (@Message, " & Session.Item("kdID") & ", " & ThreadID & ")"
                    SqlCommand1.Parameters.Add("@Message", Message)
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                    pnlForums.Visible = False
                    pnlPosted.Visible = True
                End If
            End If
        End If
        txtMessage.Text = ""
    End Sub

    Private Sub cmdDeletePosts_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDeletePosts.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AL, AAL, Dev, Hadmin, Admin FROM Publics WHERE PublicID = " & PublicID, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        Dim AAL As Boolean = False
        Dim Dev As Boolean = False
        Dim Hadmin As Boolean = False
        Dim Admin As Boolean = False
        If SqlData1.IsDBNull(1) = False Then If Session.Item("kdID") = SqlData1.GetInt32(1) Then AAL = True
        If SqlData1.IsDBNull(2) = False Then If Session.Item("kdID") = SqlData1.GetInt32(2) Then Dev = True
        If SqlData1.IsDBNull(3) = False Then If Session.Item("kdID") = SqlData1.GetInt32(3) Then Hadmin = True
        If SqlData1.IsDBNull(4) = False Then If Session.Item("kdID") = SqlData1.GetInt32(4) Then Admin = True
        If Session.Item("kdID") = SqlData1.GetInt32(0) Or AAL Or Dev Or Hadmin Or Admin = True Then
            Dim x As Int32
            For x = 0 To Request.Params.Count - 1
                SqlCommand1.CommandText = "IF dbo.PublicThreadAlliance(" & ThreadID & ") = " & PublicID & " BEGIN DELETE FROM PublicForumsPosts WHERE ThreadID = " & ThreadID & " AND PostID = " & Val(Request.Params.Item(x)) & " END"
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