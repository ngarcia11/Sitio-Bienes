using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
namespace SICBI.Clases
{//Inicio Código Esdrinha 10
    public class CnxBaseDeDatos
    {//Inicio Clase CnxBaseDeDatos
        SqlConnection cnx = new SqlConnection();
        string con = "";
        //_desarrollo'
        public void Conexion()
        {//Inicio Función Conexion
            con = "data source = aplicaciones.fhis.hn; initial catalog = dta_costos; user id = 'NGARCIA'; password = 'NGARCIA';";
            cnx.ConnectionString = con;
        }// Fin Función COnexion
        public SqlConnection ObtenerCnx()
        {//Inicio Función ObtenerCnx
            Conexion();
            return cnx;
        }//Fin Función ObetenerCnx

      
    //public DataSet ObtenerDS(string pSql, string pTabla)
    //{
    //    con = cnx.ObtenerCnx();
    //    DataSet vlDS = new DataSet();
    //    SqlDataAdapter vlDa = new SqlDataAdapter(pSql, con);
    //    vlDa.SelectCommand.CommandTimeout = 0;
    //    vlDa.Fill(vlDS, pTabla);

    //    con.Close();
    //    return vlDS;
    //}


}//Fin Clase CnxBaseDeDatos
}//Fin Código Esdrinha 10