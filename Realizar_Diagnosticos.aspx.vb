Imports System.IO
Imports System.Data
Partial Class Realizar_Diagnosticos
    Inherits System.Web.UI.Page
    Dim Info As New ClsConexion
    Private Sub Realizar_Diagnosticos_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim NomUsr As String = Convert.ToString(Session("Usuario"))
        LblNomEmp.Text = NomUsr
        MAXI()
        CantidadSoli()
    End Sub

    Private Sub GvTrabajoAsi_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvTrabajoAsi.RowCommand
        If e.CommandName = "btnRealizar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim s As String = GvTrabajoAsi.Rows(crow).Cells(0).Text
            Dim CodEm As String = GvTrabajoAsi.Rows(crow).Cells(1).Text
            Dim CodInv As String = GvTrabajoAsi.Rows(crow).Cells(5).Text
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

    Private Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        'Try
        If ttaNotas.Value = "" Then
            dvError.Visible = True
            dvExito.Visible = False
        Else

            Dim fecha As String = DateTime.Now
            Info.Funciones("exec IngresarDiagnostico '" & LblCodCarga.Text & "','" & ttaNotas.Value & "','" & fecha & "','" & 2 & "','" & LblInv.Text & "','" & LblNomEmp.Text & "','" & LblEm.Text & "'")
            Info.Funciones("exec ActSolicitud '" & LblCodSoli.Text & "','" & 0 & "'")
            GvTrabajoAsi.DataBind()
            MAXI()
            limpiar()
            CantidadSoli()
            dvError.Visible = False
            dvExito.Visible = True
        End If
        'Catch ex As Exception
        '    dvError.Visible = True
        '    dvExito.Visible = False
        'End Try

    End Sub
    Private Sub MAXI()
        LblCodCarga.Text = Info.Max("SELECT MAX(CodDiag) from Diagnostico")
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
     Private Sub CantidadSoli()
        Dim dtaToSoli As New DataSet
        dtaToSoli = Info.Consultas("Select COUNT(S.CodSoli) as Total from  SolicitudesDescargo as S  inner join Inventario as I on S.CodInv = I.CodInv " &
         "where EstSoli = 1 and I.CodEquipo like '%' + '031504' + '%' ")
        lblToSoli.Text = dtaToSoli.Tables(0).Rows(0).Item(0)
        Dim dtaR As New DataSet
        dtaR = Info.Consultas("Select COUNT(S.CodSoli) as Total from  SolicitudesDescargo as S  inner join Inventario as I on S.CodInv = I.CodInv " &
         "where EstSoli = 0 and I.CodEquipo like '%' + '031504' + '%' ")
        LblReal.Text = dtaR.Tables(0).Rows(0).Item(0)
    End Sub

End Class
