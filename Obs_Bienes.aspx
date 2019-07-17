<%@ Page Title="" Language="VB" MasterPageFile="~/Usuarios.master" AutoEventWireup="false" CodeFile="Obs_Bienes.aspx.vb" Inherits="Obs_Bienes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server"> 
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success alert-dismissable" id="dvExito" runat="server" visible="false" style="text-align: center">
                <button class="close" data-dismiss ="alert" ><span>&times;</span></button>
                <i class="fa-fw fa fa-check"></i>
                <strong>Exito: </strong>Guardado Correctamente.
                <asp:Timer ID="tmExito" runat="server" Interval="3000" Enabled="false"></asp:Timer>
            </div>
      
     <div class="page-body">
         <div class="row">
               <asp:Label ID="LblCodBita" runat="server" Visible ="false"  Text="Label"></asp:Label>
             <asp:Label ID="LblNomEmp" runat="server" Visible ="false" Text="Label"></asp:Label>
         <div class ="row">
                 <div class="col-md-12">
                <div class="profile-body">
                   <div class="col-lg-12">
                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
             <asp:Label ID="LblCodObs" runat="server" Visible="false" Text="Label"></asp:Label>
             <asp:Label ID="LblCodUsu" runat="server"  Visible="false" Text="Label"></asp:Label>
             <asp:Label ID="LblCodInv" runat="server" Visible="false" Text="Label"></asp:Label>
                      <div class="widget-header bordered-bottom bordered-blue">
                           <span class="widget-caption">Mis Equipos</span>
                      </div>
                      <div class="widget-body">
                        <div>
                            <h6>Lista de mis equipos cargados:</h6>
                            <asp:DropDownList ID="ddlEquipo" runat="server" Width="100%" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Descripcion" DataValueField="Cod_Inv"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="VerEquiDDL" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="LblCodUsu" Name="emp" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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
                              
                                       <div class="widget-header bordered-bottom bordered-green">
                           <span class="widget-caption">Mis Observaciones</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                       
                                 <asp:GridView ID="gvobs" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%">
                                     <HeaderStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Justify" />
                                     
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
                                   <div class="widget">
                                          <%-- <div class="col-lg-6 col-sm-6 col-xs-12">--%>
                                            <div class="widget flat radius-bordered">
                                                <div class="widget-header bg-blue">
                                                    <span class="widget-caption">Notas</span>
                                                </div>
                                                <div class="widget-body">
                                                    <div id="registration-form">
                                                       
                                                            <div class="form-title">
                                                                Ingresa Tus Notas
                                                            </div>
                                                     
                                                                <div class="row">
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        <label for="txtUsuario">Usuario</label>
                                                                        <span class="input-icon icon-right">
                                                                            <input type="text" runat="server" class="form-control" readonly="readonly" id="txtUsuario"/>
                                                                            <i class="glyphicon glyphicon-user blue"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        <label for="ttaNotas">Escribe tu observación</label>
                                                                        <span class="input-icon icon-right">
                                                                            <textarea id="ttaNotas" runat="server" required class="form-control" rows="10"></textarea>
                                                                            <i class="glyphicon glyphicon-pencil darkorange"></i>
                                                                        </span>
                                                                       
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            
                                                           <%-- <button type="submit" runat="server" id="BtnGuardar" class="btn btn-blue">Guardar</button>--%>
                                                        <asp:Button ID="BtnGuardar" runat="server" class="btn btn-blue" Text="Guardar" />
                                                    </div>
                                                </div>
                                            </div>
                                       <%-- </div>--%>
                                    </div>
                       </div>
                  </div>
                    </div>
                  </div>
                      </div>
              <%--</div>--%>
                
             </div>
                      </div>
         </form>
</asp:Content>

