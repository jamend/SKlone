Namespace scripts
    Partial Class AllianceInfo
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
            If SKSession.VacationPending(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
                Session.Item("VacationRedirect") = Request.RawUrl
                Response.Redirect("Vacation.aspx", True)
            End If

            Dim AllianceID As Int32 = Val(Request.Item("AllianceID"))
            lblRulerName.Text = Session.Item("RulerName")
            pnlAlliance.Visible = False
            lblError.Text = ""
            If AllianceID = 0 Then
                lblError.Text = "Alliance not found."
                Response.End()
            End If
            pnlAlliance.Visible = True
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Rank, Networth, AverageNetworth, dbo.SectorCount(AllianceID), AllianceName FROM Alliances WHERE AllianceID = " & AllianceID, Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.HasRows = False Then
                lblError.Text = "Alliance not found."
            Else
                lblRank.Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
                lblNetworth.Text = SqlData1.GetInt64(1).ToString(NumberFormatString)
                lblAverageNetworth.Text() = SqlData1.GetInt64(2).ToString(NumberFormatString)
                lblSectors.Text() = SqlData1.GetInt32(3).ToString(NumberFormatString)
                lblAllianceName1.Text() = SqlData1.GetString(4)
                lblAllianceName2.Text() = SqlData1.GetString(4)
                Session.Item("sqlConnection").Close()

                Session.Item("sqlConnection").Open()
                SqlCommand1.CommandText = "SELECT  dbo.AllianceName(War),  dbo.AllianceName(Peace) FROM Alliances WHERE AllianceID = " & AllianceID
                SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                SqlData1.Read()
                If SqlData1.IsDBNull(0) = True Then
                    lblWar.Text = "None"
                Else
                    lblWar.Text = SqlData1.GetString(0)
                End If
                If SqlData1.IsDBNull(1) Then
                    lblPeace.Text = "None"
                Else
                    lblPeace.Text = SqlData1.GetString(1)
                End If
                Session.Item("sqlConnection").Close()

                Session.Item("sqlConnection").Open()
                SqlCommand1.CommandText = "SELECT  dbo.AllianceName(NAP) FROM Alliances WHERE AllianceID = " & AllianceID
                SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                SqlData1.Read()
                If SqlData1.IsDBNull(0) = True Then
                    lblNAP.Text = "None"
                Else
                    lblNAP.Text = SqlData1.GetString(0)
                End If
                While SqlData1.Read
                    lblNAP.Text &= SqlData1.GetString(0)
                End While
                Session.Item("sqlConnection").Close()

                Session.Item("sqlConnection").Open()
                SqlCommand1.CommandText = "SELECT  dbo.AllianceName(Allie) FROM Alliances WHERE AllianceID = " & AllianceID
                SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
                SqlData1.Read()
                If SqlData1.IsDBNull(0) = True Then
                    lblAllies.Text = "None"
                Else
                    lblAllies.Text = SqlData1.GetString(0)
                End If
                While SqlData1.Read
                    lblAllies.Text &= SqlData1.GetString(0)
                End While
            End If
            Session.Item("sqlConnection").Close()
        End Sub

    End Class
End Namespace