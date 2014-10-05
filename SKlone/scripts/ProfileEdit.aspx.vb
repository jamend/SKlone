Partial Class ProfileEdit
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

        UpdateList()
        UpdateListB()

    End Sub

    Private Sub UpdateList()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Avatar, Name FROM Kingdoms WHERE kdID = @kdID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblKingdomName.Text = SqlData1.GetString(1)
        If SqlData1.IsDBNull(0) = True Then
            txtAvatar.Text = ""
        Else
            txtAvatar.Text = SqlData1.GetString(0)
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub UpdateListB()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT RealName, Location, Birth, WebSite, Occupation, Interests, Email, MSN, AIM, Yahoo, ICQNumber FROM Profiles WHERE kdID = @kdID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.IsDBNull(0) = True Then
            txtRealName.Text = ""
        Else
            txtRealName.Text = SqlData1.GetString(0)
        End If
        If SqlData1.IsDBNull(1) = True Then
            txtLocation.Text = ""
        Else
            txtLocation.Text = SqlData1.GetString(1)
        End If
        If SqlData1.IsDBNull(2) = True Then
            txtBirth.Text = ""
        Else
            txtBirth.Text = SqlData1.GetString(2)
        End If
        If SqlData1.IsDBNull(3) = True Then
            txtHomePage.Text = ""
        Else
            txtHomePage.Text = SqlData1.GetString(3)
        End If
        If SqlData1.IsDBNull(4) = True Then
            txtOccupation.Text = ""
        Else
            txtOccupation.Text = SqlData1.GetString(4)
        End If
        If SqlData1.IsDBNull(5) = True Then
            txtInterests.Text = ""
        Else
            txtInterests.Text = SqlData1.GetString(5)
        End If
        If SqlData1.IsDBNull(6) = True Then
            txtEmail.Text = ""
        Else
            txtEmail.Text = SqlData1.GetString(6)
        End If
        If SqlData1.IsDBNull(7) = True Then
            txtMSN.Text = ""
        Else
            txtMSN.Text = SqlData1.GetString(7)
        End If
        If SqlData1.IsDBNull(8) = True Then
            txtAIM.Text = ""
        Else
            txtAIM.Text = SqlData1.GetString(8)
        End If
        If SqlData1.IsDBNull(9) = True Then
            txtYahoo.Text = ""
        Else
            txtYahoo.Text = SqlData1.GetString(9)
        End If
        If SqlData1.IsDBNull(10) = True Then
            txtICQ.Text = ""
        Else
            txtICQ.Text = SqlData1.GetString(10)
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub UpdateProfile()
        txtRealName.Text = Filter(Request.Item("txtRealName"))
        txtOccupation.Text = Filter(Request.Item("txtOccupation"))
        txtLocation.Text = Filter(Request.Item("txtLocation"))
        txtBirth.Text = Filter(Request.Item("txtBirth"))
        txtHomePage.Text = Filter(Request.Item("txtHomePage"))
        txtInterests.Text = Filter(Request.Item("txtInterests"))
        txtEmail.Text = Filter(Request.Item("txtEmail"))
        txtMSN.Text = Filter(Request.Item("txtMSN"))
        txtAIM.Text = Filter(Request.Item("txtAIM"))
        txtYahoo.Text = Filter(Request.Item("txtYahoo"))
        txtICQ.Text = Filter(Request.Item("txtICQ"))
        If txtICQ.Text = "" Then txtICQ.Text = "Not Given"
        If txtYahoo.Text = "" Then txtYahoo.Text = "Not Given"
        If txtAIM.Text = "" Then txtAIM.Text = "Not Given"
        If txtMSN.Text = "" Then txtMSN.Text = "Not Given"
        If txtEmail.Text = "" Then txtEmail.Text = "Not Given"
        If txtInterests.Text = "" Then txtInterests.Text = "Not Given"
        If txtHomePage.Text = "" Then txtHomePage.Text = "Not Given"
        If txtBirth.Text = "" Then txtBirth.Text = "Not Given"
        If txtLocation.Text = "" Then txtLocation.Text = "Not Given"
        If txtOccupation.Text = "" Then txtOccupation.Text = "Not Given"
        If txtRealName.Text = "" Then txtRealName.Text = "Not Given"
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Profiles SET RealName = @RealName, Location = @Location, Birth = @Birth, WebSite = @HomePage, Occupation = @Occupation, Interests = @Interests, Email = @Email, MSN = @MSN, AIM = @AIM, Yahoo = @Yahoo, ICQNumber = @ICQ WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@RealName", Filter(txtRealName.Text))
        SqlCommand1.Parameters.Add("@Occupation", Filter(txtOccupation.Text))
        SqlCommand1.Parameters.Add("@Location", Filter(txtLocation.Text))
        SqlCommand1.Parameters.Add("@Birth", Filter(txtBirth.Text))
        SqlCommand1.Parameters.Add("@HomePage", Filter(txtHomePage.Text))
        SqlCommand1.Parameters.Add("@Interests", Filter(txtInterests.Text))
        SqlCommand1.Parameters.Add("@Email", Filter(txtEmail.Text))
        SqlCommand1.Parameters.Add("@MSN", Filter(txtMSN.Text))
        SqlCommand1.Parameters.Add("@AIM", Filter(txtAIM.Text))
        SqlCommand1.Parameters.Add("@Yahoo", Filter(txtYahoo.Text))
        SqlCommand1.Parameters.Add("@ICQ", Filter(txtICQ.Text))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub UpdateProfileB()
        txtAvatar.Text = Filter(Request.Item("txtAvatar"))
        If txtAvatar.Text = "" Then txtAvatar.Text = "NoAvatar"
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.UpdateAvatar", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Avatar", SqlDbType.NVarChar, 100)
        SqlCommand1.Parameters(1).Value = Filter(txtAvatar.Text)
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(2).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(2).Value
        lblError.Text = Result
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdUpdate.Click
        UpdateProfile()
        UpdateProfileB()
    End Sub

End Class
