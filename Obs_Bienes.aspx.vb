Imports System.IO
Imports System.Data
Partial Class Obs_Bienes
    Inherits System.Web.UI.Page
    Dim Obs As New ClsConexion
    Private Sub Obs_Bienes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (IsPostBack = False) Then
            If (Session("Usuario") = "") Then
                Response.Redirect("Login.aspx")
            End If
        End If
        Dim CodEmp As String = Convert.ToString(Session("CodEmpleado"))
        Dim usu As String = Convert.ToString(Session("Usuario"))
        Dim c As String = Convert.ToString(Session("Obs"))
        LblCodUsu.Text = CodEmp
        LblCodInv.Text = c
        'ddlEquipo.Enabled = True
        txtUsuario.Value = usu
        Dim dtaNom As New DataSet
        dtaNom = Obs.Consultas("select DISTINCT NomEmp, ApeEmp from  Empleados where CodEmp = '" & LblCodUsu.Text & "'")
        LblNomEmp.Text = dtaNom.Tables(0).Rows(0).Item(0) & " " & dtaNom.Tables(0).Rows(0).Item(1)
        MostrarObs()
        MAXI()
        MAXIBita()
    End Sub

    Public Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        'Try
        If LblCodInv.Text = "" Then
            Dim fecha As String = DateTime.Now
            Obs.Funciones("exec IngresarObservacion '" & LblCodObs.Text & "','" & ddlEquipo.SelectedValue & "','" & ttaNotas.Value & "','" & fecha & "','" & txtUsuario.Value & "'")
            'Obs.Funciones("exec InsertarBitacoraWeb '" & LblCodBita.Text & "','" & "Agrego una observación el usuario " + LblNomEmp.Text + "" & "','" & DateTime.Now & "','" & txtUsuario.Value & "'")
            dvExito.Visible = True
            'ddlEquipo.Enabled = True
            Session.Remove("Obs")
            MostrarObs()
            MAXI()
            MAXIBita()
            limpiar()
        Else

            Dim fecha As String = Strings.Format(System.DateTime.Now, "dd/MM/yyyy")
            Obs.Funciones("exec IngresarObservacion '" & LblCodObs.Text & "','" & LblCodInv.Text & "','" & ttaNotas.Value & "','" & fecha & "','" & txtUsuario.Value & "'")
            'Obs.Funciones("exec InsertarBitacoraWeb '" & LblCodBita.Text & "','" & "Agrego una observación el usuario " + LblNomEmp.Text + "" & "','" & DateTime.Now & "','" & txtUsuario.Value & "'")
            dvExito.Visible = True
            LblCodInv.Text = ""
            MostrarObs()
            ddlEquipo.Enabled = True
            MAXI()
            MAXIBita()
            limpiar()
            Response.Redirect("Obs_Bienes.aspx")
        End If

        'Catch ex As Exception
        '    Response.Write("<script>alert('" & "Error al guardar" & "')</script>")
        '    limpiar()
        'End Try
    End Sub
    Private Sub MAXIBita()
        'LblCodBita.Text = Obs.Max("SELECT MAX(B_CodBita) from BitacoraWeb")
    End Sub
    Private Sub MostrarObs()
        If LblCodInv.Text = "" Then
            Dim dtaa As New DataSet
            dtaa = Obs.Consultas("exec VerObs '" & ddlEquipo.SelectedValue & "'")
            gvobs.DataSource = dtaa
            gvobs.DataBind()
            ddlEquipo.Enabled = True
        Else
            Dim dta As New DataSet
            dta = Obs.Consultas("exec VerObs '" & LblCodInv.Text & "'")
            gvobs.DataSource = dta
            gvobs.DataBind()
            ddlEquipo.Enabled = False
        End If

    End Sub
    Private Sub MAXI()
        LblCodObs.Text = Obs.Max("SELECT MAX(CodObs) from Observaciones")
    End Sub
    Private Sub limpiar()
        ttaNotas.Value = ""
    End Sub

    Private Sub ddlEquipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlEquipo.SelectedIndexChanged
        'MostrarObs()
    End Sub

  
End Class
