<%@ Page Title="ARKOS - Listado de Marcas" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="ListadoMarcas.aspx.cs" Inherits="ArkosWebApplication.WebForms.Catalogos.ListadoMarcas" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">
    <style>
        .grid-header {
            background-color: #212529;
            color: white;
        }
        .status-active {
            color: #198754;
            font-weight: 500;
        }
        .status-inactive {
            color: #dc3545;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">
    <asp:UpdatePanel runat="server" ID="updatePanelPrincipal" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel runat="server" ID="panelContenedorPrincipal" CssClass="container-large pt-4 pb-2" 
                Style="padding-left:30px; padding-right:30px; border:1px solid #EEEEEE;">

                <h3>Catálogo de Marcas</h3>

                <asp:UpdatePanel runat="server" ID="panelControlesPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
                    <ContentTemplate>
                        <div class="row mt-4 mb-4">
                            <div class="col-12 col-md-12 col-lg-12">
                                <asp:LinkButton runat="server" ID="btnNuevaMarca" OnClick="btnNuevaMarca_Click" CssClass="btn btn-dark position-relative me-3">
                                    <i class="bi bi-plus-circle"></i>
                                    Nueva marca
                                </asp:LinkButton>

                                <button type="button" onclick="window.location.replace('/WebForms/Empleado/Principal.aspx')" class="btn btn-light position-relative ms-3 float-end p-0 text-center" style="width:40px; background-color:#6c757d; color:#ffffff">
                                    <i class="bi bi-house m-0 float-none"></i>
                                </button>

                                <button type="button" class="btn btn-light position-relative ms-3 float-end">
                                    Activas: <asp:Label runat="server" ID="lblMarcasActivas" Text="0"/> marcas
                                </button>

                                <button type="button" class="btn btn-light position-relative ms-3 float-end">
                                    Total: <asp:Label runat="server" ID="lblTotalMarcas" Text="0"/> marcas
                                </button>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="updateGridMarcas" UpdateMode="Conditional" ChildrenAsTriggers="false" style="overflow-x:auto">
                                    <ContentTemplate>
                                        <asp:GridView runat="server" ID="gvMarcas" AutoGenerateColumns="false" Font-Size="Small"
                                            Style="margin-bottom:20px" CssClass="table table-striped paginated"
                                            RowStyle-CssClass="data-row"
                                            HeaderStyle-Height="60" HeaderStyle-CssClass="grid-header" ShowHeaderWhenEmpty="true"
                                            HeaderStyle-ForeColor="White"
                                            AllowPaging="true" PageSize="20" PagerSettings-Mode="Numeric" PagerSettings-Position="TopAndBottom"
                                            OnPageIndexChanging="gvMarcas_PageIndexChanging"
                                            OnRowCommand="gvMarcas_RowCommand"
                                            EmptyDataText="<div class='text-center' style='padding:20px; border:1px solid #DFDFDF'><i class='bi bi-box-arrow-in-down-right' style='font-size:80px; color:#465665; opacity:0.5'></i><br/><span style='color:#7d8082; font-size:14px'>NO SE ENCONTRARON MARCAS REGISTRADAS</span></div>"
                                            EmptyDataRowStyle-Font-Size="Medium" EmptyDataRowStyle-BackColor="Transparent" EmptyDataRowStyle-Height="80px">
                                            <Columns>
                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="80" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:80px; color:white !important; font-weight:600; line-height:40px">ID</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridMarcasId" Text='<%# Eval("Id") %>' Style="font-weight:400"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-start" ItemStyle-Width="240" HeaderStyle-CssClass="text-start text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:240px; color:white !important; font-weight:600; line-height:40px">NOMBRE</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridMarcasNombre" Text='<%# Eval("Nombre") %>' Style="font-weight:700; font-size:13px"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">ESTADO</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class='<%# (bool)Eval("Activo") ? "status-active" : "status-inactive" %>'>
                                                            <i class='bi <%# (bool)Eval("Activo") ? "bi-check-circle-fill" : "bi-x-circle-fill" %>'></i>
                                                            <%# (bool)Eval("Activo") ? "Activa" : "Inactiva" %>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center bg-light" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">PROVEEDORES</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridMarcasProveedores" Text='<%# ((ICollection<ArkosWebApplication.Models.Proveedores.Proveedor>)Eval("Proveedores")).Count %>' Style="font-weight:400"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">REGISTRO</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblGridMarcasFecha" Text='<%# ((DateTime)Eval("FechaRegistro")).ToString("dd/MM/yyyy") %>' Style="font-weight:400"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="true" ItemStyle-CssClass="text-center" ItemStyle-Width="120" HeaderStyle-CssClass="text-center text-white">
                                                    <HeaderTemplate>
                                                        <div style="min-width:120px; color:white !important; font-weight:600; line-height:40px">ACCIONES</div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="btnGridMarcasEditar" CommandName="EditarMarca" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-dark" Style="width:100px">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content> 