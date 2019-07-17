Imports System.IO
Imports System.Data
Partial Class Solicitar_Descargo
    Inherits System.Web.UI.Page
    Dim Soli As New ClsConexion


    Private Sub Solicitar_Descargo_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (IsPostBack = False) Then
            If (Session("Usuario") = "") Then
                Response.Redirect("Login.aspx")
            End If
        End If
        Dim CodEmp As String = Convert.ToString(Session("CodEmpleado"))
        LblUsu.Text = CodEmp
        Try
            MAXI()
            gvEquipos.DataBind()

            Dim dtaNom As New DataSet
            dtaNom = Soli.Consultas("select DISTINCT NomEmp, ApeEmp from  Empleados where CodEmp = '" & LblUsu.Text & "'")
            LblNomEmp.Text = dtaNom.Tables(0).Rows(0).Item(0) & " " & dtaNom.Tables(0).Rows(0).Item(1)

            Dim dtaCT As New DataSet
            dtaCT = Soli.Consultas("SELECT FORMAT(SUM(P.CostoAct),'#,###.00') as Costo_Total  FROM Asignacion as A INNER JOIN Inventario as I ON A.CodInv =I.CodInv INNER JOIN dbo.Productos as P ON I.CodProd = P.CodProd " &
                         "where A.CodEmp = '" & LblUsu.Text & "' and A.EstAsig between 1 and 2")
            lblCT.Text = dtaCT.Tables(0).Rows(0).Item(0)

            Dim dtaToE As New DataSet
            dtaToE = Soli.Consultas("SELECT COUNT(A.CodInv) as Inv  FROM Asignacion as A INNER JOIN Inventario as I ON A.CodInv =I.CodInv INNER JOIN dbo.Productos as P ON I.CodProd = P.CodProd " &
                         "where A.CodEmp = '" & LblUsu.Text & "' and A.EstAsig between 1 and 2")
            lblTotEq.Text = dtaToE.Tables(0).Rows(0).Item(0)
        Catch ex As Exception
            Response.Write("<script>alert('" & "Error al cargar datos, Inicie Sesion" & "')</script>")
            Response.Redirect("~\Login.aspx")

        End Try
    End Sub
    Dim CodInv As Label
    Dim CodAsig As Label

    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        Try
            Dim Solicitar As CheckBox
            Dim fecha As String = DateTime.Now
            For index = 0 To gvEquipos.Rows.Count - 1
                CodAsig = gvEquipos.Rows(index).FindControl("Label1")
                CodInv = gvEquipos.Rows(index).FindControl("Label2")
                LblCodAsig.Text = CodAsig.Text
                LblCodInv.Text = CodInv.Text
                Solicitar = gvEquipos.Rows(index).FindControl("CheckBox1")
                If Solicitar.Checked = False Then
                    Soli.Funciones("exec IngresarSolicitudDiagnostico '" & LblCodObs.Text & "','" & LblCodInv.Text & "','" & fecha & "','" & LblUsu.Text & "','" & 1 & "'")
                    Soli.Funciones("exec ActualizarAsignacion '" & LblCodAsig.Text & "','" & 2 & "'")
                    MAXI()
                End If
                'Response.Redirect("Solicitar_Descargo.aspx")
            Next
            gvEquipos.DataBind()
            gvSolicitudes.DataBind()
            dvExito.Visible = True
        Catch ex As Exception

        End Try
    End Sub



    Private Sub MAXI()
        LblCodObs.Text = Soli.Max("SELECT MAX(CodSoli) from SolicitudesDescargo")
    End Sub
    Private Sub limpiar()

    End Sub

    Private Sub gvSolicitudes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvSolicitudes.RowCommand
        If e.CommandName = "btnCancelar" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim A As String = gvSolicitudes.Rows(crow).Cells(1).Text
            Dim s As String = gvSolicitudes.Rows(crow).Cells(0).Text
            Soli.Funciones("exec ActualizarAsignacion '" & A & "','" & 1 & "'")
            Soli.Funciones("exec ActSolicitud '" & s & "','" & 0 & "'")
            gvSolicitudes.DataBind()
            gvEquipos.DataBind()
        End If
    End Sub

  
End Class
