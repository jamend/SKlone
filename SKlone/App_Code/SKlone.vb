Imports System.Data
Imports System.Security.Cryptography

Module GlobalStuff
    Public Const DateTimeFormatString As String = "MMMM d, h:mm tt"
    Public Const NumberFormatString As String = "###,###,###,###,##0"

    Public Function Filter(ByVal str As String) As String
        Dim Buffer As String = str
        Buffer = Trim(Buffer)
        Buffer = Replace(Buffer, "  ", "&nbsp;&nbsp;")
        Buffer = Replace(Buffer, vbTab, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")
        Buffer = Replace(Buffer, "<", "&lt;")
        Buffer = Replace(Buffer, ">", "&gt;")
        Buffer = Replace(Buffer, "[a", "<a")
        Buffer = Replace(Buffer, "[b", "<b")
        Buffer = Replace(Buffer, "[u", "<u")
        Buffer = Replace(Buffer, "[font", "<font")
        Buffer = Replace(Buffer, "[img", "<img")
        Buffer = Replace(Buffer, "[/a]", "</a>")
        Buffer = Replace(Buffer, "[/b]", "</b>")
        Buffer = Replace(Buffer, "[/u]", "</u>")
        Buffer = Replace(Buffer, "[/font]", "</font>")
        Buffer = Replace(Buffer, "]", ">")
        'Buffer = Replace(Buffer, "td>", "td&gt;")
        'Buffer = Replace(Buffer, "tr>", "tr&gt;")
        'Buffer = Replace(Buffer, "table>", "table&gt;")
        'Buffer = Replace(Buffer, "body>", "body&gt;")
        'Buffer = Replace(Buffer, "html>", "html&gt;")
        Buffer = Replace(Buffer, vbCrLf, "<br>")
        Filter = Buffer
    End Function

    Public Function RevFilter(ByVal str As String) As String
        Dim Buffer As String = str
        Buffer = Trim(Buffer)
        Buffer = Replace(Buffer, "&nbsp;&nbsp;", "  ")
        Buffer = Replace(Buffer, "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", vbTab)
        Buffer = Replace(Buffer, "&lt;", "<")
        Buffer = Replace(Buffer, "&gt;", ">")
        Buffer = Replace(Buffer, "<br>", vbCrLf)
        RevFilter = Buffer
    End Function

    Public Function HashPassword(password As String, salt As String) As String
        Return BitConverter.ToString(SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes("%%skl0n3" + salt + password))).Replace("-", "").ToLowerInvariant()
    End Function
End Module

Namespace SKSession

    Module SKSession

        Public Sub LoggedIn(ByVal kdID As Int32, ByVal Value As Boolean, ByVal sqlConnection1 As SqlClient.SqlConnection)
            Dim SqlCommand1 As New SqlClient.SqlCommand("", sqlConnection1)
            Select Case Value
                Case True
                    SqlCommand1.CommandText = "UPDATE AccountStatus SET LoggedIn = 1 WHERE kdID = " & kdID
                Case False
                    SqlCommand1.CommandText = "UPDATE AccountStatus SET LoggedIn = 0 WHERE kdID = " & kdID
            End Select
            sqlConnection1.Open()
            SqlCommand1.ExecuteNonQuery()
            sqlConnection1.Close()
        End Sub

        Public Function Cheater(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Cheater FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            Cheater = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function Dead(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Dead FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            Dead = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function Activated(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Activated FROM Activation WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            Activated = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function DeletePending(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT DeletePending FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            DeletePending = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function VacationPending(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationPending FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            VacationPending = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function VacationEnd(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationEnd FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            VacationEnd = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function VacationMode(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT VacationMode FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            VacationMode = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

        Public Function Newbie(ByVal kdID As Int32, ByVal sqlConnection1 As SqlClient.SqlConnection) As Boolean
            Dim SqlCommand1 As New SqlClient.SqlCommand("SELECT Newbie FROM AccountStatus WHERE kdID = " & kdID, sqlConnection1)
            sqlConnection1.Open()
            Newbie = SqlCommand1.ExecuteScalar()
            sqlConnection1.Close()
        End Function

    End Module
End Namespace