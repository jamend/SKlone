Partial Class Msg
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

        UpdateMessages()
    End Sub

    Private Sub UpdateMessages()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Messages.Message, Messages.DateSent, Kingdoms.RulerName + ' of ' + dbo.FullKingdomNameC(Messages.Sender), Messages.MessageID FROM Messages, Kingdoms WHERE Kingdoms.kdID = Messages.Sender AND Messages.Recipient = " & Session.Item("kdID") & " ORDER BY Messages.DateSent", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        If SqlData1.HasRows = True Then
            lblNoMessages.Visible = False
            tblMessages.Rows.Clear()
            Dim x As Int32 = 0
            While SqlData1.Read()
                tblMessages.Rows.Add(New System.Web.UI.WebControls.TableRow)
                tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblMessages.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
                tblMessages.Rows(x).Cells(0).Text = "<b>Received " & SqlData1.GetDateTime(1).ToString(DateTimeFormatString) & "</b><br><br>" & SqlData1.GetString(0) & "<br><br><i>Signed " & SqlData1.GetString(2) & "</i>"
                tblMessages.Rows(x).Cells(1).Text = "<input type=checkbox name=" & SqlData1.GetInt32(3).ToString & " value=" & SqlData1.GetInt32(3).ToString & ">Delete<br><br><a href=Reply.aspx?MessageID=" & SqlData1.GetInt32(3).ToString & ">Reply</a>"
                tblMessages.Rows(x).Cells(1).HorizontalAlign = HorizontalAlign.Center
                x += 1
            End While
            Session.Item("sqlConnection").Close()

            SqlCommand1.CommandText = "UPDATE Messages SET MessageRead = 1 WHERE MessageRead = 0 AND Recipient = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteScalar
            tblMessages.Visible = True
        Else
            lblNoMessages.Visible = True
            tblMessages.Visible = False
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdDeleteSelected_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDeleteSelected.Click
        Dim x As Int32
        Dim SqlCommand1 As New SqlClient.SqlCommand("", Session.Item("sqlConnection"))
        For x = 0 To Request.Params.Count - 1
            SqlCommand1.CommandText = "DELETE FROM Messages WHERE MessageID = " & Val(Request.Params.Item(x)).ToString & " AND Recipient = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
        Next
        UpdateMessages()
    End Sub

    Private Sub aDeleteAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles aDeleteAll.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("DELETE FROM Messages WHERE Recipient = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        UpdateMessages()
    End Sub
End Class