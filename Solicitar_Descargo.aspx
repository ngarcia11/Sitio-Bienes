<%@ Page Title="" Language="VB" MasterPageFile="~/Usuarios.master" AutoEventWireup="false" CodeFile="Solicitar_Descargo.aspx.vb" Inherits="Solicitar_Descargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <script src="Scripts/jquery-1.7.1.js"></script>
    <script Language="javascript" type="text/javascript">
        function SelectAllCheckboxes(chk) {
            var totalRows = $("#<%=gvEquipos.ClientID %> tr").length;
            var selected = 0;
            $('#<%=gvEquipos.ClientID %>').find("input:checkbox").each(function () {
                if (this != chk) {
                    this.checked = chk.checked;
                    selected += 1;
                }
            });
        }

        function CheckedCheckboxes(chk) {
            if (chk.checked) {
                var totalRows = $('#<%=gvEquipos.ClientID %> :checkbox').length;
                var checked = $('#<%=gvEquipos.ClientID %> :checkbox:checked').length
                if (checked == (totalRows - 1)) {
                    $('#<%=gvEquipos.ClientID %>').find("input:checkbox").each(function () {
                        this.checked = true;
                    });
                }
                else {
                    $('#<%=gvEquipos.ClientID %>').find('input:checkbox:first').removeAttr('checked');
                }
            }
            else {
                $('#<%=gvEquipos.ClientID %>').find('input:checkbox:first').removeAttr('checked');
            }
        }

    </script>

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
                 <asp:Label ID="LblCodInv" runat="server" Visible="false" Text="Label"></asp:Label>
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
                                          Bienvenido al sistema de consulta de Equipos de IDECOAS-FHIS, aqui puedes ver la lista de los equipos que puedes solicitar para descargar.
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
                                        <%-- <input type="checkbox"/>--%>
                                    </div>
                                    </div>
                                </div>
                      </div>
                  </div>
        </div>
                 <%-- <input type="checkbox"/>--%>
                     <div class ="row">
                                   <div class="col-md-12">
                                      <div class="profile-body">
                                    <div class="col-lg-12">
                                                      <div class="col-xs-12 col-md-12">
                                   <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blue">
                           <span class="widget-caption">Equipos Disponible para hacer solicitud</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                       <asp:GridView ID="gvEquipos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource2">
                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="CodAsig" SortExpression="CodAsig">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CodAsig") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodAsig") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cod_Inv" SortExpression="Cod_Inv">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cod_Inv") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cod_Inv") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Cod_Eti" HeaderText="Cod_Eti" SortExpression="Cod_Eti" />
                                 <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                 <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                                <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" />
                                <asp:BoundField DataField="Costo_Actual" HeaderText="Costo_Actual" SortExpression="Costo_Actual" />
                                <asp:TemplateField HeaderText="Seleccionar">
                                   <HeaderTemplate>
                                 <div class="form-group">
                                      <div class="col-sm-offset-2 col-sm-10">
                                      <div class="checkbox">
                                      <label>
                                 <asp:CheckBox ID="CheckBox2" runat="server" onclick="javascript:SelectAllCheckboxes(this)"/>
                                          <span class="text">Seleccionar Todos.</span>
                                          </label>
                                          </div>
                                        </div>
                                   </div>
                             </HeaderTemplate>
                             <ItemTemplate>
                                        <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                  <div class="checkbox">
                                                         <label>
                                                       <asp:CheckBox ID="CheckBox1" runat="server" />
                                                         <%-- <input type="checkbox"/>--%>
                                                     <span class="text">Descargar.</span>
                                                           </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                 
                             </ItemTemplate>
                         </asp:TemplateField>
                           </Columns>
                           <EditRowStyle BackColor="#999999" />
                           <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                           <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                           <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                           <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                           <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                           <SortedAscendingCellStyle BackColor="#E9E7E2" />
                           <SortedAscendingHeaderStyle BackColor="#506C8C" />
                           <SortedDescendingCellStyle BackColor="#FFFDF8" />
                           <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>
                 
                       
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="VerParaSoli" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="LblUsu" Name="emp" PropertyName="Text" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                 
                       
                                    </div>
                                    <br />
                                     <asp:Button ID="BtnGuardar" runat="server" class="btn-blue" Text="Solicitar" /> 
                                  
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
                           <span class="widget-caption">Solicitudes de Descargo</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                        <asp:GridView ID="gvSolicitudes" runat="server" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="CodSoli" HeaderText="CodSoli" SortExpression="CodSoli" />
                                                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                                                <asp:BoundField DataField="Cod_Inv" HeaderText="Cod_Inv" SortExpression="Cod_Inv" />
                                                 <asp:BoundField DataField="Fecha" HeaderText="Fecha y Hora" SortExpression="Fecha" />
                                                <asp:BoundField DataField="Cod_Eti" HeaderText="Cod_Eti" SortExpression="Cod_Eti" />
                                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                                                <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                                               
                                                <asp:BoundField DataField="Serie" HeaderText="Serie" SortExpression="Serie" />
                                                <asp:BoundField DataField="Costo_Actual" HeaderText="Costo_Actual" SortExpression="Costo_Actual" />
                                                <asp:ButtonField ButtonType="Button" CommandName="btnCancelar" Text="Cancelar">
                                               
                                                <ControlStyle CssClass="btn-danger" />
                                               
                                                </asp:ButtonField>
                                            </Columns>
                                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                            <SortedDescendingHeaderStyle BackColor="#820000" />
                                        </asp:GridView>
                                   
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="VerSoli" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="LblUsu" Name="emp" PropertyName="Text" Type="Int32" />
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
                  <asp:Label ID="LblUsu" runat="server" Visible="false" Text="Label"></asp:Label>
                 <asp:Label ID="LblCodObs" runat="server" Visible="false" Text="Label"></asp:Label>
                 <asp:Label ID="LblCodAsig" runat="server" Visible="false" Text="Label"></asp:Label>
                 <%--</div>
                                </div>
                     </div>--%>
                  
                 </form>
   
</asp:Content>

