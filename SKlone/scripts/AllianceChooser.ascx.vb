Namespace scripts
    Partial Class AllianceChooser
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

        Public AllianceChooser1 As AllianceChooser
        Public AllianceID As String


        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            UpdateList()
        End Sub

        Private Sub UpdateList()

            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT AllianceID FROM Alliances WHERE AllianceID = " & 1, Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Close()
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            cboAlliances.Items.Clear()
            Session.Item("sqlConnection").Close()
            Session.Item("sqlConnection").Open()
            cboAlliances.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
            SqlCommand1.CommandText = "SELECT AllianceID, AllianceName FROM Alliances"
            SqlData1 = SqlCommand1.ExecuteReader
            cboAlliances.Items.Clear()
            cboAlliances.Items.Add(New System.Web.UI.WebControls.ListItem("Nobody", "NULL"))
            While SqlData1.Read
                cboAlliances.Items.Add(New System.Web.UI.WebControls.ListItem(SqlData1.GetString(1), SqlData1.GetInt32(0)))
            End While
            Session.Item("sqlConnection").Close()
            If cboAlliances.Items.Count = 1 Then
                cboAlliances.BackColor = System.Drawing.Color.White
                cboAlliances.ForeColor = System.Drawing.Color.Black
            End If
            AllianceID = cboAlliances.Items(0).Value
            cboAlliances.SelectedItem.Value = AllianceID
        End Sub

        Private Sub cboAlliances_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cboAlliances.SelectedIndexChanged
            AllianceID = cboAlliances.SelectedItem.Value
        End Sub
    End Class
End Namespace