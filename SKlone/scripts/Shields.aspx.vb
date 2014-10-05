Partial Class Shields
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

        lblMsg.Visible = False
        pnlNoPower.Visible = False
        UpdateShields()
    End Sub

    Private Sub UpdateShields()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT MilitaryPercent, MilitaryUsage, MissilePercent, MissileUsage, PowerUsage FROM Shields WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        txtPower.Text = SqlData1.GetInt32(4).ToString
        txtMilUsage.Text = SqlData1.GetByte(1).ToString
        txtMisUsage.Text = SqlData1.GetByte(3).ToString
        lblMilShields.Text = SqlData1.GetByte(0).ToString
        lblMisShields.Text = SqlData1.GetByte(2).ToString
        Session.Item("sqlConnection").Close()
        SqlCommand1.CommandText = "SELECT Power FROM Kingdoms WHERE kdID = " & Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        If SqlCommand1.ExecuteScalar <= 0 Then pnlNoPower.Visible = True Else pnlNoPower.Visible = False
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub cmdSetPower_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSetPower.Click
        Dim Power As Int32 = Val(Request.Item("txtPower"))
        txtPower.Text = Power
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Shields SET PowerUsage = " & Power & " WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        lblMsg.Text = "The amount of power converted to shields have been changed to <b>" & Power.ToString(NumberFormatString) & " power/hour</b>. The effectivness of the shields will not change until the next hour."
        lblMsg.Visible = True
        UpdateShields()
    End Sub

    Private Sub cmdSetUsage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSetUsage.Click
        Dim MilUsage As Int32 = Val(Request.Item("txtMilUsage"))
        Dim MisUsage As Int32 = Val(Request.Item("txtMisUsage"))
        txtMilUsage.Text = MilUsage
        txtMisUsage.Text = MisUsage
        If MilUsage > 100 Then MilUsage = 100
        If MilUsage + MisUsage > 100 Then MisUsage = 100 - MisUsage
        Dim SqlCommand1 As New SqlClient.SqlCommand("UPDATE Shields SET MilitaryUsage = " & MilUsage & ", MissileUsage = " & MisUsage & " WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
        UpdateShields()
        lblMsg.Text = "The shield percent usage levels have been updated. The effectiveness of the shields will not change until the next hour."
        lblMsg.Visible = True
    End Sub
End Class