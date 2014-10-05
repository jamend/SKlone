Partial Class Politics
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtGalaxy As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtSector As System.Web.UI.WebControls.TextBox
    Protected WithEvents cmdBrowse As System.Web.UI.WebControls.Button
    Protected WithEvents lblNetworth As System.Web.UI.WebControls.Label
    Protected WithEvents lblSectorName As System.Web.UI.WebControls.Label
    Protected WithEvents aAlliance As System.Web.UI.WebControls.HyperLink

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

        lblRulerName.Text = Session.Item("RulerName")
        pnlChangeVote.Visible = False
        UpdateList()
    End Sub

    Private Sub UpdateList()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Vote, dbo.FullKingdomNameC(Vote) FROM Kingdoms WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        Dim CurrentVote As Int32
        If SqlData1.IsDBNull(0) Then
            CurrentVote = 0
            lblCurrentVote.Text = "Nobody"
        Else
            CurrentVote = SqlData1.GetInt32(0)
            lblCurrentVote.Text = SqlData1.GetString(1)
        End If
        Session.Item("sqlConnection").Close()
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.FullKingdomNameC(kdID) AS [Kingdom Name], dbo.FullKingdomNameC(Vote) AS [Voting for], dbo.VotesB(kdID) AS [Votes received], dbo.IsSL(kdID, SectorID) AS [&nbsp;] FROM Kingdoms WHERE SectorID = " & Session.Item("SectorID"), New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
        SqlCommand1.CommandText = "SELECT kdID, dbo.FullKingdomNameC(kdID) FROM Kingdoms WHERE SectorID = " & Session.Item("SectorID")
        Session.Item("sqlConnection").Open()
        SqlData1 = SqlCommand1.ExecuteReader
        cboVote.Items.Clear()
        cboVote.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
        While SqlData1.Read
            cboVote.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1), SqlData1.GetInt32(0)))
        End While
        Session.Item("sqlConnection").Close()
        If CurrentVote <> 0 Then
            Try
                cboVote.SelectedValue = CurrentVote.ToString
            Catch ex As Exception
                cboVote.SelectedValue = Session.Item("kdID")
                SqlCommand1.CommandText = "UPDATE Kingdoms SET Vote = NULL WHERE kdID = " & Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
            End Try
        End If
        SqlCommand1.CommandText = "SELECT dbo.GetSL(" & Session.Item("SectorID") & ")"
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            pnlSectorLeader.Visible = True
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT SectorName, SectorMessage FROM Sectors WHERE SectorID = " & Session.Item("SectorID")
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            txtSectorName.Text = SqlData1.GetString(0)
            txtLoginMessage.Text = SqlData1.GetString(1)
        Else
            pnlSectorLeader.Visible = False
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdChangeVote_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChangeVote.Click
        Dim VoteFor As Object = Val(Request.Item("cboVote"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT kdID FROM Kingdoms WHERE SectorID = " & Session.Item("SectorID") & " AND kdID = " & VoteFor, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If SqlCommand1.ExecuteReader(CommandBehavior.SingleRow).HasRows = True Or Request.Item("cboVote") = "NULL" Then
            Session.Item("sqlConnection").Close()
            If Request.Item("cboVote") = "NULL" Then VoteFor = "NULL"
            SqlCommand1.CommandText = "UPDATE Kingdoms SET Vote = " & VoteFor & " WHERE kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT dbo.FullKingdomNameC(Vote) FROM Kingdoms WHERE kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            lblNewVote.Text = SqlCommand1.ExecuteScalar
            lblError.Text = ""
            pnlChangeVote.Visible = True
        Else
            lblError.Text = "The kingdom you tried to vote for does not exist in your sector."
        End If
        Session.Item("sqlConnection").Close()
        UpdateList()
    End Sub

    Private Sub cmdSectorName_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSectorName.Click
        txtSectorName.Text = Filter(Request.Item("txtSectorName"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            pnlSectorLeader.Visible = True
            lblError.Text = ""
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "UPDATE Sectors SET SectorName = @SectorName WHERE SectorID = " & Session.Item("SectorID")
            SqlCommand1.Parameters.Add("@SectorName", Filter(txtSectorName.Text))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            lblMsg.Text = "You have changed the sector name to <b>" + txtSectorName.Text + "</b>."
        Else
            pnlSectorLeader.Visible = False
            lblError.Text = "You're not the sector leader"
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdLoginMessage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLoginMessage.Click
        txtLoginMessage.Text = Filter(Request.Item("txtLoginMessage"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            pnlSectorLeader.Visible = True
            lblError.Text = ""
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "UPDATE Sectors SET SectorMessage = @LoginMessage WHERE SectorID = " & Session.Item("SectorID")
            SqlCommand1.Parameters.Add("@LoginMessage", Filter(txtLoginMessage.Text))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            lblMsg.Text = "You have changed the login message to <b>" + txtLoginMessage.Text + "</b>."
        Else
            pnlSectorLeader.Visible = False
            lblError.Text = "You're not the sector leader"
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdPassword_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdPassword.Click
        txtGroupPassword.Text = Filter(Request.Item("txtGroupPassword"))
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.GetSL(" & Session.Item("SectorID") & ")", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        If Session.Item("kdID") = SqlCommand1.ExecuteScalar Then
            pnlSectorLeader.Visible = True
            lblError.Text = ""
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "UPDATE Sectors SET GroupPassword = @GroupPassword WHERE SectorID = " & Session.Item("SectorID")
            SqlCommand1.Parameters.Add("@GroupPassword", Filter(txtGroupPassword.Text))
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            lblMsg.Text = "You have changed the Sector Password to <b>" + txtGroupPassword.Text + "</b>."
        Else
            pnlSectorLeader.Visible = False
            lblError.Text = "You're not the sector leader"
        End If
        Session.Item("sqlConnection").Close()
    End Sub

End Class