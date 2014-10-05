Partial Class KingdomChooser
    Inherits System.Web.UI.UserControl

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

    Public SectorID As Int32
    Public kdID As String
    Public Galaxy As Byte
    Public Sector As Byte


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        If txtGalaxy.Text = "" And txtSector.Text = "" Then
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT LastGalaxy, LastSector FROM AccountStatus WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.IsDBNull(0) Then
                txtGalaxy.Text = Session.Item("Galaxy")
                txtSector.Text = Session.Item("Sector")
                UpdateList(Session.Item("Galaxy"), Session.Item("Sector"))
            Else
                txtGalaxy.Text = SqlData1.GetByte(0)
                txtSector.Text = SqlData1.GetByte(1)
                UpdateList(SqlData1.GetByte(0), SqlData1.GetByte(1))
            End If
        End If
    End Sub

    Public Sub UpdateList(ByVal Galaxy As Byte, ByVal Sector As Byte)
        Me.Galaxy = Galaxy
        Me.Sector = Sector
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT SectorID FROM Sectors WHERE Galaxy = " & Galaxy & " AND Sector = " & Sector, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Close()
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        cboKingdoms.Items.Clear()
        cboKingdoms.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
        If SqlData1.HasRows = True Then
            SectorID = SqlData1.GetInt32(0)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT dbo.PercentResearched(@kdID, 9)"
            SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
            Session.Item("sqlConnection").Open()
            Dim ScouterResearch As Int32 = SqlCommand1.ExecuteScalar
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT kdID, [Name], dbo.CalcReturnTime(" & Session.Item("kdID") & ", kdID) FROM Kingdoms WHERE SectorID = " & SectorID.ToString
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader
            cboKingdoms.Items.Clear()
            cboKingdoms.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
            If ScouterResearch = 100 Then
                While SqlData1.Read
                    cboKingdoms.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1) & " -- " & SqlData1.GetByte(2) & " hours", SqlData1.GetInt32(0)))
                End While
            Else
                While SqlData1.Read
                    cboKingdoms.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1), SqlData1.GetInt32(0)))
                End While
            End If
            Session.Item("sqlConnection").Close()
            If cboKingdoms.Items.Count = 1 Then
                cboKingdoms.BackColor = System.Drawing.Color.White
                cboKingdoms.ForeColor = System.Drawing.Color.Black
            Else
                If SectorID = Session.Item("SectorID") Then
                    cboKingdoms.BackColor = System.Drawing.Color.FromArgb(&H78003300)
                    cboKingdoms.ForeColor = System.Drawing.Color.White
                    cboKingdoms.Items.FindByValue(Session.Item("kdID")).Text &= " -- Your Kingdom"
                Else
                    cboKingdoms.BackColor = System.Drawing.Color.FromArgb(&H78330000)
                    cboKingdoms.ForeColor = System.Drawing.Color.White
                End If
            End If
            Try
                cboKingdoms.Items.FindByValue(Session.Item("SelectkdID").ToString).Selected = True
            Catch
            End Try
            SqlCommand1.CommandText = "SELECT dbo.GetSL(" & SectorID.ToString & ")"
            Session.Item("sqlConnection").Open()
            Try
                Dim SL As Int32 = SqlCommand1.ExecuteScalar
                If Session.Item("kdID") <> SL Then
                    cboKingdoms.Items.FindByValue(SL).Text &= " -- Sector Leader"
                End If
            Catch ex As Exception
            End Try
            Session.Item("sqlConnection").Close()
            kdID = cboKingdoms.Items(0).Value
            SqlCommand1.CommandText = "SELECT dbo.AllianceID(" & SectorID & "), dbo.AllianceRelation(" & SectorID & ", " & Session.Item("SectorID") & "), dbo.AllianceRelationB(" & SectorID & ", " & Session.Item("SectorID") & "), dbo.AllianceName(dbo.AllianceID(" & SectorID & "))"
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.IsDBNull(0) = False Then
                lblAlliance.Text = "Alliance: <b>" & SqlData1.GetString(3) & "</b>"
                pnlAlliance.Visible = True
                Select Case SqlData1.GetInt32(1)
                    Case 0 'no relation
                        lblAlliance.ForeColor = System.Drawing.Color.FromArgb(&H78FFFFFF)
                        pnlAllianceRelation.Visible = False
                    Case 1 'war
                        pnlAllianceRelation.Visible = True
                        lblAlliance.ForeColor = System.Drawing.Color.FromArgb(&H78FF0000)
                        lblAlliance.Text &= " (War)"
                    Case 2 'peace
                        pnlAllianceRelation.Visible = True
                        lblAlliance.ForeColor = System.Drawing.Color.FromArgb(&H78FF0000)
                        lblAlliance.Text &= " (Peace)"
                    Case 3 'allies
                        pnlAllianceRelation.Visible = False
                        lblAlliance.ForeColor = System.Drawing.Color.FromArgb(&H78FF0000)
                        lblAlliance.Text &= " (You are allies)"
                    Case 4 'nap
                        lblAllianceRelation.Visible = True
                        lblAlliance.ForeColor = System.Drawing.Color.FromArgb(&H78FF0000)
                        lblAlliance.Text &= " (Nap)"
                End Select
                Select Case SqlData1.GetInt32(2)
                    Case 0 'no relation
                        pnlExternalRelation.Visible = False
                    Case 1 'war
                        pnlExternalRelation.Visible = True
                        lblExternalRelation.ForeColor = System.Drawing.Color.FromArgb(&H78FFFFFF)
                        lblExternalRelation.Text = "External relation: War"
                    Case 2 'peace
                        pnlExternalRelation.Visible = True
                        lblExternalRelation.ForeColor = System.Drawing.Color.FromArgb(&H78FFFFFF)
                        lblExternalRelation.Text = "External relation: Peace"
                    Case 3 'allies
                        pnlExternalRelation.Visible = True
                        lblExternalRelation.ForeColor = System.Drawing.Color.FromArgb(&H78FFFFFF)
                        lblExternalRelation.Text = "External relation: Allies"
                    Case 4 'nap
                        pnlExternalRelation.Visible = True
                        lblExternalRelation.ForeColor = System.Drawing.Color.FromArgb(&H78FFFFFF)
                        lblExternalRelation.Text = "External relation: Nap"
                End Select
            Else
                lblAlliance.Visible = False
            End If
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "UPDATE AccountStatus SET LastGalaxy = " & Galaxy & ", LastSector = " & Sector & " WHERE kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            SqlCommand1.ExecuteNonQuery()
        Else
            pnlAlliance.Visible = False
            lblAllianceRelation.Visible = False
            lblExternalRelation.Visible = False
        End If
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdChangeSector_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdChangeSector.Click
        UpdateList(Val(txtGalaxy.Text), Val(txtSector.Text))
    End Sub

    Private Sub cboKingdoms_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cboKingdoms.SelectedIndexChanged
        kdID = cboKingdoms.SelectedItem.Value
    End Sub
End Class