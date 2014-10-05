Partial Class Vacation
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

    Dim VacationID As Int32

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
        If Session.Item("VacationRedirect") = "" Then Session.Item("VacationRedirect") = "RightFrame.aspx"
        VacationID = Val(Request.Item("Vacation"))
        If SKSession.VacationMode(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationMode FROM AccountStatus WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            lblVacationMode.Text = SqlCommand1.ExecuteScalar()
            Session.Item("sqlConnection").Close()
            If Request.Item("action") = "mode" Then
                pnlEntered.Visible = False
                pnlPending.Visible = False
                pnlError.Visible = False
                pnlVacationMode.Visible = True
                pnlVacationEnd.Visible = False
                lblVacationMode.Visible = True
            End If
        End If
        If SKSession.VacationEnd(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationEnd FROM AccountStatus WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            lblVacationEnd.Text = SqlCommand1.ExecuteScalar()
            Session.Item("sqlConnection").Close()
            If Request.Item("action") = "end" Then
                pnlEntered.Visible = False
                pnlPending.Visible = False
                pnlError.Visible = False
                pnlVacationMode.Visible = False
                pnlVacationEnd.Visible = True
                lblVacationEnd.Visible = True
            End If
        End If
        If SKSession.VacationPending(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            If Request.Item("action") = "entered" Then
                Session.Abandon()
                pnlEntered.Visible = True
                pnlPending.Visible = False
                pnlError.Visible = False
            Else
                Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationStart FROM AccountStatus WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
                Session.Item("sqlConnection").Open()
                lblPending.Text = SqlCommand1.ExecuteScalar()
                Session.Item("sqlConnection").Close()
                pnlEntered.Visible = False
                pnlPending.Visible = True
                pnlError.Visible = False
            End If
        Else
            pnlEntered.Visible = False
            pnlPending.Visible = False
            pnlError.Visible = False
        End If
    End Sub

    Private Sub cmdLeave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLeave.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET VacationPending = 0, VacationStart = 0, VacationMode = 0, VacationEnd = 0, Vacation = 0 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        Session.Item("Cancelled") = True
        Response.Redirect(Session.Item("VacationRedirect"), True)
    End Sub

    Private Sub cmdEndVacation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdEndVacation.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET VacationPending = 0, VacationStart = 0, VacationMode = 0, VacationEnd = 0, Vacation = 0 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        Session.Item("Cancelled") = True
        Response.Redirect(Session.Item("VacationRedirect"), True)
    End Sub

End Class