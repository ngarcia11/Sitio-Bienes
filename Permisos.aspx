<%@ Page Title="" Language="VB" MasterPageFile="~/Director.master" AutoEventWireup="false" CodeFile="Permisos.aspx.vb" Inherits="Permisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form id="frmPermisos" runat="server"  role="form">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success alert-dismissable" id="dvExito" runat="server" visible="false" style="text-align: center">
                <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-check"></i>
                <strong>Éxito : </strong>Haz Realizado La Consulta Correctamente.
                <asp:Timer ID="tmExito" runat="server" Interval="3000" Enabled="false"></asp:Timer>
            </div>
          <div class="alert alert-warning alert-dismissable" id="dvAdvertencia" runat="server" visible="false" style="text-align: center">
                 <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-warning"></i>
                <strong>Advertencia: </strong>No puedes dejar campos vacios
                <asp:Label ID="lblAdvertencia" runat="server"></asp:Label>
            </div>
           <div class="alert alert-danger alert-dismissable" id="dvError" runat="server" visible="false" style="text-align: center">
       <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-times"></i>
                <strong>NOTA: </strong> Desabilitado Con Éxito 
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </div>
 <div class="page-body">      
                 <div class="row">
                                <div class="col-lg-12 col-sm-12 col-xs-12">
                                    <%--<button type="submit" id="BtnRegistar" runat="server"  class="btn btn-blue">Registrar</button>
                                                        --%>
                                    <div class="row">
                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                              
                                            <div class="widget flat radius-bordered">
                                                <div class="widget-header bg-danger">
                                                    <span class="widget-caption">Usuarios</span>
                                                </div>
                                                <div class="widget-body">
                                                    <div id="registration-form">
                                                      
                                                            <div class="form-title">
                                                               Crea nuevos Usuarios
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="input-icon icon-right">
                                                                    <asp:TextBox ID="txtUsuario" class="form-control" runat="server" placeholder="Usuario"></asp:TextBox>
                                                                   <%-- <input type="text" class="form-control"  runat="server" id="txtUsuario" placeholder="Usuario"/>--%>
                                                                    <i class="glyphicon glyphicon-user circular"></i>
                                                                </span>
                                                            </div>
                                                            <div class="form-group">
                                                                <span class="input-icon icon-right">
                                                                    <input type="text" class="form-control"  runat="server" id="txtpass" placeholder="Clave"/>
                                                                    <i class="fa fa-lock circular"></i>
                                                                </span>
                                                            </div>
                                                          <div class="form-group">
                                                                <span class="input-icon icon-right">
                                                                    <asp:DropDownList ID="ddlNivel" runat="server" class="form-control">
                                                                        <asp:ListItem Value="0">Soporte</asp:ListItem>
                                                                        <asp:ListItem Value="1">Administrador</asp:ListItem>
                                                                        <asp:ListItem Value="2">Admin Bienes </asp:ListItem>
                                                                        <asp:ListItem Value="3">Empleado Bienes</asp:ListItem>
                                                                </asp:DropDownList>
                                                                   
                                                                </span>
                                                            </div>
                                                        <asp:Button ID="BtnRegistar"  class="btn-danger"  runat="server" Text="Registrar" />
                                                            <%--<button type="submit" id="BtnRegistar" runat="server"  class="btn btn-blue">Registrar</button>
                                                        --%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         </div>
                                    <div class ="row">
                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blueberry">
                           <span class="widget-caption">Usuarios</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                       
                                 <asp:GridView ID="gvUsua" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                       <AlternatingRowStyle BackColor="White" />
                                       <Columns>
                                       <asp:BoundField DataField="Usuario" HeaderText="Usuario"  />
                                     <asp:BoundField DataField="Contraseña" HeaderText="Contraseña"  />
                                   <asp:BoundField DataField="Nivel" HeaderText="Nivel"  />  
                                 <asp:BoundField DataField="Estado" HeaderText="Estado"  />
                                 
                                           <asp:ButtonField ButtonType="Button" CommandName="btnModi" Text="Modificar">
                                           <ControlStyle CssClass="btn-active" />
                                           </asp:ButtonField>
                                           <asp:ButtonField ButtonType="Button" CommandName="btnEliminar" Text="Desactivar">
                                           <ControlStyle CssClass="btn-danger" />
                                           </asp:ButtonField>
                                 
                           </Columns>
                                     <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                     <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Justify" Font-Bold="True" />
                             
                                     <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                     <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                                     <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                     <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                     <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                     <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                     <SortedDescendingHeaderStyle BackColor="#820000" />
                             
                                   </asp:GridView>
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
                                                      <asp:Label ID="LblCodBita" runat="server" Visible ="false"  Text="Label"></asp:Label>
                                                       <asp:Label ID="LblUsu" runat="server"  Visible ="false" Text="Label"></asp:Label>
                        </div>
                                        </div>
                                          </div>
                                </div>
                     </div>

          </form>
    <!--Basic Scripts-->
   
    
</asp:Content>

