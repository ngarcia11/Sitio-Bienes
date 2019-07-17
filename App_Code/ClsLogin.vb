Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Public Class ClsLogin
    Dim CS As String = "Data source = DESKTOP-P1BTG9F\SQLEXPRESS; Initial Catalog = dta_rrhh; Integrated Security=True"

    Public Function Login(ByVal Comando As String) As DataSet
        Dim Dsa As New DataSet
        Dim SqlCnn As New SqlConnection(CS)
        Dim DA As New SqlDataAdapter(Comando, SqlCnn)
        DA.Fill(Dsa)
        Login = Dsa
        DA.Dispose()
        Dsa.Dispose()
        SqlCnn.Dispose()

    End Function
End Class
