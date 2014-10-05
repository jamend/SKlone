Imports SKlone.scripts

Partial Class Profile
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

    Dim KingdomID As Int32
    Dim BottomInfoBar1 As BottomInfoBar


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

        UpdateProfile()
        UpdateProfileB()
        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateProfile()
        KingdomID = Val(Request.Item("KingdomID"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT MemberTitle, GroupName, RealName, Location, Birth, WebSite, Occupation, Interests, Email, MSN, AIM, Yahoo, ICQNumber FROM Profiles WHERE kdID = @kdID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", KingdomID)
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.IsDBNull(2) = True Then
            lblRealName.Text = "Not Given"
        Else
            lblRealName.Text = SqlData1.GetString(2)
        End If
        If SqlData1.IsDBNull(3) = True Then
            lblLocation.Text = "Not Given"
        Else
            lblLocation.Text = SqlData1.GetString(3)
        End If
        If SqlData1.IsDBNull(4) = True Then
            lblBirth.Text = "Not Given"
        Else
            lblBirth.Text = SqlData1.GetString(4)
        End If
        If SqlData1.IsDBNull(5) = True Then
            lblWebSite.Text = "Not Given"
        Else
            lblWebSite.Text = "<a href=" & SqlData1.GetString(5) & ">" & SqlData1.GetString(5) & "</a>"
        End If
        If SqlData1.IsDBNull(6) = True Then
            lblOccupation.Text = "Not Given"
        Else
            lblOccupation.Text = SqlData1.GetString(6)
        End If
        If SqlData1.IsDBNull(7) = True Then
            lblInterests.Text = "Not Given"
        Else
            lblInterests.Text = SqlData1.GetString(7)
        End If
        If SqlData1.IsDBNull(8) = True Then
            lblEmail.Text = "Not Given"
        Else
            lblEmail.Text = SqlData1.GetString(8)
        End If
        If SqlData1.IsDBNull(9) = True Then
            lblMSM.Text = "Not Given"
        Else
            lblMSM.Text = SqlData1.GetString(9)
        End If
        If SqlData1.IsDBNull(10) = True Then
            lblAIM.Text = "Not Given"
        Else
            lblAIM.Text = SqlData1.GetString(10)
        End If
        If SqlData1.IsDBNull(11) = True Then
            lblYahoo.Text = "Not Given"
        Else
            lblYahoo.Text = SqlData1.GetString(11)
        End If
        If SqlData1.IsDBNull(12) = True Then
            lblICQNumber.Text = "Not Given"
        Else
            lblICQNumber.Text = SqlData1.GetString(12)
        End If
        lblMemberTitle.Text = SqlData1.GetString(0)
        lblGroupName.Text = SqlData1.GetString(1)
        Session.Item("sqlConnection").Close()
        If lblGroupName.Text = "Developer" Then
            lblRankPic.Text = "<img src=forum_images/5_star_rating.gif align=absmiddle>"
        End If
    End Sub

    Private Sub UpdateProfileB()
        KingdomID = Val(Request.Item("KingdomID"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Kingdoms.Name, Kingdoms.Avatar, AccountStatus.Inactive, AccountStatus.LoggedIn FROM Kingdoms, AccountStatus WHERE Kingdoms.kdID = @kdID AND AccountStatus.kdID = @kdID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", KingdomID)
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.IsDBNull(1) = True Then
            lblAvatar.Text = ""
        Else
            lblAvatar.Text = "<img src=" & SqlData1.GetString(1) & ">"
        End If
        lblKingdomName.Text = SqlData1.GetString(0)
        lblKingdomNameB.Text = SqlData1.GetString(0)
        lblAccountStatus.Text = SqlData1.GetByte(2)
        lblOnlineStatus.Text = SqlData1.GetByte(3)
        Session.Item("sqlConnection").Close()
        If lblOnlineStatus.Text = 0 Then
            lblOnlineStatus.Text = "Offline"
        Else
            lblOnlineStatus.Text = "Online"
        End If
        If lblAccountStatus.Text = 0 Then
            lblAccountStatus.Text = "Active"
        Else
            lblAccountStatus.Text = "Inactive"
        End If
    End Sub

End Class