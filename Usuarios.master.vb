
Partial Class Usuarios
    Inherits System.Web.UI.MasterPage

    Private Sub Usuarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (IsPostBack = False) Then
            If (Session("Usuario") = "") Then
                Response.Redirect("Login.aspx")
            End If

        End If
    End Sub

    Protected Sub Cerrar_ServerClick(sender As Object, e As EventArgs) Handles Cerrar.ServerClick
        Session.RemoveAll()
        Response.Redirect("Login.aspx")
    End Sub
End Class

