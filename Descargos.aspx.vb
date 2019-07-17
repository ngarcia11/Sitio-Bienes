Imports System.IO
Imports System.Data


Partial Class Desacargos
    Inherits System.Web.UI.Page
    Dim Info As New ClsConexion

    Private Sub Desacargos_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim NomUsr As String = Convert.ToString(Session("Usuario"))
        LblNomEmp.Text = NomUsr
        MAXI()

    End Sub

    Private Sub GvTrabajoAsi_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvTrabajoAsi.RowCommand
        If e.CommandName = "btnRealizar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim d As String = GvTrabajoAsi.Rows(crow).Cells(0).Text
            Dim em As String = GvTrabajoAsi.Rows(crow).Cells(2).Text
            Dim CodAsig As String = GvTrabajoAsi.Rows(crow).Cells(1).Text
            Dim CodInv As String = GvTrabajoAsi.Rows(crow).Cells(6).Text
            LblAsig.Text = CodAsig
            LblCodDia.Text = d
            LblInv.Text = CodInv
            LblEmp.Text = em
            Dim dsa As New DataSet
            dsa = Info.Consultas(" select P.ModeloProd as Modelo, P.Serie as Serie, P.Marca as Marca, " &
                   "P.FchCompra  as Fecha_Ingreso, P.Garantia ,P.MesesGa as Meses_Garantia " &
                  "from Productos as P inner join Inventario as I on P.CodProd = I.CodProd " &
              "where I.CodInv ='" & LblInv.Text & "'")
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
    Private Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        Try
            If ttaNotas.Value = "" Then
                dvError.Visible = True
                dvExito.Visible = False
            Else

                Dim fecha As String = DateTime.Now
                Info.Funciones("exec IngresarDescargo '" & LblCodDesc.Text & "','" & ttaNotas.Value & "','" & LblCodDia.Text & "','" & fecha & "','" & LblEmp.Text & "','" & LblInv.Text & "','" & "H" & "'")
                Info.Funciones("exec ActualizarAsignacion '" & LblAsig.Text & "','" & 3 & "'")
                Info.Funciones("exec ActualizarDiag '" & LblCodDia.Text & "','" & 1 & "'")
                Info.Funciones("exec InsertarBitacoraWeb '" & LblCodBita.Text & "','" & "El usuario" + LblNomEmp.Text + " realizo el descargo " + LblCodDesc.Text + "" & "','" & fecha & "','" & LblNomEmp.Text & "'")
                GvTrabajoAsi.DataBind()
                MAXI()
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
        LblCodDesc.Text = Info.Max("SELECT MAX(CodDesc) from Descargo")
        LblCodBita.Text = Info.Max("SELECT MAX(CodBita) from BitacoraWeb")
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
End Class
