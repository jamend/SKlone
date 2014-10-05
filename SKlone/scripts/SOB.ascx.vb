Partial Class SOB
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

    Dim ConstructionStatus1 As ConstructionStatus
    Public kdID As Int32


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ConstructionStatus1 = LoadControl("ConstructionStatus.ascx")
        PlaceHolder1.Controls.Add(ConstructionStatus1)
    End Sub

    Public Sub Refresh()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT [Name] FROM Kingdoms WHERE kdID = " & kdID, Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        lblKingdomName.Text = SqlCommand1.ExecuteScalar
        Session.Item("sqlConnection").Close()
        lblDate.Text = System.DateTime.Now.ToString(DateTimeFormatString)
        ConstructionStatus1.kdID = kdID
        ConstructionStatus1.Refresh()
    End Sub
End Class
