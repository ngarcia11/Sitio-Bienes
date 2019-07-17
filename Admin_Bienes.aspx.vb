Imports System.IO
Imports System.Data
Partial Class Admin_Bienes
    Inherits System.Web.UI.Page
    Dim Info As New ClsConexion
    Private Sub Admin_Bienes_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim NomUsr As String = Convert.ToString(Session("Usuario"))
        LblNomEmp.Text = NomUsr
        MAXI()
        Carga()
        CantidadSoli()
    End Sub
    Private Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        Try
            If LblModelo.Text = " " Then
                Response.Write("<script> alert( '" & "Seleccione una solicitud para asignar" & "' ) </script>")
            Else
                Dim fecha As String = DateTime.Now
                Info.Funciones("exec IngresarCarga '" & LblCodCarga.Text & "','" & LblCodSoli.Text & "','" & fecha & "','" & ddlAsigEmp.SelectedValue & "','" & 0 & "'")
                Info.Funciones("exec ActSolicitud '" & LblCodSoli.Text & "','" & 0 & "'")
                GvBienesSoli.DataBind()
                limpiar()
                MAXI()
                Carga()
                CantidadSoli()
            End If
        Catch ex As Exception
            Response.Write("<script> alert( '" & "Seleccione una solicitud para asignar" & "' ) </script>")
        End Try


    End Sub
    Private Sub MAXI()
        LblCodCarga.Text = Info.Max("SELECT MAX(CodCargaT) from CargaTrabajo")
    End Sub

    Sub limpiar()
        LblModelo.Text = ""
        LblSerie.Text = ""
        LblMarca.Text = ""
        LblFchCom.Text = ""
        LblGarantia.Text = ""
        LblMeses.Text = ""
    End Sub
    Private Sub Carga()
        Dim dta1 As New DataSet
        dta1 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'IngrisMarquez' and EstCarga = 1")
        hfI1.Value = dta1.Tables(0).Rows(0).Item(0)
        Dim dta2 As New DataSet
        dta2 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'IngrisMarquez' and EstCarga = 0")
        hfI2.Value = dta2.Tables(0).Rows(0).Item(0)

        Dim dta3 As New DataSet
        dta3 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'KevinCarranza' and EstCarga = 0")
        hfK1.Value = dta3.Tables(0).Rows(0).Item(0)
        Dim dta4 As New DataSet
        dta4 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'KevinCarranza' and EstCarga = 1")
        hfK2.Value = dta4.Tables(0).Rows(0).Item(0)

        Dim dta5 As New DataSet
        dta5 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'MarcoMendoza' and EstCarga = 0")
        hfM1.Value = dta5.Tables(0).Rows(0).Item(0)
        Dim dta6 As New DataSet
        dta6 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'MarcoMendoza' and EstCarga = 1")
        hfM2.Value = dta6.Tables(0).Rows(0).Item(0)

        Dim dta7 As New DataSet
        dta7 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'SandraFunez' and EstCarga = 0")
        hfS1.Value = dta7.Tables(0).Rows(0).Item(0)
        Dim dta8 As New DataSet
        dta8 = Info.Consultas("select Count(CodCargaT) as Asignado From CargaTrabajo where UsuaCarga = 'SandraFunez' and EstCarga = 1")
        hfS2.Value = dta8.Tables(0).Rows(0).Item(0)
    End Sub

    Private Sub CantidadSoli()
        Dim dtaToSoli As New DataSet
        dtaToSoli = Info.Consultas("Select COUNT(S.CodSoli) as Total from  SolicitudesDescargo as S  inner join Inventario as I on S.CodInv = I.CodInv " &
         "where EstSoli = 1 and I.CodEquipo not like '%' + '031504' + '%' ")
        lblToSoli.Text = dtaToSoli.Tables(0).Rows(0).Item(0)
    End Sub

    Private Sub GvBienesSoli_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvBienesSoli.RowCommand
        If e.CommandName = "btnAsignar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim u As String = GvBienesSoli.Rows(crow).Cells(0).Text
            LblCodSoli.Text = u
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

        End If
    End Sub
End Class
