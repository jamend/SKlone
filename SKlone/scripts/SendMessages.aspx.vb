Partial Class SendMessages
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtLand As System.Web.UI.WebControls.TextBox
    Protected WithEvents cmdExplore As System.Web.UI.WebControls.Button
    Protected WithEvents lblExplorable As System.Web.UI.WebControls.Label
    Protected WithEvents lblExploring As System.Web.UI.WebControls.Label

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

        Session.Item("SelectkdID") = 0
        KingdomChooser1 = LoadControl("KingdomChooser.ascx")
        PlaceHolder1.Controls.Add(KingdomChooser1)
        lblSent.Visible = False
    End Sub

    Private Sub cmdSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSend.Click
        If KingdomChooser1.kdID = "NULL" Then
            lblSent.Text = "I'm sorry my elite ruler, but you did not choose someone for us to send a message probe to."
        Else
            Dim Message As String = Filter(txtMessage.Text)
            If Len(Message) = 0 Then
                lblSent.Text = "We could not send the probe, for your message did not contain any data."
            Else
                If Len(Message) > 1500 Then
                    lblSent.Text = "Alas, we can not send the probe, for even our most advanced probes can only support 1500 bytes if they are to go into hyperspace. The current size is " & Len(Message) & " bytes. Please refine the message."
                Else
                    Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.SendMessage", Session.Item("sqlConnection"))
                    SqlCommand1.CommandType = CommandType.StoredProcedure
                    SqlCommand1.Parameters.Add(New SqlClient.SqlParameter("@Message", Message))
                    SqlCommand1.Parameters.Add(New SqlClient.SqlParameter("@Recipient", Val(KingdomChooser1.kdID)))
                    SqlCommand1.Parameters.Add(New SqlClient.SqlParameter("@Sender", Session.Item("kdID")))
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                    lblSent.Text = "You watch the message probe head towards the hypergate leading to Galaxy " & KingdomChooser1.Galaxy & ": Sector " & KingdomChooser1.Sector
                End If
            End If
        End If
        lblSent.Visible = True
        txtMessage.Text = ""
    End Sub
End Class