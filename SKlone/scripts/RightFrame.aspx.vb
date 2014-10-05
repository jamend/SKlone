Partial Class RightFrame
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

    Dim SOK1 As SOK
    Dim NewNews As Boolean


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
        SOK1 = LoadControl("SOK.ascx")
        PlaceHolder1.Controls.Add(SOK1)
        SOK1.kdID = Session.Item("kdID")
        SOK1.Local = True
        SOK1.Refresh()

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT SectorMessage FROM Sectors WHERE SectorID = " & Session.Item("SectorID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        lblSectorMessage.Text = SqlCommand1.ExecuteScalar
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT AllianceID FROM Sectors WHERE SectorID = " & Session.Item("SectorID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblAlliance.Text = SqlData1.GetInt32(0)
        Session.Item("sqlConnection").Close()
        If lblAlliance.Text = 0 Then
            pnlAllianceMessage.Visible = False
        Else
            pnlAllianceMessage.Visible = True
            SqlCommand1.CommandText = "SELECT AllianceMessage FROM Alliances WHERE AllianceID = (SELECT AllianceID FROM Sectors WHERE SectorID = " & Session.Item("SectorID") & ")"
            Session.Item("sqlConnection").Open()
            lblAllianceMessage.Text = SqlCommand1.ExecuteScalar
            Session.Item("sqlConnection").Close()
        End If

        SqlCommand1.CommandText = "SELECT Count(*) FROM PersonalNews WHERE NewsRead = 0 AND kdID = " & Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim NewNews As Boolean
        If SqlCommand1.ExecuteScalar > 0 Then NewNews = True
        Session.Item("sqlConnection").Close()
        If Request.Item("action") = "OldNews" Or NewNews = True Then
            Dim SqlAdapter1 As SqlClient.SqlDataAdapter
            If NewNews = True Then
                SqlAdapter1 = New SqlClient.SqlDataAdapter("SELECT NewsDate, NewsText FROM PersonalNews WHERE NewsRead = 0 AND kdID = " & Session.Item("kdID") & " ORDER BY NewsDate", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            Else
                SqlAdapter1 = New SqlClient.SqlDataAdapter("SELECT NewsDate, NewsText FROM PersonalNews WHERE kdID = " & Session.Item("kdID") & " ORDER BY NewsDate", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
            End If
            Dim SqlDataSet1 As New Data.DataSet
            Session.Item("sqlConnection").Open()
            SqlAdapter1.Fill(SqlDataSet1)
            Session.Item("sqlConnection").Close()
            DataGrid1.DataSource = SqlDataSet1
            DataGrid1.DataBind()
            lblNoNews.Visible = False
            DataGrid1.Visible = True
            lblPreviousNews.Visible = True
            aPreviousNews.Visible = False
        Else
            lblPreviousNews.Visible = False
            aPreviousNews.Visible = True
            lblNoNews.Visible = True
            DataGrid1.Visible = False
        End If
        Dim SqlAdapter2 As SqlClient.SqlDataAdapter
        SqlAdapter2 = New SqlClient.SqlDataAdapter("SELECT NewsDate, NewsText FROM PersonalNews WHERE NewsRead = 0 AND kdID = " & Session.Item("kdID") & " ORDER BY NewsDate", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        If Request.Item("action") = "NewNews" Then
            SqlCommand1.CommandText = "UPDATE PersonalNews SET NewsRead = 1 WHERE NewsRead = 0 AND kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
            Session.Item("sqlConnection").Close()
        End If
    End Sub

End Class