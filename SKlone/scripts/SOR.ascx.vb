Partial Class SOR
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


    Public Sub Refresh()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(" & kdID & ", 8)", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        tblResearch.Rows(12).Visible = False
        tblResearch.Rows(13).Visible = False
        tblResearch.Rows(14).Visible = False
        If SqlCommand1.ExecuteScalar < 100 Then tblResearch.Rows(11).Visible = False Else tblResearch.Rows(11).Visible = True
        Session.Item("sqlConnection").Close()

        SqlCommand1.CommandText = "SELECT ResearchPercent, Points FROM Research WHERE kdID = " & kdID & " ORDER BY ResearchType"
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblResearch.Rows(x).Cells(1).Text = SqlData1.GetFloat(0) & "%"
            tblResearch.Rows(x).Cells(2).Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
            x += 1
        End While
        Session.Item("sqlConnection").Close()
        tblResearch.Style.Add("border-collapse", "asdfhsg")
    End Sub
End Class
