Imports System.Data.SqlClient
Imports System.Data
Partial Class Login
    Inherits System.Web.UI.Page
    Dim CC As New ClsLogin
    Dim LG As New ClsConexion

    Protected Sub BtnIngresar_Click(sender As Object, e As EventArgs) Handles BtnIngresar.Click
        Try
            Dim dsa As New DataSet
            Dim dsa1 As New DataSet
            dsa1 = LG.Consultas("Select NomUsr, PassUsr, NvlUsr from Usuarios Where NomUsr = '" & TxtUsuario.Text & "' AND PassUsr = '" & TxtPass.Text & "' AND EstUsr = '" & 1 & "'")
            Session("Usuario") = TxtUsuario.Text
            If dsa1.Tables(0).Rows.Count = 0 Then
                dsa = CC.Login("select F_Usuario, F_Clave, F_CodEmp from F_EmplXUsuario_Perm Where F_Usuario = '" & TxtUsuario.Text & "' AND F_Clave = '" & TxtPass.Text & "'")
                Session("Usuario") = TxtUsuario.Text
                Session("CodEmpleado") = dsa.Tables(0).Rows(0).Item(2)
                If dsa.Tables(0).Rows.Count = 0 Then
                    Response.Write("<script>alert('" & "Usuario y/o Contraseña incorrectos" & "');</script>")
                    limpiar()
                Else
                    Response.Redirect("~\Info_Bienes.aspx")

                End If
            Else

                If dsa1.Tables(0).Rows.Count = 0 Then
                    Response.Write("<script>alert('" & "Usuario y/o Contraseña incorrectos" & "');</script>")
                    limpiar()
                ElseIf dsa1.Tables(0).Rows(0).Item(2) = 0 Then
                    Response.Redirect("~\Realizar_Diagnosticos.aspx")
                ElseIf dsa1.Tables(0).Rows(0).Item(2) = 1 Then
                    Response.Redirect("~\Permisos.aspx")
                ElseIf dsa1.Tables(0).Rows(0).Item(2) = 2 Then
                    Response.Redirect("~\Admin_Bienes.aspx")
                Else
                    Response.Redirect("~\Empleado_Bienes.aspx")

                End If
            End If
        Catch ex As Exception
            Response.Write("<script>alert('" & "Usuario y/o Contraseña incorrectos" & "');</script>")
        End Try


    End Sub
    Private Sub limpiar()
        TxtUsuario.Text = ""
        TxtPass.Text = ""
    End Sub

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (IsPostBack = False) Then
            Session.RemoveAll()
            Session("Usuario") = ""
            Response.Write("<script>")
            Response.Write(Environment.NewLine)
            Response.Write(" if(history.forward(1)){location.replace(history.forward(1))}")
            Response.Write(Environment.NewLine)
            Response.Write("</script>")
        End If


        'Session.RemoveAll()
        'Session("Usuario") = ""
        ''Script Para Bloquear El Botón De Atras Del Navegador 
        'Response.Write("<script>")
        'Response.Write(Environment.NewLine)
        'Response.Write(" if(history.forward(1)){location.replace(history.forward(1));}")
        'Response.Write(Environment.NewLine)
        'Response.Write("</script>")

        'Response.Cache.SetCacheability(HttpCacheability.NoCache)
        'Response.Cache.SetExpires(DateTime.Now)
    End Sub

End Class
