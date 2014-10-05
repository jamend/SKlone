Imports SKlone.scripts

Partial Class Missile
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents DropDownList1 As System.Web.UI.WebControls.DropDownList

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

    Public KingdomChooser1 As KingdomChooser
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

        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT dbo.PercentResearched(@kdID, 8), dbo.PercentResearched(@kdID, 10)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        If SqlData1.GetByte(1) < 100 Then cmdBuildEnergy.Visible = False Else cmdBuildEnergy.Visible = True
        If SqlData1.GetByte(0) < 100 Then cmdBuildFusion.Visible = False Else cmdBuildFusion.Visible = True
        Session.Item("sqlConnection").Close()

        KingdomChooser1 = LoadControl("KingdomChooser.ascx")
        PlaceHolder1.Controls.Add(KingdomChooser1)

        lblRulerName.Text = Session.Item("RulerName")
        'lblMsg.Visible = False
        UpdateMissiles()

        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder2.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateMissiles()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Nuclear, Fusion, Energy FROM Missiles WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblNuclear.Text = SqlData1.GetByte(0)
        lblFusion.Text = SqlData1.GetByte(1)
        lblEnergy.Text = SqlData1.GetByte(2)
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub Nuclear()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If KingdomChooser1.kdID = "NULL" Then
                lblMsg.Text = "You didn't give complete orders"
                Exit Sub
            Else
                If Session.Item("kdID") = KingdomChooser1.kdID Then
                    lblMsg.Text = "What are you thinking? You can't attack your own people!"
                    Exit Sub
                End If
            End If
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.MissileNuclear", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(2).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(3).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(3).Value
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
    End Sub

    Private Sub Fusion()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If KingdomChooser1.kdID = "NULL" Then
                lblMsg.Text = "You didn't give complete orders"
                Exit Sub
            Else
                If Session.Item("kdID") = KingdomChooser1.kdID Then
                    lblMsg.Text = "What are you thinking? You can't attack your own people!"
                    Exit Sub
                End If
            End If
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.MissileFusion", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(2).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(3).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(3).Value
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
    End Sub

    Private Sub Energy()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If KingdomChooser1.kdID = "NULL" Then
                lblMsg.Text = "You didn't give complete orders"
                Exit Sub
            Else
                If Session.Item("kdID") = KingdomChooser1.kdID Then
                    lblMsg.Text = "What are you thinking? You can't attack your own people!"
                    Exit Sub
                Else
                End If
            End If
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.MissileEnergy", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(2).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(3).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(3).Value
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
    End Sub

    Private Sub cmdBuildNuclear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBuildNuclear.Click
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't build a nuclear missile because your in newbie mode."
            Exit Sub
        Else
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.BuildNuclear", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(1).Value
        Select Case Result
            Case "0"
                lblMsg.Text = "You can't attack this kingdom because you have a NAP with them."
            Case "1"
                lblMsg.Text = "You don't have this many war leaders to send out."
            Case "2"
                lblMsg.Text = "You don't have this many units to send out."
            Case "3"
                lblMsg.Text = "You can't build a missile because you are in newbie mode."
            Case "4"
                lblMsg.Text = "You can't build a missile because you are dead."
            Case Else
                lblMsg.Text = Result
        End Select
        Session.Item("sqlConnection").Close()
        UpdateMissiles()
        BottomInfoBar1.Refresh()
    End Sub

    Private Sub cmdBuildFusion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBuildFusion.Click
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't build a fusion missile because your in newbie mode."
            Exit Sub
        Else
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.BuildFusion", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(1).Value
        Select Case Result
            Case "0"
                lblMsg.Text = "You can't attack this kingdom because you have a NAP with them."
            Case "1"
                lblMsg.Text = "You don't have this many war leaders to send out."
            Case "2"
                lblMsg.Text = "You don't have this many units to send out."
            Case "3"
                lblMsg.Text = "You can't build a missile because you are in newbie mode."
            Case "4"
                lblMsg.Text = "You can't build a missile because you are dead."
            Case Else
                lblMsg.Text = Result
        End Select
        Session.Item("sqlConnection").Close()
        UpdateMissiles()
        BottomInfoBar1.Refresh()
    End Sub

    Private Sub cmdBuildEnergy_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBuildEnergy.Click
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't build a energy missile because your in newbie mode."
            Exit Sub
        Else
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.BuildEnergy", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(1).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(1).Value
        Select Case Result
            Case "0"
                lblMsg.Text = "You can't attack this kingdom because you have a NAP with them."
            Case "1"
                lblMsg.Text = "You don't have this many war leaders to send out."
            Case "2"
                lblMsg.Text = "You don't have this many units to send out."
            Case "3"
                lblMsg.Text = "You can't build a missile because you are in newbie mode."
            Case "4"
                lblMsg.Text = "You can't build a missile because you are dead."
            Case Else
                lblMsg.Text = Result
        End Select
        Session.Item("sqlConnection").Close()
        UpdateMissiles()
        BottomInfoBar1.Refresh()
    End Sub

    Private Sub cmdMissile_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMissile.Click
        Dim MissileType As Int32 = Val(cboMissileType.SelectedItem.Value)
        Select Case MissileType
            Case 0
                Nuclear()
            Case 1
                Fusion()
            Case 2
                Energy()
        End Select
        UpdateMissiles()
        BottomInfoBar1.Refresh()
    End Sub
End Class