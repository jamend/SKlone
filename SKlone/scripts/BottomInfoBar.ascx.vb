Partial Class BottomInfoBar
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


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Refresh()
    End Sub

    Public Sub Refresh()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Population, Money, Power, dbo.CalcNetworth(kdID) FROM Kingdoms WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblPopulation.Text = SqlData1.GetInt64(0).ToString(NumberFormatString)
        lblMoney.Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
        lblPower.Text = SqlData1.GetInt64(2).ToString(NumberFormatString)
        lblNetworth.Text = SqlData1.GetInt64(3).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()
    End Sub

End Class