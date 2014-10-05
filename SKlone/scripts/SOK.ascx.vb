Partial Class SOK
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

    Public kdID As Int32
    Public Local As Boolean

    Public Sub Refresh()
        lblDate.Text = System.DateTime.Now.ToString(DateTimeFormatString)

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Kingdoms.Population, Kingdoms.[Money], Kingdoms.[Power], Kingdoms.RaceType, Kingdoms.PlanetType, Kingdoms.Probes, Kingdoms.MA, dbo.CalcNetworth(Kingdoms.kdID), Land.Land, dbo.FullKingdomNameC(Kingdoms.kdID), Kingdoms.RulerName FROM Kingdoms, Land WHERE Land.kdID = Kingdoms.kdID AND Kingdoms.kdID = " & kdID, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblKingdomName.Text = SqlData1.GetString(9)
        lblRulerName.Text = SqlData1.GetString(10)
        lblPopulation.Text = SqlData1.GetInt64(0).ToString(NumberFormatString)
        lblMoney.Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
        lblPower.Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
        Select Case SqlData1.GetByte(4).ToString
            Case 0
                lblPlanetType.Text = "Ice Lands"
            Case 1
                lblPlanetType.Text = "Grass Lands"
            Case 2
                lblPlanetType.Text = "Astro-Station"
            Case 3
                lblPlanetType.Text = "Acidic Aura"
            Case 4
                lblPlanetType.Text = "Fire Blaze"
            Case 5
                lblPlanetType.Text = "Jagged Lava"
            Case 6
                lblPlanetType.Text = "Misty Phantom"
            Case 7
                lblPlanetType.Text = "Shadow Lands"
            Case 8
                lblPlanetType.Text = "Gaseous Waste"
            Case 9
                lblPlanetType.Text = "Dense Jungle"
        End Select
        Select Case SqlData1.GetByte(3).ToString
            Case 0
                lblRaceType.Text = "Terran"
            Case 1
                lblRaceType.Text = "Xivornai"
            Case 2
                lblRaceType.Text = "Gistrami"
            Case 3
                lblRaceType.Text = "Mafielven"
        End Select
        If Local = True Then
            lblProbes.Text = SqlData1.GetInt32(5).ToString(NumberFormatString)
        Else
            lblProbes.Text = "???"
        End If
        lblMA.Text = SqlData1.GetByte(6).ToString & "%"
        lblNetworth.Text = SqlData1.GetInt64(7).ToString(NumberFormatString)
        lblLand.Text = SqlData1.GetInt32(8).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT Complete, dbo.UnitResearched(kdID, UnitType) FROM UnitsTraining WHERE kdID = " & kdID & " ORDER BY UnitType"
        Session.Item("sqlConnection").Open()
        SqlData1 = SqlCommand1.ExecuteReader
        SqlData1.Read()
        lblSoldiers.Text = "Soldiers: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        SqlData1.Read()
        lblTroopers.Text = "Troopers: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        SqlData1.Read()
        lblDragoons.Text = "<br>Dragoons: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        If SqlData1.GetBoolean(1) = True Then
            lblDragoons.Visible = True
        Else
            lblDragoons.Visible = False
        End If
        SqlData1.Read()
        lblLTroopers.Text = "Laser Troopers: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        SqlData1.Read()
        If SqlData1.GetBoolean(1) = True Then
            lblLDragoons.Text = "<br>Laser Dragoons: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
            lblLDragoons.Visible = True
        Else
            lblLDragoons.Visible = False
        End If
        SqlData1.Read()
        lblTanks.Text = "Tanks: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        SqlData1.Read()
        If SqlData1.GetBoolean(1) = True Then
            lblTFs.Text = "<br>Tactical Fighters: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
            lblTFs.Visible = True
        Else
            lblTFs.Visible = False
        End If
        SqlData1.Read()
        If Local = True Then
            lblScientists.Text = "Scientists: <b>" & SqlData1.GetInt32(0).ToString(NumberFormatString) & "</b>"
        Else
            lblScientists.Text = "Scientists: <b>???</b>"
        End If
        Session.Item("sqlConnection").Close()
    End Sub
End Class
