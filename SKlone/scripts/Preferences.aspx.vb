Partial Class Preferences
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

        lblError.Visible = False
    End Sub

    Private Sub cmdDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdDelete.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Password FROM Accounts WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If txtDeletePassword.Text = SqlCommand1.ExecuteScalar Then
            Session.Item("sqlConnection").Close()
            Session.Item("ConfirmDelete") = True
            Response.Redirect("Delete.aspx?action=confirm", True)
        Else
            Session.Item("sqlConnection").Close()
            lblError.Text = "The password you entered does not match your current password."
            lblError.Visible = True
        End If
    End Sub

    Private Sub cmdChangePassword_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChangePassword.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Password FROM Accounts WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        SqlData1.Read()
        If txtOldPassword.Text = SqlData1.GetString(0) Then
            If Len(txtNewPassword.Text) = 0 Then
                lblError.Text = "One of the password fields has been left blank."
            Else
                If txtNewPassword.Text = txtConfirm.Text Then
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.CommandText = "UPDATE Accounts SET Password = @Password WHERE kdID = " & Session.Item("kdID")
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

    Private Sub cmdVacationMode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdVacationMode.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE AccountStatus SET VacationPending = 1, VacationStart = 24, VacationMode = 48, VacationEnd = 264 WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        Response.Redirect("Vacation.aspx?action=entered", True)
    End Sub
End Class