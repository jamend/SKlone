
Public Class Global_asax
    Inherits HttpApplication

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
        'Sessions.Add(Session)
        Session.Item("LoggedIn") = False
        Session.Item("sqlConnectionStr") = "server='localhost'; integrated security=True; packet size=4096;initial catalog=sklone"
        Session.Item("sqlConnection") = New SqlClient.SqlConnection(Session.Item("sqlConnectionStr"))
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires at the beginning of each request
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires upon attempting to authenticate the use
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when an error occurs
        Session.Item("sqlConnection").Close()
        Dim SqlCommand1 As New SqlClient.SqlCommand("INSERT INTO ErrorLog(Message, Stack, kdID, LoggedIn, RawURL) VALUES (@Message, @Stack, @kdID, @LoggedIn, @RawURL)", Session.Item("sqlConnection"))
        SqlCommand1.Parameters.Add("@Message", SqlDbType.NVarChar, 256)
        SqlCommand1.Parameters(0).Value = Server.GetLastError.GetBaseException.Message
        SqlCommand1.Parameters.Add("@Stack", SqlDbType.NVarChar, 1024)
        SqlCommand1.Parameters(1).Value = Filter(Server.GetLastError.GetBaseException.StackTrace)
        SqlCommand1.Parameters.Add("@kdID", SqlDbType.Int)
        SqlCommand1.Parameters(2).Value = Val(Session.Item("kdID"))
        SqlCommand1.Parameters.Add("@LoggedIn", SqlDbType.Bit)
        SqlCommand1.Parameters(3).Value = Session.Item("LoggedIn")
        SqlCommand1.Parameters.Add("@RawURL", SqlDbType.NVarChar, 256)
        SqlCommand1.Parameters(4).Value = Request.RawUrl
        Session.Item("sqlConnection").Open()
        SqlCommand1.ExecuteNonQuery()
        Session.Item("sqlConnection").Close()
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        SKSession.LoggedIn(Session.Item("kdID"), False, Session.Item("sqlConnection"))
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        SKSession.LoggedIn(Session.Item("kdID"), False, Session.Item("sqlConnection"))
    End Sub

    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub
End Class