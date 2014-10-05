Partial Class Delete
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
        If Session.Item("DeleteRedirect") = "" Then Session.Item("DeleteRedirect") = "RightFrame.aspx"
        If SKSession.DeletePending(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            pnlDeletePending.Visible = True
            Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET DeletePending = 0 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            aCancelled.NavigateUrl = Session.Item("DeleteRedirect")
        Else
            pnlDeletePending.Visible = False
        End If
        pnlConfirmed.Visible = False
        If Request.Item("action") = "confirm" Then
            If Session.Item("ConfirmDelete") = True Then
                pnlConfirm.Visible = True
                pnlCantConfirm.Visible = False
            Else
                pnlConfirm.Visible = False
                pnlCantConfirm.Visible = True
            End If
        Else
            pnlConfirm.Visible = False
            pnlCantConfirm.Visible = False
        End If
    End Sub

    Private Sub cmdConfirm_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdConfirm.Click
        If Session.Item("ConfirmDelete") = True Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET DeletePending = 1, DeleteDate = 12 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            pnlConfirm.Visible = False
            pnlConfirmed.Visible = True
        Else
            pnlCantConfirm.Visible = True
        End If
    End Sub
End Class