Namespace scripts
    Partial Class Attack
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


        Public KingdomChooser1 As KingdomChooser

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

            KingdomChooser1 = LoadControl("KingdomChooser.ascx")
            PlaceHolder1.Controls.Add(KingdomChooser1)

            lblRulerName.Text = Session.Item("RulerName")

            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(@kdID, 5), dbo.PercentResearched(@kdID, 7), dbo.PercentResearched(@kdID, 11), dbo.PercentResearched(@kdID, 12), dbo.PercentResearched(@kdID, 13)", Session.Item("sqlConnection"))
            SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
            SqlCommand1.Parameters(0).Value = Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
            SqlData1.Read()
            If SqlData1.GetByte(4) < 100 Then tblMilitary.Rows(9).Visible = False Else tblMilitary.Rows(9).Visible = True
            If SqlData1.GetByte(3) < 100 Then tblMilitary.Rows(8).Visible = False Else tblMilitary.Rows(8).Visible = True
            If SqlData1.GetByte(2) < 100 Then tblMilitary.Rows(7).Visible = False Else tblMilitary.Rows(7).Visible = True
            If SqlData1.GetByte(1) < 100 Then tblMilitary.Rows(4).Visible = False Else tblMilitary.Rows(4).Visible = True
            If SqlData1.GetByte(0) < 100 Then tblMilitary.Rows(3).Visible = False Else tblMilitary.Rows(3).Visible = True
            Session.Item("sqlConnection").Close()

            UpdateMilitary()

            lblMsg.Visible = False
            BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
            PlaceHolder2.Controls.Add(BottomInfoBar1)
        End Sub

        Private Sub UpdateMilitary()
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.UnitsHome(kdID, UnitType) FROM UnitsTraining WHERE UnitType != 3 AND UnitType != 4 AND UnitType != 7 AND kdID = " & Session.Item("kdID") & " ORDER BY dbo.UnitOrderB(UnitType)", Session.Item("sqlConnection"))
            Session.Item("sqlConnection").Open()
            Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader
            Dim x As Int32 = 1
            While SqlData1.Read
                tblMilitary.Rows(x).Cells(1).Text = SqlData1.GetInt32(0).ToString(NumberFormatString)
                x += 1
            End While
            Session.Item("sqlConnection").Close()
            SqlCommand1.CommandText = "SELECT COUNT(*) FROM WLs WHERE WLOut = 0 AND kdID = " & Session.Item("kdID")
            Session.Item("sqlConnection").Open()
            tblMilitary.Rows(10).Cells(1).Text = "Number of War Leaders to send (<b>" & SqlCommand1.ExecuteScalar & "</b> available)"
            Session.Item("sqlConnection").Close()
        End Sub

        Private Sub cmdAttack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAttack.Click
            lblMsg.Visible = True
            If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
                lblMsg.Text = "You can't attack because you are still in newbie status."
                Exit Sub
            Else
                If Session.Item("kdID") = KingdomChooser1.kdID Then
                    lblMsg.Text = "What are you thinking? You can't attack your own people!"
                    Exit Sub
                Else
                    If Val(Request.Item("txtSoldiers")) < 0 Then
                        lblMsg.Text = "What are you thinking? You don't have negative units!"
                        Exit Sub
                    Else
                        If Val(Request.Item("txtTroopers")) < 0 Then
                            lblMsg.Text = "What are you thinking? You don't have negative units!"
                            Exit Sub
                        Else
                            If Val(Request.Item("txtDragoons")) < 0 Then
                                lblMsg.Text = "What are you thinking? You don't have negative units!"
                                Exit Sub
                            Else
                                If Val(Request.Item("txtTFs")) < 0 Then
                                    lblMsg.Text = "What are you thinking? You don't have negative units!"
                                    Exit Sub
                                Else
                                    If Val(Request.Item("txtTanks")) < 0 Then
                                        lblMsg.Text = "What are you thinking? You don't have negative units!"
                                        Exit Sub
                                    Else
                                        If Val(Request.Item("txtSpecialOps")) < 0 Then
                                            lblMsg.Text = "What are you thinking? You don't have negative units!"
                                            Exit Sub
                                        Else
                                            If Val(Request.Item("txtInterceptors")) < 0 Then
                                                lblMsg.Text = "What are you thinking? You don't have negative units!"
                                                Exit Sub
                                            Else
                                                If Val(Request.Item("txtSabres")) < 0 Then
                                                    lblMsg.Text = "What are you thinking? You don't have negative units!"
                                                    Exit Sub
                                                Else
                                                    If Val(Request.Item("txtLancers")) < 0 Then
                                                        lblMsg.Text = "What are you thinking? You don't have negative units!"
                                                        Exit Sub
                                                    Else
                                                        If Val(Request.Item("txtWLs")) < 1 Then
                                                            lblMsg.Text = "You need to send out at least 1 war leader."
                                                            Exit Sub
                                                        End If
                                                    End If
                                                End If
                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
            If Val(Request.Item("txtTroopers")) + Val(Request.Item("txtDragoons")) + Val(Request.Item("txtTanks")) + Val(Request.Item("txtSpecialOps")) + Val(Request.Item("txtInterceptors")) + Val(Request.Item("txtSabres")) + Val(Request.Item("txtLancers")) + Val(Request.Item("txtTFs")) + Val(Request.Item("txtSoldiers")) < 1 Then
                lblMsg.Text = "I'm sorry, but you did not give us complete orders."
                lblMsg.Visible = True
            Else
                Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.Attack", Session.Item("sqlConnection"))
                SqlCommand1.CommandType = CommandType.StoredProcedure
                SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
                SqlCommand1.Parameters(0).Value = Session.Item("kdID")
                SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
                SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
                SqlCommand1.Parameters.Add("@WLs", SqlDbType.TinyInt)
                SqlCommand1.Parameters(2).Value = Val(Request.Item("txtWLs"))
                SqlCommand1.Parameters.Add("@Soldiers", SqlDbType.Int)
                SqlCommand1.Parameters(3).Value = Val(Request.Item("txtSoldiers"))
                SqlCommand1.Parameters.Add("@Troopers", SqlDbType.Int)
                SqlCommand1.Parameters(4).Value = Val(Request.Item("txtTroopers"))
                SqlCommand1.Parameters.Add("@Dragoons", SqlDbType.Int)
                SqlCommand1.Parameters(5).Value = Val(Request.Item("txtDragoons"))
                SqlCommand1.Parameters.Add("@Tanks", SqlDbType.Int)
                SqlCommand1.Parameters(6).Value = Val(Request.Item("txtTanks"))
                SqlCommand1.Parameters.Add("@TFs", SqlDbType.Int)
                SqlCommand1.Parameters(7).Value = Val(Request.Item("txtTFs"))
                SqlCommand1.Parameters.Add("@SpecialOps", SqlDbType.Int)
                SqlCommand1.Parameters(8).Value = Val(Request.Item("txtSpecialOps"))
                SqlCommand1.Parameters.Add("@Interceptors", SqlDbType.Int)
                SqlCommand1.Parameters(9).Value = Val(Request.Item("txtInterceptors"))
                SqlCommand1.Parameters.Add("@Sabres", SqlDbType.Int)
                SqlCommand1.Parameters(10).Value = Val(Request.Item("txtSabres"))
                SqlCommand1.Parameters.Add("@Lancers", SqlDbType.Int)
                SqlCommand1.Parameters(11).Value = Val(Request.Item("txtLancers"))
                SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
                SqlCommand1.Parameters(12).Value = System.DateTime.Now.ToString("MMMM d")
                SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 600)
                SqlCommand1.Parameters(13).Direction = ParameterDirection.Output

                Session.Item("sqlConnection").Open()
                SqlCommand1.ExecuteNonQuery()
                Dim Result As String = SqlCommand1.Parameters(13).Value
                Select Case Result
                    Case "0"
                        lblMsg.Text = "You can't attack this kingdom because you have a NAP with them."
                    Case "1"
                        lblMsg.Text = "You don't have this many war leaders to send out."
                    Case "2"
                        lblMsg.Text = "You don't have this many units to send out."
                    Case "3"
                        lblMsg.Text = "You can't attack this kingdom because it is protected by the newbie laws."
                    Case "4"
                        lblMsg.Text = "You can't attack this kingdom because it is dead."
                    Case Else
                        lblMsg.Text = Result
                End Select
                Session.Item("sqlConnection").Close()
                txtWLs.Text = "1"
                txtSoldiers.Text = ""
                txtTroopers.Text = ""
                txtDragoons.Text = ""
                txtTanks.Text = ""
                txtTFs.Text = ""
                txtSpecialOps.Text = ""
                txtInterceptors.Text = ""
                txtSabres.Text = ""
                txtLancers.Text = ""
                BottomInfoBar1.Refresh()
                UpdateMilitary()
            End If
        End Sub
    End Class
End Namespace