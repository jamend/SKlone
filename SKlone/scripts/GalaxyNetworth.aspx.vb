Partial Class GalaxyNetworth
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

        lblRulerName.Text = Session.Item("RulerName")
        lblGalaxy.Text = Session.Item("Galaxy")

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT TOP 100 dbo.FullKingdomNameC(Kingdoms.kdID), Kingdoms.Networth FROM Kingdoms, Sectors WHERE Sectors.Galaxy = " & Session.Item("Galaxy") & " AND Kingdoms.SectorID = Sectors.SectorID ORDER BY Kingdoms.Networth DESC", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read()
            tblScores.Rows.Add(New System.Web.UI.WebControls.TableRow)
            tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblScores.Rows(x).Cells.Add(New System.Web.UI.WebControls.TableCell)
            tblScores.Rows(x).Cells(0).Text = x
            tblScores.Rows(x).Cells(1).Text = SqlData1.GetString(0)
            tblScores.Rows(x).Cells(2).Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
            tblScores.Rows(x).Cells(2).HorizontalAlign = HorizontalAlign.Center
            x += 1
        End While
        Session.Item("sqlConnection").Close()
    End Sub

End Class