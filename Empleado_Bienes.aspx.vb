Imports System.IO
Imports System.Data
Partial Class Empleado_Bienes
    Inherits System.Web.UI.Page
    Dim Info As New ClsConexion
    Private Sub Empleado_Bienes_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim NomUsr As String = Convert.ToString(Session("Usuario"))
        LblNomEmp.Text = NomUsr
        Cantidades()
        MAXI()
    End Sub

    Private Sub Cantidades()
        Dim dtaA As New DataSet
        dtaA = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = '" & LblNomEmp.Text & "' and EstCarga = 0")
        lblAsignado.Text = dtaA.Tables(0).Rows(0).Item(0)
        Dim dtaR As New DataSet
        dtaR = Info.Consultas("select Count(CodCargaT) as realizado From CargaTrabajo where UsuaCarga = '" & LblNomEmp.Text & "' and EstCarga = 1")
        LblReal.Text = dtaR.Tables(0).Rows(0).Item(0)
    End Sub

    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        Try
            If ttaNotas.Value = "" Then
                Response.Write("<script> alert( '" & "Completa el campo vacio" & "' ) </script>")
                dvError.Visible = True
                dvExito.Visible = False
            Else

                Dim fecha As String = DateTime.Now
                Info.Funciones("exec IngresarDiagnostico '" & LblCodDiag.Text & "','" & ttaNotas.Value & "','" & fecha & "','" & 0 & "','" & LblInv.Text & "','" & LblNomEmp.Text & "','" & LblEm.Text & "'")
                Info.Funciones("exec ActualizarCarga '" & LblCodCarga.Text & "','" & 1 & "'")
                GvTrabajoAsi.DataBind()
                MAXI()
                Cantidades()
                limpiar()
                dvError.Visible = False
                dvExito.Visible = True
            End If
        Catch ex As Exception
            dvError.Visible = True
            dvExito.Visible = False
        End Try

    End Sub

    Private Sub MAXI()
        LblCodDiag.Text = Info.Max("SELECT MAX(CodDiag) from Diagnostico")
    End Sub
    Sub limpiar()
        LblModelo.Text = ""
        LblSerie.Text = ""
        LblMarca.Text = ""
        LblFchCom.Text = ""
        LblGarantia.Text = ""
        LblMeses.Text = ""
        ttaNotas.Value = ""
    End Sub

    Private Sub GvTrabajoAsi_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvTrabajoAsi.RowCommand
        If e.CommandName = "btnRealizar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim s As String = GvTrabajoAsi.Rows(crow).Cells(1).Text
            Dim CodCar As String = GvTrabajoAsi.Rows(crow).Cells(0).Text
            Dim CodEm As String = GvTrabajoAsi.Rows(crow).Cells(2).Text
            Dim CodInv As String = GvTrabajoAsi.Rows(crow).Cells(6).Text
            LblCodCarga.Text = CodCar
            LblCodSoli.Text = s
            LblInv.Text = CodInv
            LblEm.Text = CodEm
            Dim dsa As New DataSet
            dsa = Info.Consultas("select P.ModeloProd as Modelo, P.Serie as Serie, P.Marca as Marca, " &
                    "P.FchCompra  as Fecha_Ingreso, P.Garantia ,P.MesesGa as Meses_Garantia " &
             "from Productos as P inner join Inventario as I on P.CodProd = I.CodProd " &
            "inner join  SolicitudesDescargo As S on S.CodInv = I.CodInv where S.CodSoli = '" & LblCodSoli.Text & "'")
            LblModelo.Text = dsa.Tables(0).Rows(0).Item(0)
            LblSerie.Text = dsa.Tables(0).Rows(0).Item(1)
            LblMarca.Text = dsa.Tables(0).Rows(0).Item(2)
            LblFchCom.Text = dsa.Tables(0).Rows(0).Item(3)
            LblGarantia.Text = dsa.Tables(0).Rows(0).Item(4)
            LblMeses.Text = dsa.Tables(0).Rows(0).Item(5)
            dvError.Visible = False
            dvExito.Visible = False
        End If
    End Sub


End Class
