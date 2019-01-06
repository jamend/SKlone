Partial Class MySector
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

        If txtGalaxy.Text = "" And txtSector.Text = "" Then
            txtGalaxy.Text = Session.Item("Galaxy").ToString
            txtSector.Text = Session.Item("Sector").ToString
            BrowseSector(Session.Item("Galaxy"), Session.Item("Sector"))
        End If

    End Sub

    Private Sub cmdBrowse_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBrowse.Click
        BrowseSector(Val(txtGalaxy.Text), Val(txtSector.Text))
    End Sub

    Private Sub BrowseSector(ByVal Galaxy As Byte, ByVal Sector As Byte)
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT SectorID, dbo.GetSL(SectorID), dbo.SectorNetworth(SectorID), dbo.FullSectorNameB(SectorID), SectorOpen FROM Sectors WHERE Galaxy = " & Galaxy & " AND Sector = " & Sector, Session.Item("sqlConnection"))
        Dim SectorID As Int32
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        If SqlData1.HasRows = True Then
            SqlData1.Read()
            If SqlData1.GetByte(4) = 0 Then
                pnlSector.Visible = False
                lblError.Text = "There is no sector " & Sector & " in galaxy " & Galaxy
            Else
                SectorID = SqlData1.GetInt32(0)
                pnlSector.Visible = True
                lblError.Text = ""
                Dim SL As Int32 = 0
                If Not SqlData1.IsDBNull(1) Then
                    SL = SqlData1.GetInt32(1)
                End If
                If SqlData1.IsDBNull(2) Then
                    lblNetworth.Text = "0"
                Else
                    lblNetworth.Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
                End If
                lblSectorName.Text = SqlData1.GetString(3)
                If SL = Session.Item("kdID") And SectorID = Session.Item("SectorID") Then
                    SqlCommand1.CommandText = "SELECT dbo.SectorMemberColour(kdID, SectorID, " & Session.Item("kdID") & "), dbo.FullKingdomStatus(kdID, SectorID, " & Session.Item("kdID") & ") AS Status, dbo.FullKingdomNameB(kdID, SectorID, " & Session.Item("kdID") & ") AS KingdomName, dbo.PlanetTypeName(PlanetType) AS PlanetType, dbo.KingdomLand(kdID) AS Land, dbo.CalcNetworth(kdID) AS Networth, dbo.RaceTypeName(RaceType) AS RaceType, SectorOrder FROM Kingdoms WHERE SectorID = " & SectorID & " ORDER BY SectorOrder"
                Else
                    SqlCommand1.CommandText = "SELECT dbo.SectorMemberColour(kdID, SectorID, " & Session.Item("kdID") & "), dbo.FullKingdomStatus(kdID, SectorID, " & Session.Item("kdID") & ") AS Status, dbo.FullKingdomNameA(kdID, SectorID, " & Session.Item("kdID") & ") AS KingdomName, dbo.PlanetTypeName(PlanetType) AS PlanetType, dbo.KingdomLand(kdID) AS Land, dbo.CalcNetworth(kdID) AS Networth, dbo.RaceTypeName(RaceType) AS RaceType, SectorOrder FROM Kingdoms WHERE SectorID = " & SectorID & " ORDER BY SectorOrder"
                End If
                Dim SqlAdapter1 As New SqlClient.SqlDataAdapter(SqlCommand1)
                Dim SqlDataSet1 As New Data.DataSet
                Session.Item("sqlConnection").Close()
                Session.Item("sqlConnection").Open()
                SqlAdapter1.Fill(SqlDataSet1)
                DataGrid1.DataSource = SqlDataSet1
                DataGrid1.DataBind()
                Dim x As Byte
                If DataGrid1.Items.Count > 0 Then
                    For x = 0 To DataGrid1.Items.Count - 1
                        DataGrid1.Items(x).Style.Add("color", SqlDataSet1.Tables(0).Rows(x).Item(0))
                    Next
                End If
            End If
        Else
            pnlSector.Visible = False
            lblError.Text = "There is no sector " & Sector & " in galaxy " & Galaxy
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub aRight_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles aRight.Click
        Dim Galaxy As Byte = Val(txtGalaxy.Text)
        Dim Sector As Byte = Val(txtSector.Text)
        If Sector >= 40 Then
            Galaxy += 1
            Sector = 1
        Else
            Sector += 1
        End If
        txtGalaxy.Text = Galaxy
        txtSector.Text = Sector
        BrowseSector(Galaxy, Sector)
    End Sub

    Private Sub aLeft_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles aLeft.Click
        Dim Galaxy As Byte = Val(txtGalaxy.Text)
        Dim Sector As Byte = Val(txtSector.Text)
        If Sector <= 1 Then
            If Galaxy > 1 Then Galaxy -= 1 : Sector = 40
        Else
            Sector -= 1
        End If
        txtGalaxy.Text = Galaxy
        txtSector.Text = Sector
        BrowseSector(Galaxy, Sector)
    End Sub
End Class