Imports System.IO
Imports System.Data
Partial Class Permisos
    Inherits System.Web.UI.Page
    Dim CC As New ClsConexion
    Dim fecha As String = DateTime.Now
    Private Sub BtnRegistar_Click(sender As Object, e As EventArgs) Handles BtnRegistar.Click
        Try
            If txtUsuario.Text = "" Or txtpass.Value = "" Then
                dvAdvertencia.Visible = True
                dvExito.Visible = False
                limpiar()
            Else

                CC.Funciones("exec InsertarUsuarios '" & txtUsuario.Text & "','" & txtpass.Value & "','" & ddlNivel.SelectedValue & "','" & 1 & "'")
                CC.Funciones("exec InsertarBitacoraWeb '" & LblCodBita.Text & "','" & "Agrego o Modifico a " + txtUsuario.Text + " el Usuario " + LblUsu.Text + "" & "','" & fecha & "','" & LblUsu.Text & "'")
                dvExito.Visible = True
                dvAdvertencia.Visible = False
                dvError.Visible = False
                txtUsuario.ReadOnly = False
                MAXI()
                cargaUsr()
                limpiar()
            End If
        Catch ex As Exception
            dvAdvertencia.Visible = True
            dvExito.Visible = False
            limpiar()
        End Try
    End Sub

    Private Sub Permisos_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim NomUsr As String = Convert.ToString(Session("Usuario"))
        LblUsu.Text = NomUsr
        cargaUsr()
        MAXI()
    End Sub

    Sub limpiar()
        txtUsuario.Text = ""
        txtpass.Value = ""
    End Sub
    Private Sub cargaUsr()
        Dim dsa As New DataSet
        dsa = CC.Consultas("exec VerUsuarios")
        gvUsua.DataSource = dsa
        gvUsua.DataBind()
    End Sub

    Private Sub gvUsua_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvUsua.RowCommand
        If e.CommandName = "btnEliminar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim u As String = gvUsua.Rows(crow).Cells(0).Text
            CC.Funciones("exec EliminarUsuarios '" & u & "','" & 0 & "'")
            CC.Funciones("exec InsertarBitacoraWeb '" & LblCodBita.Text & "','" & "Desabilito a " + txtUsuario.Text + " el Usuario " + LblUsu.Text + "" & "','" & fecha & "','" & LblUsu.Text & "'")
            MAXI()
            dvExito.Visible = False
            dvAdvertencia.Visible = False
            dvError.Visible = True
            cargaUsr()

        End If
        If e.CommandName = "btnModi" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim u As String = gvUsua.Rows(crow).Cells(0).Text
            Dim c As String = gvUsua.Rows(crow).Cells(1).Text
            Dim n As String = gvUsua.Rows(crow).Cells(2).Text
            txtUsuario.Text = u
            txtUsuario.ReadOnly = True
            txtpass.Value = c
            ddlNivel.SelectedValue = n
            'CC.Funciones("exec EliminarUsuarios '" & u & "','" & 0 & "'")
            'cargaUsr()

        End If
    End Sub
    Private Sub MAXI()
        LblCodBita.Text = CC.Max("SELECT MAX(CodBita) from BitacoraWeb")
    End Sub



End Class
