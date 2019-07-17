<%@ Page Title="" Language="VB" MasterPageFile="~/Usuarios.master" AutoEventWireup="false" CodeFile="Info_Bienes.aspx.vb" Inherits="Info_Bienes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
             <form id="form1" runat="server">  
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
                                          Bienvenido al sistema de consulta de Equipos de IDECOAS-FHIS, aqui puedes ver la lista de tus equipos e ir a realizar observaciones.
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 profile-stats">
                                        <div class="row">
                                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><asp:Label ID="lblTotEq" runat="server"></asp:Label></div>
                                                <div class="stats-title">Cantidad De Equipos</div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                                <div class="stats-value pink"><asp:Label ID="lblCT" runat="server"></asp:Label></div>
                                                <div class="stats-title">Costo Total De Los Equipos </div>
                                            </div>         
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 stats-col">
                                               <div class="stats-value pink"><img src="imagenes/logo_goh.jpg" alt=""/></div> 
                                            </div>
                                        </div>
                                    <%--    <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                                Mis Equipos
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                              <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="True"></asp:Label>: <strong><asp:Label ID="lblanio" runat="server" Text="Label"></asp:Label></strong>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 inlinestats-col">
                                               <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True"></asp:Label>: <strong><asp:Label ID="lblanio2" runat="server" Text="Label"></asp:Label></strong>
                                            </div>
                                        </div>--%>
                                    </div>
                                    </div>
                                </div>
                      </div>
                  </div>
        </div>
                  <%--<div class="page-body">
                    <div class="row">
                        <div class="col-md-12">--%>
             <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                                      <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blue">
                           <span class="widget-caption">Lista De Mis Equipos</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                       
                                 <asp:GridView ID="GvInfG" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%">
                                     <HeaderStyle BackColor="#3399FF" ForeColor="Black" HorizontalAlign="Justify" />
                                      <Columns>
                                 <asp:BoundField DataField="Cod_Inv" HeaderText="Cod_Inv"  />
                                <asp:BoundField DataField="Cod_Eti" HeaderText="Cod_Eti" />
                                 <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                                 <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                                 <asp:BoundField DataField="Marca" HeaderText="Marca" />
                                 <asp:BoundField DataField="Serie" HeaderText="Serie" />
                                <asp:BoundField DataField="Costo_Actual" HeaderText="Costo_Actual" />
                                 
                               
                                 
                                          <asp:ButtonField CommandName="btnReObs" Text="Realizar Observacion" />
                               
                                 
                           </Columns>
                                   </asp:GridView>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                                        </div>
                                          </div>
                                </div>
                     </div>
                 
                     <%--</div>
                                </div>
                     </div>--%>
                 <asp:Label ID="LblUsu" runat="server" Visible="false" Text="Label"></asp:Label>
                 </form>
                

</asp:Content>

