Partial Class SectorChooser
    Inherits System.Web.UI.UserControl

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents txtSector As System.Web.UI.WebControls.TextBox
    Protected WithEvents cmdChangeSector As System.Web.UI.WebControls.Button
    Protected WithEvents lblExternalRelation As System.Web.UI.WebControls.Label
    Protected WithEvents lblAlliance As System.Web.UI.WebControls.Label
    Protected WithEvents pnlAlliance As System.Web.UI.WebControls.Panel
    Protected WithEvents lblAllianceRelation As System.Web.UI.WebControls.Label
    Protected WithEvents pnlAllianceRelation As System.Web.UI.WebControls.Panel
    Protected WithEvents pnlExternalRelation As System.Web.UI.WebControls.Panel

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Public SectorChooser1 As SectorChooser
    Public SectorID As String
    Public AllianceID As String
    Public kdID As Int32


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        UpdateList()
    End Sub

    Private Sub UpdateList()
        kdID = Session.Item("kdID")
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AllianceID FROM Alliances WHERE AL = @kdID", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", kdID)
        Session.Item("sqlConnection").Close()
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        cboSectors.Items.Clear()
        cboSectors.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
        If SqlData1.HasRows = True Then
            AllianceID = SqlData1.GetInt32(0)
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT SectorID, GalaxySector FROM Sectors WHERE AllianceID = " & AllianceID.ToString
            Session.Item("sqlConnection").Open()
            SqlData1 = SqlCommand1.ExecuteReader
            cboSectors.Items.Clear()
            cboSectors.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
            While SqlData1.Read
                cboSectors.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1), SqlData1.GetInt32(0)))
            End While
            Session.Item("sqlConnection").Close()
            If cboSectors.Items.Count = 1 Then
                cboSectors.BackColor = System.Drawing.Color.White
                cboSectors.ForeColor = System.Drawing.Color.Black
            End If
            SectorID = cboSectors.Items(0).Value
        End If
    End Sub

    Private Sub cboSectors_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        SectorID = cboSectors.SelectedItem.Value
    End Sub
End Class