Imports SKlone.scripts

Partial Class Military
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

    Dim BottomInfoBar1 As BottomInfoBar


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

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(@kdID, 5), dbo.PercentResearched(@kdID, 6), dbo.PercentResearched(@kdID, 7), dbo.PercentResearched(@kdID, 11), dbo.PercentResearched(@kdID, 12), dbo.PercentResearched(@kdID, 13)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(1) < 100 Then tblMilitary.Rows(2).Visible = False Else tblMilitary.Rows(2).Visible = True
        If SqlData1.GetByte(0) < 100 Then tblMilitary.Rows(4).Visible = False Else tblMilitary.Rows(4).Visible = True
        If SqlData1.GetByte(2) < 100 Then tblMilitary.Rows(5).Visible = False Else tblMilitary.Rows(5).Visible = True
        If SqlData1.GetByte(3) < 100 Then tblMilitary.Rows(9).Visible = False Else tblMilitary.Rows(9).Visible = True
        If SqlData1.GetByte(4) < 100 Then tblMilitary.Rows(10).Visible = False Else tblMilitary.Rows(10).Visible = True
        If SqlData1.GetByte(5) < 100 Then tblMilitary.Rows(11).Visible = False Else tblMilitary.Rows(11).Visible = True
        Session.Item("sqlConnection").Close()

        UpdateMilitary()

        pnlMilitaryUnits.Visible = False
        pnlSoldiers.Visible = False

        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder1.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateMilitary()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Complete, dbo.Training(kdID, UnitType), dbo.UnitCost(kdID, UnitType), dbo.UnitsTrainable(kdID, UnitType) FROM UnitsTraining WHERE UnitType != 0 AND kdID = " & Session.Item("kdID") & " ORDER BY dbo.UnitOrderB(UnitType)", Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
        Dim x As Int32 = 1
        While SqlData1.Read
            tblMilitary.Rows(x).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
            tblMilitary.Rows(x).Cells(2).Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
            tblMilitary.Rows(x).Cells(3).Text = SqlData1.GetInt32(2).ToString(NumberFormatString)
            tblMilitary.Rows(x).Cells(4).Text = SqlData1.GetInt32(3).ToString(NumberFormatString)
            x += 1
        End While
        Session.Item("sqlConnection").Close()
        SqlCommand1.CommandText = "SELECT dbo.SoldiersTraining(@kdID), dbo.SoldiersTrainable(@kdID), dbo.SoldiersHome(@kdID), Complete FROM UnitsTraining WHERE UnitType = 0 AND kdID = @kdID"
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        SqlData1 = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblSoldiersTraining.Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
        lblSoldiersMax.Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
        lblSoldiers.Text = SqlData1.GetInt32(2).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()

    End Sub

    Private Sub cmdMobolize_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMobolize.Click
        Dim UnitsToTrain As Int64 = Math.Abs(Val(Request.Item("txtLTroopers"))) + Math.Abs(Val(Request.Item("txtLDragoons"))) + Math.Abs(Val(Request.Item("txtTroopers"))) + Math.Abs(Val(Request.Item("txtDragoons"))) + Math.Abs(Val(Request.Item("txtTanks"))) + Math.Abs(Val(Request.Item("txtScientists"))) + Math.Abs(Val(Request.Item("txtSpecialOps"))) + Math.Abs(Val(Request.Item("txtInterceptors"))) + Math.Abs(Val(Request.Item("txtSabres"))) + Math.Abs(Val(Request.Item("txtLancers")))
        If UnitsToTrain + Math.Abs(Val(Request.Item("txtTFs"))) < 0 Then
            lblError.Text = "I'm sorry, but you did not give us complete orders."
            lblError.Visible = True
        Else
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Complete FROM UnitsTraining WHERE UnitType = 0 AND kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            If UnitsToTrain > lblSoldiers.Text Then
                lblError.Text = "I'm sorry but we do not have <b>" & UnitsToTrain.ToString(NumberFormatString) & " soldiers</b> to train into the armies you requested."
                GoTo trainerror
            Else
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "SELECT (dbo.UnitCost(kdID, 1) * " & Math.Abs(Val(Request.Item("txtTroopers"))) & ") + (dbo.UnitCost(kdID, 2) * " & Math.Abs(Val(Request.Item("txtDragoons"))) & ") + (dbo.UnitCost(kdID, 3) * " & Math.Abs(Val(Request.Item("txtLTroopers"))) & ") + (dbo.UnitCost(kdID, 4) * " & Math.Abs(Val(Request.Item("txtLDragoons"))) & ") + (dbo.UnitCost(kdID, 5) * " & Math.Abs(Val(Request.Item("txtTanks"))) & ") + (dbo.UnitCost(kdID, 6) * " & Math.Abs(Val(Request.Item("txtTFs"))) & ") + (dbo.UnitCost(kdID, 8) * " & Math.Abs(Val(Request.Item("txtSpecialOps"))) & ") + (dbo.UnitCost(kdID, 9) * " & Math.Abs(Val(Request.Item("txtInterceptors"))) & ") + (dbo.UnitCost(kdID, 10) * " & Math.Abs(Val(Request.Item("txtSabres"))) & ") + (dbo.UnitCost(kdID, 11) * " & Math.Abs(Val(Request.Item("txtLancers"))) & ") + (dbo.UnitCost(kdID, 7) * " & Math.Abs(Val(Request.Item("txtScientists"))) & ") FROM UnitsTraining WHERE kdID = " & Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                Dim Cost As Int64 = SqlCommand1.ExecuteScalar
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "SELECT [Money] FROM Kingdoms WHERE kdID = " & Session.Item("kdID")
                Session.Item("sqlConnection").Open()
                If Cost > SqlCommand1.ExecuteScalar Then
                    lblError.Text = "I'm sorry but we do not have enough money. The drafting you requested would cost <b>" & Cost.ToString(NumberFormatString) & " money</b>."
                    GoTo trainerror
                Else
                    Session.Item("sqlConnection").Close()
                    SqlCommand1.Parameters.Add("@kdID", Session.Item("kdID"))
                    SqlCommand1.CommandText = _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtTroopers"))) & ", 1; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtDragoons"))) & ", 2; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtLTroopers"))) & ", 3; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtLDragoons"))) & ", 4; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtTanks"))) & ", 5; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtTFs"))) & ", 6; " & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtScientists"))) & ", 7;" & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtSpecialOps"))) & ", 8;" & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtInterceptors"))) & ", 9;" & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtSabres"))) & ", 10;" & _
                        "EXEC dbo.Train @kdID, " & Math.Abs(Val(Request.Item("txtLancers"))) & ", 11"
                    Session.Item("sqlConnection").Open()
                    SqlCommand1.ExecuteNonQuery()
                    Session.Item("sqlConnection").Close()
                    UpdateMobilization()
                    pnlMilitaryUnits.Visible = True
                    UpdateMilitary()
                    txtLTroopers.Text = ""
                    txtTroopers.Text = ""
                    txtDragoons.Text = ""
                    txtLDragoons.Text = ""
                    txtTanks.Text = ""
                    txtTFs.Text = ""
                    txtSpecialOps.Text = ""
                    txtInterceptors.Text = ""
                    txtSabres.Text = ""
                    txtScientists.Text = ""
                    txtLancers.Text = ""
                    BottomInfoBar1.Refresh()
                    Exit Sub
                End If
            End If
trainerror:
            Session.Item("sqlConnection").Close()
            lblError.Visible = True
        End If
    End Sub

    Private Sub cmdTrain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTrain.Click
        Dim Soldiers As Int32 = Val(txtSoldiers.Text)
        If Soldiers < 1 Then
            lblError.Text = "I'm sorry, but you did not give us complete orders."
            lblError.Visible = True
        Else
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.SoldiersTrainable(" & Session.Item("kdID") & ")", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim Trainable As Int32 = SqlCommand1.ExecuteScalar
            If Soldiers > Trainable Then
                Session.Item("sqlConnection").Close()
                lblError.Text = "I'm sorry, you have requested to train <b>" & Soldiers.ToString(NumberFormatString) & " soldiers</b>. But we can only train a maximum of <b>" & Trainable.ToString(NumberFormatString) & " soldiers</b>."
                lblError.Visible = True
            Else
                Session.Item("sqlConnection").Close()
                SqlCommand1.CommandText = "EXEC dbo.Train " & Session.Item("kdID") & ", " & Soldiers & ", 0"
                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Session.Item("sqlConnection").Close()
                UpdateSoldiers()
                pnlSoldiers.Visible = True
            End If
        End If
        UpdateMilitary()
        txtSoldiers.Text = ""
    End Sub

    Private Sub UpdateMobilization()
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT dbo.UnitName(UnitType) AS UnitName, Training0 AS [1], Training1 AS [2], Training2 AS [3], Training3 AS [4], Training4 AS [5], Training5 AS [6], Training6 AS [7], Training7 AS [8], Training8 AS [9], Training9 AS [10], Training10 AS [11], Training11 AS [12], Training12 AS [13], Training13 AS [14], Training14 AS [15], Training15 AS [16], Training16 AS [17], Training17 AS [18], Training18 AS [19], Training19 AS [20], Training20 AS [21], Training21 AS [22], Training22 AS [23], Training23 AS [24] FROM UnitsTraining WHERE kdID = " & Session.Item("kdID") & " AND UnitType != 0 AND dbo.UnitResearched(kdID, UnitType) = 1 ORDER BY dbo.UnitOrder(UnitType)", New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet()
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        DataGrid1.DataSource = SqlDataSet1
        DataGrid1.DataBind()
    End Sub

    Private Sub UpdateSoldiers()
        Dim SqlAdapter1 As New SqlClient.SqlDataAdapter("SELECT Training0 AS [<b>1</b>], Training1 AS [<b>2</b>], Training2 AS [<b>3</b>], Training3 AS [<b>4</b>], Training4 AS [<b>5</b>], Training5 AS [<b>6</b>], Training6 AS [<b>7</b>], Training7 AS [<b>8</b>], Training8 AS [<b>9</b>], Training9 AS [<b>10</b>], Training10 AS [<b>11</b>], Training11 AS [<b>12</b>], Training12 AS [<b>13</b>], Training13 AS [<b>14</b>], Training14 AS [<b>15</b>], Training15 AS [<b>16</b>], Training16 AS [<b>17</b>], Training17 AS [<b>18</b>], Training18 AS [<b>19</b>], Training19 AS [<b>20</b>], Training20 AS [<b>21</b>], Training21 AS [<b>22</b>], Training22 AS [<b>23</b>], Training23 AS [<b>24</b>] FROM UnitsTraining WHERE UnitType = 0 AND kdID = " & Session.Item("kdID"), New SqlClient.SqlConnection(Session.Item("sqlConnectionStr")))
        Dim SqlDataSet1 As New Data.DataSet()
        Session.Item("sqlConnection").Open()
        SqlAdapter1.Fill(SqlDataSet1)
        Session.Item("sqlConnection").Close()
        DataGrid2.DataSource = SqlDataSet1
        DataGrid2.DataBind()
    End Sub
End Class