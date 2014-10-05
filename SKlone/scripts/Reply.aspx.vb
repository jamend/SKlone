Partial Class Reply
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
    Dim MessageID As Int32

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

        MessageID = Val(Request.Item("MessageID"))
        If MessageID > 0 Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Messages.Message, Messages.DateSent, Kingdoms.RulerName + ' of ' + Kingdoms.Name + ' (' + CAST(Sectors.Galaxy AS nvarchar(2)) + ':' + CAST(Sectors.Sector AS nvarchar(2)) + ')', Sectors.Galaxy, Sectors.Sector, Messages.Recipient, Messages.Sender FROM Messages, Kingdoms, Sectors WHERE Kingdoms.SectorID = Sectors.SectorID AND Kingdoms.kdID = Messages.Sender AND Messages.MessageID = " & MessageID, Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
            SqlData1.Read()
            If SqlData1.HasRows = True Then
                If SqlData1.GetInt32(5) <> Session.Item("kdID") Then
                    lblSent.Visible = True
                    lblSent.Text = "You are not the recipient of the message you wanted to reply to."
                Else
                    lblSent.Visible = False
                    lblSent.Text = ""
                    txtMessage.Text = vbCrLf & vbCrLf & vbCrLf & "> In Reply to the following message:" & vbCrLf & "> " & vbCrLf & "> Received " & SqlData1.GetDateTime(1).ToString(DateTimeFormatString) & vbCrLf & "> " & vbCrLf & "> " & Replace(RevFilter(SqlData1.GetString(0)), vbCrLf, vbCrLf & "> ") & vbCrLf & "> " & vbCrLf & "> Signed " & SqlData1.GetString(2)
                    Session.Item("SelectkdID") = SqlData1.GetInt32(6)
                    KingdomChooser1.UpdateList(SqlData1.GetByte(3), SqlData1.GetByte(4))
                End If
            Else
                lblSent.Visible = True
                lblSent.Text = "The message you wanted to reply no longer exists."
            End If
            Session.Item("sqlConnection").Close()
        Else
            lblSent.Visible = True
            lblSent.Text = "You did not select a valid message to reply to."
        End If
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
    End Sub
End Class