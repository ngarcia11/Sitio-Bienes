Imports System.IO
Imports System.Data
Partial Class Info_Bienes
    Inherits System.Web.UI.Page
    Dim Info As New ClsConexion

    Private Sub Info_Bienes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (IsPostBack = False) Then

            If (Session("Usuario") = "") Then
                Response.Redirect("Login.aspx")
            End If

        End If
        Dim CodEmp As String = Convert.ToString(Session("CodEmpleado"))
        LblUsu.Text = CodEmp
        Try
            Dim dta As New DataSet
            dta = Info.Consultas("Select I.CodInv as Cod_Inv, I.CodEti as Cod_Eti, P.Descrpcion as Descripcion, P.ModeloProd as Modelo, P.Marca, P.Serie, P.CostoAct as Costo_Actual " &
            " from  Asignacion as A INNER JOIN Inventario as I ON A.CodInv = I.CodInv INNER JOIN dbo.Productos as P ON I.CodProd = P.CodProd where A.CodEmp = '" & LblUsu.Text & "' and A.EstAsig between 1 and 2")
            GvInfG.DataSource = dta
            GvInfG.DataBind()

            Dim dtaNom As New DataSet
            dtaNom = Info.Consultas("select DISTINCT NomEmp, ApeEmp from  Empleados where CodEmp = '" & LblUsu.Text & "'")
            LblNomEmp.Text = dtaNom.Tables(0).Rows(0).Item(0) & " " & dtaNom.Tables(0).Rows(0).Item(1)

            Dim dtaCT As New DataSet
            dtaCT = Info.Consultas("SELECT FORMAT(SUM(P.CostoAct),'#,###.00') as Costo_Total  FROM Asignacion as A INNER JOIN Inventario as I ON A.CodInv =I.CodInv INNER JOIN dbo.Productos as P ON I.CodProd = P.CodProd " &
                         "where A.CodEmp = '" & LblUsu.Text & "' and A.EstAsig between 1 and 2")
            lblCT.Text = dtaCT.Tables(0).Rows(0).Item(0)

            Dim dtaToE As New DataSet
            dtaToE = Info.Consultas("SELECT COUNT(A.CodInv) as Inv  FROM Asignacion as A INNER JOIN Inventario as I ON A.CodInv =I.CodInv INNER JOIN dbo.Productos as P ON I.CodProd = P.CodProd " &
                         "where A.CodEmp = '" & LblUsu.Text & "' and A.EstAsig between 1 and 2")
            lblTotEq.Text = dtaToE.Tables(0).Rows(0).Item(0)
        Catch ex As Exception
            Response.Write("<script>alert('" & "Error al cargar datos, Inicie Sesion" & "')</script>")
            Response.Redirect("~\Login.aspx")

        End Try
    End Sub
    Private Sub GvInfG_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvInfG.RowCommand
        If e.CommandName = "btnReObs" Then
            Dim crow As Integer
            crow = Convert.ToInt32(e.CommandArgument.ToString())
            Dim v As String = GvInfG.Rows(crow).Cells(0).Text
            Session("Obs") = v
            Response.Redirect("~\Obs_Bienes.aspx")
        End If

    End Sub
End Class
