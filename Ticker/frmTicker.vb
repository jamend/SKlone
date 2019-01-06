Public Class frmTicker
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents cmdToggleTicker As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents lblLastTick As System.Windows.Forms.Label
    Friend WithEvents timTicker As System.Timers.Timer
    Friend WithEvents cmdTick As System.Windows.Forms.Button
    Friend WithEvents lblCurrentStatus As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents txtLog As System.Windows.Forms.TextBox
    Friend WithEvents cmdClearError As System.Windows.Forms.Button
    Friend WithEvents cmdClearLog As System.Windows.Forms.Button
    Friend WithEvents cmdAbortSKlone As System.Windows.Forms.Button
    Friend WithEvents chkSKlone As System.Windows.Forms.CheckBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdToggleTicker = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.lblLastTick = New System.Windows.Forms.Label()
        Me.timTicker = New System.Timers.Timer()
        Me.cmdTick = New System.Windows.Forms.Button()
        Me.lblCurrentStatus = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.txtLog = New System.Windows.Forms.TextBox()
        Me.cmdClearError = New System.Windows.Forms.Button()
        Me.cmdClearLog = New System.Windows.Forms.Button()
        Me.chkSKlone = New System.Windows.Forms.CheckBox()
        Me.cmdAbortSKlone = New System.Windows.Forms.Button()
        CType(Me.timTicker,System.ComponentModel.ISupportInitialize).BeginInit
        Me.SuspendLayout
        '
        'cmdToggleTicker
        '
        Me.cmdToggleTicker.Location = New System.Drawing.Point(8, 8)
        Me.cmdToggleTicker.Name = "cmdToggleTicker"
        Me.cmdToggleTicker.Size = New System.Drawing.Size(104, 32)
        Me.cmdToggleTicker.TabIndex = 0
        Me.cmdToggleTicker.Text = "Start Ticker"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(120, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(168, 16)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Last Tick:"
        '
        'lblLastTick
        '
        Me.lblLastTick.Location = New System.Drawing.Point(120, 24)
        Me.lblLastTick.Name = "lblLastTick"
        Me.lblLastTick.Size = New System.Drawing.Size(168, 16)
        Me.lblLastTick.TabIndex = 2
        Me.lblLastTick.Text = "Never"
        '
        'timTicker
        '
        Me.timTicker.Interval = 1000R
        Me.timTicker.SynchronizingObject = Me
        '
        'cmdTick
        '
        Me.cmdTick.Location = New System.Drawing.Point(8, 48)
        Me.cmdTick.Name = "cmdTick"
        Me.cmdTick.Size = New System.Drawing.Size(104, 32)
        Me.cmdTick.TabIndex = 3
        Me.cmdTick.Text = "Tick Now"
        '
        'lblCurrentStatus
        '
        Me.lblCurrentStatus.Location = New System.Drawing.Point(120, 64)
        Me.lblCurrentStatus.Name = "lblCurrentStatus"
        Me.lblCurrentStatus.Size = New System.Drawing.Size(168, 16)
        Me.lblCurrentStatus.TabIndex = 5
        Me.lblCurrentStatus.Text = "Idle"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(120, 48)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(168, 16)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Current Status:"
        '
        'txtLog
        '
        Me.txtLog.Location = New System.Drawing.Point(8, 104)
        Me.txtLog.Multiline = true
        Me.txtLog.Name = "txtLog"
        Me.txtLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtLog.Size = New System.Drawing.Size(280, 176)
        Me.txtLog.TabIndex = 6
        Me.txtLog.WordWrap = false
        '
        'cmdClearError
        '
        Me.cmdClearError.Location = New System.Drawing.Point(8, 320)
        Me.cmdClearError.Name = "cmdClearError"
        Me.cmdClearError.Size = New System.Drawing.Size(136, 24)
        Me.cmdClearError.TabIndex = 7
        Me.cmdClearError.Text = "Clear Error"
        '
        'cmdClearLog
        '
        Me.cmdClearLog.Location = New System.Drawing.Point(152, 320)
        Me.cmdClearLog.Name = "cmdClearLog"
        Me.cmdClearLog.Size = New System.Drawing.Size(136, 24)
        Me.cmdClearLog.TabIndex = 8
        Me.cmdClearLog.Text = "Clear Log"
        '
        'chkSKlone
        '
        Me.chkSKlone.Checked = true
        Me.chkSKlone.CheckState = System.Windows.Forms.CheckState.Checked
        Me.chkSKlone.Location = New System.Drawing.Point(8, 80)
        Me.chkSKlone.Name = "chkSKlone"
        Me.chkSKlone.Size = New System.Drawing.Size(136, 24)
        Me.chkSKlone.TabIndex = 9
        Me.chkSKlone.Text = "Enable SKlone ticks"
        '
        'cmdAbortSKlone
        '
        Me.cmdAbortSKlone.Enabled = false
        Me.cmdAbortSKlone.Location = New System.Drawing.Point(8, 288)
        Me.cmdAbortSKlone.Name = "cmdAbortSKlone"
        Me.cmdAbortSKlone.Size = New System.Drawing.Size(136, 24)
        Me.cmdAbortSKlone.TabIndex = 13
        Me.cmdAbortSKlone.Text = "Abort SKlone Tick"
        '
        'frmTicker
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(298, 350)
        Me.Controls.Add(Me.cmdAbortSKlone)
        Me.Controls.Add(Me.chkSKlone)
        Me.Controls.Add(Me.cmdClearLog)
        Me.Controls.Add(Me.cmdClearError)
        Me.Controls.Add(Me.txtLog)
        Me.Controls.Add(Me.lblCurrentStatus)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.cmdTick)
        Me.Controls.Add(Me.lblLastTick)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.cmdToggleTicker)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Name = "frmTicker"
        Me.Text = "Ticker"
        Me.TopMost = true
        CType(Me.timTicker,System.ComponentModel.ISupportInitialize).EndInit
        Me.ResumeLayout(false)
        Me.PerformLayout

End Sub

#End Region

    Dim SqlConnection As New System.Data.SqlClient.SqlConnection("server='localhost'; user id='user'; password='pass'; database='sklone'; packet size=4096;initial catalog=sklone")
    Dim SqlCommand As New System.Data.SqlClient.SqlCommand("dbo.Tick", SqlConnection)
    Dim TimerActive As Boolean = False
    Dim LastTick As DateTime = System.DateTime.Now
    Dim SKloneThread As Threading.Thread

    Private Sub cmdToggleTicker_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdToggleTicker.Click
        Select Case TimerActive
            Case True
                TimerActive = False
                timTicker.Enabled = False
                cmdToggleTicker.Text = "Start Timer"
                UpdateStatus("Ticker Stopped", 2)
                UpdateStatus("Idle", 1)
            Case False
                TimerActive = True
                timTicker.Enabled = True
                cmdToggleTicker.Text = "Stop Timer"
                UpdateStatus("Ticker Started", 2)
                UpdateStatus("Watching the clock...", 1)
        End Select
    End Sub

    Private Sub timTicker_Elapsed(ByVal sender As System.Object, ByVal e As System.Timers.ElapsedEventArgs) Handles timTicker.Elapsed
        If Now.Subtract(LastTick).Minutes > 5 Then
            If Now.Minute mod 5 = 0Then
                Tick()
            End If
        End If
    End Sub

    Private Sub frmTicker_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Load
        SqlCommand.CommandTimeout = 100000000
        SqlCommand.CommandType = CommandType.StoredProcedure
        SqlCommand.Prepare()
        txtLog.Text &= Now.ToString & " | " & "Ticker Initialized"
        CheckForIllegalCrossThreadCalls = False
    End Sub

    Private Sub DoSKloneTick()
        Try
            SqlConnection.Open()
            SqlCommand.ExecuteNonQuery()
            SqlConnection.Close()
            UpdateStatus("SKlone ticked (took " & Now.Subtract(LastTick).Seconds & "s)", 2)
            UpdateStatus(LastTick.ToString & " (" & Now.Subtract(LastTick).Seconds & "s)", 0)
        Catch ex As SqlClient.SqlException
            If InStr(ex.Message, "Operation cancelled by user.") > 0 Then
                UpdateStatus("SKlone tick aborted after " & Now.Subtract(LastTick).Seconds & "s", 2)
            Else
                UpdateStatus("ERROR (sklone)" & vbCrLf & "----------" & vbCrLf & ex.Procedure & " at Line " & ex.LineNumber & vbCrLf & ex.Message & vbCrLf & ex.StackTrace & vbCrLf & "----------", 2)
                Me.BackColor = System.Drawing.Color.Red
            End If
            Try
                SqlConnection.Close()
            Catch ex2 As Exception
            End Try
        End Try
        Select Case TimerActive
            Case True
                UpdateStatus("Watching the clock...", 1)
            Case False
                UpdateStatus("Idle", 1)
        End Select
        cmdAbortSKlone.Enabled = False
    End Sub

    Private Sub Tick()
        SKloneThread = New Threading.Thread(AddressOf DoSKloneTick)
        UpdateStatus("Ticking...", 1)
        LastTick = Now
        If chkSKlone.Checked = True Then
            cmdAbortSKlone.Enabled = True
            SKloneThread.Start()
        Else
            UpdateStatus("SKlone tick is disabled", 2)
        End If
    End Sub

    Private Sub cmdTick_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdTick.Click
        Tick()
    End Sub

    Private Sub UpdateStatus(ByVal Update As String, ByVal Target As Byte)
        Select Case Target
            Case 0
                lblLastTick.Text = Update
            Case 1
                lblCurrentStatus.Text = Update
                txtLog.AppendText(vbCrLf & Now.ToString & " | " & Update)
            Case 2
                txtLog.AppendText(vbCrLf & Now.ToString & " | " & Update)
        End Select
    End Sub

    Private Sub cmdClearLog_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClearLog.Click
        txtLog.Clear()
    End Sub

    Private Sub cmdClearError_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdClearError.Click
        Me.BackColor = System.Drawing.SystemColors.Control
    End Sub

    Private Sub cmdAbortSKlone_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAbortSKlone.Click
        SqlCommand.Cancel()
        UpdateStatus("Aborting SKlone at " & Now.Subtract(LastTick).Seconds & "s", 2)
    End Sub
End Class