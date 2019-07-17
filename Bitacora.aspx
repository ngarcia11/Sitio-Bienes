<%@ Page Title="" Language="VB" MasterPageFile="~/Director.master" AutoEventWireup="false" CodeFile="Bitacora.aspx.vb" Inherits="Bitacora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form id="frmBita" runat="server"  role="form">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
 <div class="page-body">      
                 <div class="row">
                                <div class="col-lg-12 col-sm-12 col-xs-12">
                        
                                    <div class ="row">
                                        <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <div class="widget">
                              
                                       <div class="widget-header bordered-bottom bordered-blueberry">
                           <span class="widget-caption">Bitacora De Registros</span>
                      </div> 
                                <div class="widget-body">
                                   
                                    <div class="flip-scroll">
                                       
                                 <asp:GridView ID="gvUsua" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover dataTables-example dataTable dtr-inline" Width="100%" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" DataSourceID="SqlDataSource1">
                                       <AlternatingRowStyle BackColor="White" />
                                       <Columns>
                                       <asp:BoundField DataField="AcciBita" HeaderText="Accion Realizada" SortExpression="AcciBita"  />
                                     <asp:BoundField DataField="FchBita" HeaderText="Fecha y Hora" SortExpression="FchBita"  />
                                   <asp:BoundField DataField="UsuarioBita" HeaderText="Usuario" SortExpression="UsuarioBita"  />  
                                 
                           </Columns>
                                     <FooterStyle BackColor="#CCCC99" />
                                     <HeaderStyle BackColor="#6B696B" ForeColor="White" HorizontalAlign="Justify" Font-Bold="True" />
                             
                                     <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                     <RowStyle BackColor="#F7F7DE" />
                                     <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                     <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                     <SortedAscendingHeaderStyle BackColor="#848384" />
                                     <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                     <SortedDescendingHeaderStyle BackColor="#575357" />
                             
                                   </asp:GridView>
                                      
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReplicaBienesConnectionString %>" SelectCommand="SELECT [AcciBita], [FchBita], [UsuarioBita] FROM [BitacoraWeb]"></asp:SqlDataSource>
                                      
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
          </div>
          </form>
    <!--Basic Scripts-->
   
    
</asp:Content>


