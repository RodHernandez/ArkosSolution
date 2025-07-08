<%@ Page Title="ARKOS - Listado de Proveedores" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="ListadoProveedores.aspx.cs" Inherits="ArkosWebApplication.WebForms.Empleado.Proveedores.ListadoProveedores" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">

    <asp:UpdatePanel runat="server" ID="updatePanelPrincipal" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:Panel runat="server" ID="panelContenedorPrincipal" CssClass="container-large pt-4 pb-2" Style="padding-left:30px; padding-right:30px; border:1px solid #EEEEEE;">

                <h3><asp:Label runat="server" ID="labelTituloPagina" Text="Catálogo de proveedores"></asp:Label></h3>

                <asp:UpdatePanel runat="server" ID="panelControlesPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>

                        <div class="row mt-4 mb-4">
                            <div class="col-12 col-md-12 col-lg-12">

                                <button type="button" class="btn btn-primary position-relative me-3">
                                    Pendientes de verificación
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">4
                                    <span class="visually-hidden">unread messages</span>
                                    </span>
                                </button>

                                <button type="button" class="btn btn-secondary position-relative me-3">
                                    Notificaciones
                                    <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger rounded-circle">
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </button>

                                <asp:LinkButton runat="server" ID="buttonNuevoProducto" OnClick="btnNuevoProveedor_Click" CssClass="btn btn-dark position-relative me-3">
                                    <i class="bi bi-plus-circle"></i>
                                    Nuevo proveedor
                                </asp:LinkButton>

                                <button type="button" onclick="window.location.replace('/Router/RouteProfile')" class="btn btn-light position-relative ms-3 float-end p-0 text-center" style="width:40px; background-color:#6c757d; color:#ffffff">
                                    <i class="bi bi-house m-0 float-none"></i>
                                </button>

                                <button type="button" class="btn btn-light position-relative ms-3 float-end">
                                    Verificados: 4 proveedores
                                </button>

                                <button type="button" class="btn btn-light position-relative ms-3 float-end">
                                    Registrados: 5 proveedores
                                </button>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="updateGridProveedores" UpdateMode="Conditional" ChildrenAsTriggers="false" style="overflow-x:auto">
                                    <ContentTemplate>
                                        <asp:GridView runat="server" ID="gridProveedores" AutoGenerateColumns="false" Font-Size="Small"
                                            Style="margin-bottom:20px" CssClass="table table-striped paginated"
                                            RowStyle-CssClass="data-row"
                                            HeaderStyle-Height="60" HeaderStyle-CssClass="grid-header" ShowHeaderWhenEmpty="true"
                                            HeaderStyle-ForeColor="White"
                                            AllowPaging="true" PageSize="20" PagerSettings-Mode="Numeric" PagerSettings-Position="TopAndBottom"
                                            OnPageIndexChanging="gridProveedores_PageIndexChanging"
                                            EmptyDataText="<div class='text-center' style='padding:20px; border:1px solid #DFDFDF'><i class='bi bi-box-arrow-in-down-right' style='font-size:80px; color:#465665; opacity:0.5'></i><br/><span style='color:#7d8082; font-size:14px'>NO SE ENCONTRARON PROVEEDORES REGISTRADOS</span></div>"
                                            EmptyDataRowStyle-Font-Size="Medium" EmptyDataRowStyle-BackColor="Transparent" EmptyDataRowStyle-Height="80px">
                                            <Columns>
                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="80" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:80px; color:white !important; font-weight:600; line-height:40px">CÓDIGO</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridProveedoresId" Text='<%# Eval("CodigoProveedor") %>' Style="font-weight:400"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center bg-light" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">RFC</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridProveedoresRfc" Text='<%# Eval("RFC") %>' Style="font-weight:400; font-size:13px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-start" ItemStyle-Width="240" HeaderStyle-CssClass="text-start text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:240px; color:white !important; font-weight:600; line-height:40px">RAZÓN SOCIAL</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridProveedoresRazonSocial" Text='<%# Eval("RazonSocial") %>' Style="font-weight:700; font-size:13px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-start" HeaderStyle-CssClass="text-start text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:180px; color:white !important; font-weight:600; line-height:40px">NOMBRE COMERCIAL</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridProveedoresNombreComercial" Text='<%# Eval("NombreComercial") %>' CssClass=""></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center bg-light" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">TIPO</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridProveedoresTipo" Text='<%# Eval("TipoProveedor") %>' Style="font-weight:400"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">ACCIONES</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnGridProveedoresEditar" CommandName="EditarProveedor" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-dark" Style="width:100px">
                                                            <i class="bi bi-pencil-square" style="margin-right:4px"></i>
                                                            Editar
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

            </asp:Panel>


            <div class="container-fluid pt-4 pb-2">
               

                
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContainer" runat="server">
</asp:Content> 