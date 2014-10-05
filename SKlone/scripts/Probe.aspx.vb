Imports SKlone.scripts

Partial Class Probe
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

    Dim SOK1 As SOK
    Dim SOM1 As SOM
    Dim SOB1 As SOB
    Dim SOR1 As SOR

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

        KingdomChooser1 = LoadControl("KingdomChooser.ascx")
        PlaceHolder1.Controls.Add(KingdomChooser1)

        lblRulerName.Text = Session.Item("RulerName")
        'lblMsg.Visible = False
        UpdateProbes()

        SOK1 = LoadControl("SOK.ascx")
        SOM1 = LoadControl("SOM.ascx")
        SOB1 = LoadControl("SOB.ascx")
        SOR1 = LoadControl("SOR.ascx")

        BottomInfoBar1 = LoadControl("BottomInfoBar.ascx")
        PlaceHolder2.Controls.Add(BottomInfoBar1)
    End Sub

    Private Sub UpdateProbes()
        Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT ProbeTurns, Probes FROM Kingdoms WHERE kdID = " & Session.Item("kdID"), Session.Item("sqlConnection"))
        Session.Item("sqlConnection").Open()
        Dim SqlData1 As SqlClient.SqlDataReader = SqlCommand1.ExecuteReader(CommandBehavior.SingleRow)
        SqlData1.Read()
        lblProbeTurns.Text = SqlData1.GetByte(0)
        lblProbes.Text = SqlData1.GetInt32(1).ToString(NumberFormatString)
        Session.Item("sqlConnection").Close()
    End Sub

    Private Sub ProbeRobB()
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
                    If Val(Request.Item("txtProbes")) <= 0 Then
                        lblMsg.Text = "You didn't give complete orders."
                        Exit Sub
                    End If
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbeRobB", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbeRob()
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
                    If Val(Request.Item("txtProbes")) <= 0 Then
                        lblMsg.Text = "You didn't give complete orders."
                        Exit Sub
                    End If
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbeRob", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbePowerB()
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
                    If Val(Request.Item("txtProbes")) <= 0 Then
                        lblMsg.Text = "You didn't give complete orders."
                        Exit Sub
                    End If
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbePowerB", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbePower()
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
                    If Val(Request.Item("txtProbes")) <= 0 Then
                        lblMsg.Text = "You didn't give complete orders."
                        Exit Sub
                    End If
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbePower", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbePopB()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbePopB", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbePop()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbePop", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbeArsonB()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbeArsonB", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbeArson()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbeArson", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Result As String = SqlCommand1.Parameters(4).Value
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

    Private Sub ProbingB()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.ProbingB", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Success", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(5).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Success As String = SqlCommand1.Parameters(4).Value
        Select Case Success
            Case "0"
                lblSuccess.Text = "You can't attack this kingdom because you have a NAP with them."
            Case "1"
                lblSuccess.Text = "You don't have this many war leaders to send out."
            Case "2"
                lblSuccess.Text = "You don't have this many units to send out."
            Case "3"
                lblSuccess.Text = "You can't attack this kingdom because it is protected by the newbie laws."
            Case "4"
                lblSuccess.Text = "You can't attack this kingdom because it is dead."
            Case Else
                lblSuccess.Text = Success
        End Select
        Dim Result As String = SqlCommand1.Parameters(5).Value
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


    Private Sub Probing()
        If SKSession.Newbie(Session.Item("kdID"), Session.Item("sqlConnection")) = True Then
            lblMsg.Text = "You can't attack because you are still in newbie status."
            Exit Sub
        Else
            If Session.Item("kdID") = KingdomChooser1.kdID Then
                lblMsg.Text = "What are you thinking? You can't attack your own people!"
                Exit Sub
            Else
                If Val(Request.Item("txtProbes")) <= 0 Then
                    lblMsg.Text = "You didn't give complete orders."
                    Exit Sub
                End If
            End If
        End If
        If Val(Request.Item("txtProbes")) > lblProbes.Text Then
            txtProbes.Text = lblProbes.Text
        End If
        Dim SqlCommand1 As New SqlClient.SqlCommand("dbo.Probing", Session.Item("sqlConnection"))
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.CommandType = CommandType.StoredProcedure
        SqlCommand1.Parameters.Add("@Attacker", SqlDbType.Int)
        SqlCommand1.Parameters(0).Value = Session.Item("kdID")
        SqlCommand1.Parameters.Add("@Defender", SqlDbType.Int)
        SqlCommand1.Parameters(1).Value = KingdomChooser1.kdID
        SqlCommand1.Parameters.Add("@Probes", SqlDbType.BigInt)
        SqlCommand1.Parameters(2).Value = Val(Request.Item("txtProbes"))
        SqlCommand1.Parameters.Add("@SKDate", SqlDbType.NVarChar, 24)
        SqlCommand1.Parameters(3).Value = System.DateTime.Now.ToString("MMMM d")
        SqlCommand1.Parameters.Add("@Success", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(4).Direction = ParameterDirection.Output
        SqlCommand1.Parameters.Add("@Result", SqlDbType.NVarChar, 512)
        SqlCommand1.Parameters(5).Direction = ParameterDirection.Output
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Dim Success As String = SqlCommand1.Parameters(4).Value
        Select Case Success
            Case "0"
                lblSuccess.Text = "You can't attack this kingdom because you have a NAP with them."
            Case "1"
                lblSuccess.Text = "You don't have this many war leaders to send out."
            Case "2"
                lblSuccess.Text = "You don't have this many units to send out."
            Case "3"
                lblSuccess.Text = "You can't attack this kingdom because it is protected by the newbie laws."
            Case "4"
                lblSuccess.Text = "You can't attack this kingdom because it is dead."
            Case Else
                lblSuccess.Text = Success
        End Select
        Dim Result As String = SqlCommand1.Parameters(5).Value
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

    Private Sub cmdProbe_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdProbe.Click
        If KingdomChooser1.kdID = "NULL" Then
            lblMsg.Text = "You didn't give complete orders"
            Exit Sub
        Else
            If lblProbeTurns.Text = "0" Then
                lblMsg.Text = "You don't have any probe turns left."
                Exit Sub
            Else
                If Val(txtProbes.Text) < 1 Then
                    lblMsg.Text = "You must send at least 1 probe."
                    Exit Sub
                End If
            End If
        End If
        If chkShield.Checked = True Then
            Dim ProbeType As Int32 = Val(cboProbeType.SelectedItem.Value)
            Select Case ProbeType
                Case 0
                    ProbingB()
                    If lblSuccess.Text = "Success" Then
                        plcResult.Controls.Add(SOK1)
                        SOK1.kdID = KingdomChooser1.kdID
                        SOK1.Local = False
                        SOK1.Refresh()
                    End If
                Case 1
                    ProbingB()
                    If lblSuccess.Text = "Success" Then
                        plcResult.Controls.Add(SOM1)
                        SOM1.kdID = KingdomChooser1.kdID
                        SOM1.Refresh()
                    End If
                Case 2
                    ProbingB()
                    If lblSuccess.Text = "Success" Then
                        plcResult.Controls.Add(SOB1)
                        SOB1.kdID = KingdomChooser1.kdID
                        SOB1.Refresh()
                    End If
                Case 3
                    ProbingB()
                    If lblSuccess.Text = "Success" Then
                        plcResult.Controls.Add(SOR1)
                        SOR1.kdID = KingdomChooser1.kdID
                        SOR1.Refresh()
                    End If
                Case 4
                    ProbeRobB()
                Case 5
                    ProbeArsonB()
                Case 6
                    ProbePowerB()
                Case 7
                    ProbePopB()
            End Select
            UpdateProbes()
            txtProbes.Text = ""
            BottomInfoBar1.Refresh()
            Exit Sub
        Else
            If chkShield.Checked = False Then
                Dim ProbeType2 As Int32 = Val(cboProbeType.SelectedItem.Value)
                Select Case ProbeType2
                    Case 0
                        Probing()
                        If lblSuccess.Text = "Success" Then
                            plcResult.Controls.Add(SOK1)
                            SOK1.kdID = KingdomChooser1.kdID
                            SOK1.Local = False
                            SOK1.Refresh()
                        End If
                    Case 1
                        Probing()
                        If lblSuccess.Text = "Success" Then
                            plcResult.Controls.Add(SOM1)
                            SOM1.kdID = KingdomChooser1.kdID
                            SOM1.Refresh()
                        End If
                    Case 2
                        Probing()
                        If lblSuccess.Text = "Success" Then
                            plcResult.Controls.Add(SOB1)
                            SOB1.kdID = KingdomChooser1.kdID
                            SOB1.Refresh()
                        End If
                    Case 3
                        Probing()
                        If lblSuccess.Text = "Success" Then
                            plcResult.Controls.Add(SOR1)
                            SOR1.kdID = KingdomChooser1.kdID
                            SOR1.Refresh()
                        End If
                    Case 4
                        ProbeRob()
                    Case 5
                        ProbeArson()
                    Case 6
                        ProbePower()
                    Case 7
                        ProbePop()
                End Select
                UpdateProbes()
                txtProbes.Text = ""
                BottomInfoBar1.Refresh()
                Exit Sub
            End If
        End If
    End Sub
End Class