Partial Class CalcB
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
    End Sub

    Private Sub cmdCalc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCalc.Click
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.CalcAttack", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@WLs", SqlDbType.TinyInt)
        SqlCommand1.Parameters(0).Value = Val(Request.Item("txtWls"))
        SqlCommand1.Parameters.Add("@ASoldiers", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = Val(Request.Item("txtASoldiers"))
        SqlCommand1.Parameters.Add("@ATroopers", SqlDbType.Int)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtATroopers"))
        SqlCommand1.Parameters.Add("@ADragoons", SqlDbType.Int)
        SqlCommand1.Parameters(3).Value = Val(Request.Item("txtADragoons"))
        SqlCommand1.Parameters.Add("@ATanks", SqlDbType.Int)
        SqlCommand1.Parameters(4).Value = Val(Request.Item("txtATanks"))
        SqlCommand1.Parameters.Add("@ATFs", SqlDbType.Int)
        SqlCommand1.Parameters(5).Value = Val(Request.Item("txtATFs"))
        SqlCommand1.Parameters.Add("@ASpecialOps", SqlDbType.Int)
        SqlCommand1.Parameters(6).Value = Val(Request.Item("txtASpecialOps"))
        SqlCommand1.Parameters.Add("@AInterceptors", SqlDbType.Int)
        SqlCommand1.Parameters(7).Value = Val(Request.Item("txtAInterceptors"))
        SqlCommand1.Parameters.Add("@ASabres", SqlDbType.Int)
        SqlCommand1.Parameters(8).Value = Val(Request.Item("txtASabres"))
        SqlCommand1.Parameters.Add("@ALancers", SqlDbType.Int)
        SqlCommand1.Parameters(9).Value = Val(Request.Item("txtALancers"))
        SqlCommand1.Parameters.Add("@DSoldiers", SqlDbType.Int)
        SqlCommand1.Parameters(10).Value = Val(Request.Item("txtDSoldiers"))
        SqlCommand1.Parameters.Add("@DLTroopers", SqlDbType.Int)
        SqlCommand1.Parameters(11).Value = Val(Request.Item("txtDLTroopers"))
        SqlCommand1.Parameters.Add("@DLDragoons", SqlDbType.Int)
        SqlCommand1.Parameters(12).Value = Val(Request.Item("txtDLDragoons"))
        SqlCommand1.Parameters.Add("@DTanks", SqlDbType.Int)
        SqlCommand1.Parameters(13).Value = Val(Request.Item("txtDTanks"))
        SqlCommand1.Parameters.Add("@DTFs", SqlDbType.Int)
        SqlCommand1.Parameters(14).Value = Val(Request.Item("txtDTFs"))
        SqlCommand1.Parameters.Add("@DSpecialOps", SqlDbType.Int)
        SqlCommand1.Parameters(15).Value = Val(Request.Item("txtDSpecialOps"))
        SqlCommand1.Parameters.Add("@DInterceptors", SqlDbType.Int)
        SqlCommand1.Parameters(16).Value = Val(Request.Item("txtDInterceptors"))
        SqlCommand1.Parameters.Add("@DSabres", SqlDbType.Int)
        SqlCommand1.Parameters(17).Value = Val(Request.Item("txtDSabres"))
        SqlCommand1.Parameters.Add("@DLancers", SqlDbType.Int)
        SqlCommand1.Parameters(18).Value = Val(Request.Item("txtDLancers"))
        SqlCommand1.Parameters.Add("@APlanetType", SqlDbType.TinyInt)
        SqlCommand1.Parameters(19).Value = Val(cboAPlanet.Value)
        SqlCommand1.Parameters.Add("@ARaceType", SqlDbType.TinyInt)
        SqlCommand1.Parameters(20).Value = Val(cboARace.Value)
        SqlCommand1.Parameters.Add("@DPlanetType", SqlDbType.TinyInt)
        SqlCommand1.Parameters(21).Value = Val(cboDPlanet.Value)
        SqlCommand1.Parameters.Add("@DRaceType", SqlDbType.TinyInt)
        SqlCommand1.Parameters(22).Value = Val(cboDRace.Value)
        SqlCommand1.Parameters.Add("@DResearch", SqlDbType.Int)
        SqlCommand1.Parameters(23).Value = Val(Request.Item("txtDResearch"))
        SqlCommand1.Parameters.Add("@AResearch", SqlDbType.Int)
        SqlCommand1.Parameters(24).Value = Val(Request.Item("txtAResearch"))
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
        SqlCommand1.Parameters(25).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(25).Value
        lblerror.Text = Result
        Session.Item("sqlConnection").Close()
    End Sub

End Class