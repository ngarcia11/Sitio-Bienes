<%@ Page Title="" Language="VB" MasterPageFile="~/Director.master" AutoEventWireup="false" CodeFile="Aprobar_Diagnosticos.aspx.vb" Inherits="Aprobar_Diagnosticos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">  
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success alert-dismissable" id="dvExito" runat="server" visible="false" style="text-align: center">
                <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-check"></i>
                <strong>Bien Hecho: </strong>Realizado correctamente.
                <asp:Timer ID="tmExito" runat="server" Interval="3000" Enabled="false"></asp:Timer>
            </div>
      <div class="alert alert-danger alert-dismissable" id="dvError" runat="server" visible="false" style="text-align: center">
       <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-times"></i>
                <strong>NOTA: </strong> Error al realizar el Descargo
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
                                          Bienvenido al sistema de consulta de Equipos de IDECOAS-FHIS, aqui puedes realizar los descargos a los equipos.
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 profile-stats">
                                        <div class="row">
                                             <%--<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><asp:Label ID="lblAsignado" runat="server"></asp:Label></div>
                                                <div class="stats-title">Cantidad Asignada</div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><asp:Label ID="LblReal" runat="server"></asp:Label></div>
                                                <div class="stats-title">Cantidad Realizada</div>
                                            </div>      --%>  
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
                    <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                                      <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blueberry">
                           <span class="widget-caption">Aprobar Diagnosticos</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                        <asp:GridView ID="GvTrabajoAsi" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="CodDiag" HeaderText="CodDiag" SortExpression="CodDiag" />
                                                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                                                <asp:BoundField DataField="CodEmp" HeaderText="CodEmp" SortExpression="CodEmp" />
                                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ReadOnly="True" />
                                                <asp:BoundField DataField="Direccion" HeaderText="Direccion" SortExpression="Direccion" />
                                                <asp:BoundField DataField="Unidad" HeaderText="Unidad" SortExpression="Unidad" />
                                                <asp:BoundField DataField="Cod_Inv" HeaderText="Cod_Inv" SortExpression="Cod_Inv" />
                                                <asp:BoundField DataField="Cod_Eti" HeaderText="Cod_Eti" SortExpression="Cod_Eti" />
                                                 <asp:BoundField DataField="Cod_SIAFI" HeaderText="Cod_SIAFI" SortExpression="Cod_SIAFI" />
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                                <asp:BoundField DataField="Costo_Actual" HeaderText="Costo_Actual" SortExpression="Costo_Actual" />
                                                  <asp:ButtonField ButtonType="Button" CommandName="btnAsignar"  Text="Descargar" >
                                        
                                         <ControlStyle CssClass="btn-active" />
                                         </asp:ButtonField>
                                            </Columns>
                                            <EditRowStyle BackColor="#7C6F57" />
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#E3EAEB" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                                        </asp:GridView>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="VerDescagoSoporte" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="LblNomEmp" Name="usu" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        
                                        </div>
                                 </div>
                                        </div>
                                         </div>
                                         </div>
                                           </div>
                                        </div>
                        <asp:Label ID="LblAsig" runat="server" Visible="false" Text="Label"></asp:Label>
                         <asp:Label ID="LblInv" runat="server" Visible="false" Text="Label"></asp:Label>
                        <asp:Label ID="LblEmp" runat="server" Visible="false" Text="Label"></asp:Label>
                         <asp:Label ID="LblCodBita" runat="server" Visible ="false"  Text="Label"></asp:Label>
                         </div>
                    <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                   <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                                          <%-- </div>--%>
                                            <div class="widget flat radius-bordered">
                                                <div class="widget-header bg-carbon">
                                                    <span class="widget-caption">Información</span>
                                                </div>
                                                <div class="widget-body">
                                                    <div id="registration-form">
                                                       
                                                            <div class="form-title">
                                                                Datos del Equipo
                                                            </div>
                                                   
                                                                <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Modelo</label>
                                                                        <span class="input-icon icon-right">
                                                                            <asp:Label ID="LblModelo" runat="server" class="form-control" Text=""></asp:Label>                       
                                                                            <i class="glyphicon glyphicon-cloud carbon"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Fecha Compra</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblFchCom" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon glyphicon-calendar carbon"></i>
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
                                                                            <i class="glyphicon glyphicon-list carbon"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Marca</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblMarca" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon glyphicon-adjust carbon"></i>
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
                                                                            <i class="glyphicon glyphicon-calendar carbon"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                    <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Serie</label>
                                                                        <span class="input-icon icon-right">
                                                                             <asp:Label ID="LblSerie" runat="server" class="form-control" Text=""></asp:Label>    
                                                                            <i class="glyphicon  glyphicon-calendar carbon"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label for="ddlAsigEmp">Observacion</label>
                                                                        <span class="input-icon icon-right">
                                                                            <textarea id="ttaNotas" runat="server" class="form-control" rows="10"></textarea>
                                                                            <i class="glyphicon glyphicon-pencil darkorange"></i>
                                                                        </span>
                                                                       
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            
                                                           <%-- </div>--%>
                                                        <asp:Button ID="BtnGuardar" runat="server" class="btn btn-block" Text="Realizar" />
                                                    </div>
                                                </div>
                                            </div>
                                       <asp:Label ID="LblCodDesc" runat="server" Visible="false"  Text="Label"></asp:Label>
                                       <asp:Label ID="LblCodDia" runat="server" Visible="false"  Text="Label"></asp:Label>
                                       <%-- </div>--%>
                                    </div>
                       </div>
                  </div>
                    </div>
                  </div>
                      </div>
              </form>
</asp:Content>


