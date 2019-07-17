<%@ Page Title="" Language="VB" MasterPageFile="~/BienesAdmin.master" AutoEventWireup="false" CodeFile="Admin_Bienes.aspx.vb" Inherits="Admin_Bienes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form id="form1" runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success alert-dismissable" id="dvExito" runat="server" visible="false" style="text-align: center">
                <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-check"></i>
                <strong>Bien Hecho: </strong>Solicitudes realizadas correctamente.
                <asp:Timer ID="tmExito" runat="server" Interval="3000" Enabled="false"></asp:Timer>
            </div>
      <div class="alert alert-danger alert-dismissable" id="dvError" runat="server" visible="false" style="text-align: center">
       <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-times"></i>
                <strong>NOTA: </strong> Solicitud Cancelada
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>  
                  <div class="page-body">
                <div class="row">
                 <div class="col-md-12">
                            <div class="profile-container">
                                <div class="profile-header row">
                                    <div class="col-lg-2 col-md-4 col-sm-12 text-center">
                                         <asp:TextBox ID="imagen" Visible="false" runat="server"></asp:TextBox>
                                        <img src="imagenes/logo.jpg" alt="" class="header-avatar" />
                                    </div>
                                    <div class="col-lg-5 col-md-8 col-sm-12 profile-info">
                                        <div class="header-fullname"><asp:Label ID="LblNomEmp" runat="server" Text="Label"></asp:Label></div>
                                      
                                        <div class="header-information">
                                          Bienvenido al sistema de consulta de Equipos de IDECOAS-FHIS, aqui puedes ver la lista de solicitudes de diagnósticos y asignar trabajo.
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 profile-stats">
                                        <div class="row">
                                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><asp:Label ID="lblToSoli" runat="server"></asp:Label></div>
                                                <div class="stats-title">Cantidad De Solicitudes</div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><img src="imagenes/logo_kfw.jpg" alt=""/></div>
                                                <%-- <div class="col-lg-6 col-sm-6 col-xs-12">--%>
                                            </div>         
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                               <div class="stats-value pink"><img src="imagenes/logo_goh.jpg" alt=""/></div> 
                                            </div>
                                        </div>
                                    
                                    </div>
                                    </div>
                                </div>
                      </div>
                  </div>
        </div>
          <div class="row">
                <div class="profile-body">
                     <div class="col-md-12">
                         <div class="col-lg-12">
               <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-azure">
                                            <div class="databox-piechart">

                                               <%-- <asp:TextBox ID="porcentaje" Visible="false" runat="server"></asp:TextBox>--%>
                                                <asp:HiddenField ID="hfI1" runat="server" />  <asp:HiddenField ID="hfI2" runat="server" /> 
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="<% =hfI1.Value %>" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="#7fe2fa"><span class="white font-90"><% =hfI1.Value %>%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number azure"><% =hfI1.Value %>/<% =hfI2.Value %></span>
                                            <div class="databox-text darkgray">Ingris Marquez : <asp:Label ID="lblFechaAvance" runat="server"></asp:Label></div>
                                            <div class="databox-state bg-azure">
                                                <i class="fa fa-bar-chart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                 </div>
              <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-azure">
                                            <div class="databox-piechart">
                                               <asp:HiddenField ID="hfK1" runat="server" />  <asp:HiddenField ID="hfK2" runat="server" /> 
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="<% =hfK1.Value %>" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="#7fe2fa"><span class="white font-90"><% =hfK1.Value %>%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number azure"><% =hfK1.Value %>/<% =hfK2.Value %></span>
                                            <div class="databox-text darkgray">Kevin Carranza: <asp:Label ID="Label2" runat="server"></asp:Label></div>
                                            <div class="databox-state bg-azure">
                                                <i class="fa fa-bar-chart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                 </div>
             <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-azure">
                                            <div class="databox-piechart">
                                                <asp:HiddenField ID="hfM1" runat="server" />  <asp:HiddenField ID="hfM2" runat="server" /> 
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="<% =hfM1.Value %>" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="#7fe2fa"><span class="white font-90"><% =hfM1.Value %>%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number azure"><% =hfM1.Value %>/<% =hfM2.Value %></span>
                                            <div class="databox-text darkgray">Marco Mendoza: <asp:Label ID="Label3" runat="server"></asp:Label></div>
                                            <div class="databox-state bg-azure">
                                                <i class="fa fa-bar-chart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                 </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-azure">
                                            <div class="databox-piechart">
                                               <asp:HiddenField ID="hfS1" runat="server" />  <asp:HiddenField ID="hfS2" runat="server" /> 
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="<% =hfS1.Value %>" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="#7fe2fa"><span class="white font-90"><% =hfS1.Value %>%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number azure"><% =hfS1.Value %>/<% =hfS2.Value %></span>
                                            <div class="databox-text darkgray">Sandra Funez: <asp:Label ID="Label4" runat="server"></asp:Label></div>
                                            <div class="databox-state bg-azure">
                                                <i class="fa fa-bar-chart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                 </div>
          </div>
               </div>
          </div>
           </div>
          <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                                      <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blue">
                           <span class="widget-caption">Lista De Solicitudes</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                       
                                 <asp:GridView ID="GvBienesSoli" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1">
                                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                     <Columns>
                                         <asp:BoundField DataField="CodSoli" HeaderText="CodSoli" SortExpression="CodSoli" />
                                         <asp:BoundField DataField="Nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="Nombre" />
                                         <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                                         <asp:BoundField DataField="Unidad" HeaderText="Unidad" SortExpression="Unidad" />
                                         <asp:BoundField DataField="Cod_Inv" HeaderText="Cod_Inv" SortExpression="Cod_Inv" />
                                         <asp:BoundField DataField="Cod_Eti" HeaderText="Cod_Eti" SortExpression="Cod_Eti" />
                                         <asp:BoundField DataField="Cod_SIAFI" HeaderText="Cod_SIAFI" SortExpression="Cod_SIAFI" />
                                         <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                         <asp:BoundField DataField="Costo_Actual" HeaderText="Costo_Actual" SortExpression="Costo_Actual" />
                                         <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                         <asp:ButtonField ButtonType="Button" CommandName="btnAsignar"  Text="Asignar" >
                                        
                                         <ControlStyle CssClass="btn-active" />
                                         </asp:ButtonField>
                                     </Columns>
                                     <EditRowStyle BackColor="#999999" />
                                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#5D7B9D" ForeColor="White" HorizontalAlign="Justify" Font-Bold="True" />
                                  
                                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                   </asp:GridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="VerSoliBienes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                                        </div>
                                          </div>
                                </div>
                     </div>
                 <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                   <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                                          <%-- <button type="submit" runat="server" id="BtnGuardar" class="btn btn-blue">Guardar</button>--%>
                                            <div class="widget flat radius-bordered">
                                                <div class="widget-header bg-blue">
                                                    <span class="widget-caption">Infromación</span>
                                                </div>
                                                <div class="widget-body">
                                                    <div id="registration-form">
                                                       
                                                            <div class="form-title">
                                                                Asignación De Trabajo
                                                            </div>
                                                   
                                                                <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Modelo</label>
                                                                        <span class="input-icon icon-right">
                                                                            <asp:Label ID="LblModelo" runat="server" class="form-control" Text=""></asp:Label>                       
                                                                            <i class="glyphicon glyphicon-cloud blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Fecha Compra</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblFchCom" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon glyphicon-calendar blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                         <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Garantia</label>
                                                                        <span class="input-icon icon-right">
                                                                            <asp:Label ID="LblGarantia" runat="server" class="form-control" Text=""></asp:Label>                       
                                                                            <i class="glyphicon glyphicon-list blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Marca</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblMarca" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon glyphicon-adjust blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                         <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Meses Garantia</label>
                                                                        <span class="input-icon icon-right">
                                                                            <asp:Label ID="LblMeses" runat="server" class="form-control" Text=""></asp:Label>                       
                                                                            <i class="glyphicon glyphicon-calendar blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Serie</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblSerie" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon  glyphicon-calendar blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label for="ddlAsigEmp">Asignar Empleado</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:DropDownList ID="ddlAsigEmp" runat="server"  class="form-control" placeholder="Mi Equipos">
                                                                                 <asp:ListItem>IngrisMarquez</asp:ListItem>
                                                                                 <asp:ListItem>KevinCarranza</asp:ListItem>
                                                                                 <asp:ListItem>SandraFunez</asp:ListItem>
                                                                                 <asp:ListItem>MarcoMendoza</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                  
                                                                        </span>
                                                                       
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            
                                                           <%-- </div>--%>
                                                        <asp:Button ID="BtnGuardar" runat="server" class="btn-blue" Text="Asignar" />
                                                    </div>
                                                </div>
                                            </div>
                                       <asp:Label ID="LblCodCarga" runat="server" Visible="false"  Text="Label"></asp:Label>
                                       <asp:Label ID="LblCodSoli" runat="server" Visible="false"  Text="Label"></asp:Label>
                                       <%-- </div>--%>
                                    </div>
                       </div>
                  </div>
                    </div>
                  </div>
                      </div>
                 
                 <asp:Label ID="LblUsu" runat="server" Visible="false" Text="Label"></asp:Label>
          </form> 

</asp:Content>
