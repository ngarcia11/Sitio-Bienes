Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Public Class ClsConexion
    Dim CS As String = "Data source = DESKTOP-P1BTG9F\SQLEXPRESS; initial catalog = ReplicaBienes; Integrated Security=True"


    Public Function Consultas(ByVal Comando As String) As DataSet
        Dim Dsa As New DataSet
        Dim SqlCnn As New SqlConnection(CS)
        Dim DA As New SqlDataAdapter(Comando, SqlCnn)
        DA.Fill(Dsa)
        Consultas = Dsa
        DA.Dispose()
        Dsa.Dispose()
        SqlCnn.Dispose()

    End Function

    Public Function Max(ByVal Comando As String) As Integer
        Dim Dsa As New DataSet
        Dsa = Consultas(Comando)
        Dim Codigo As Integer
        If DBNull.Value.Equals(Dsa.Tables(0).Rows(0).Item(0)) Then
            Codigo = 1
        Else
            Codigo = Dsa.Tables(0).Rows(0).Item(0) + 1
        End If
        Return Codigo
    End Function

    Public Function Funciones(ByVal Comando As String) As Boolean
        Dim SqlCnn As New SqlConnection(CS)
        Dim Cm As New SqlCommand(Comando, SqlCnn)
        SqlCnn.Open()
        Cm.ExecuteNonQuery()
        Cm.Dispose()
        SqlCnn.Dispose()
        Funciones = True

    End Function

End Class
