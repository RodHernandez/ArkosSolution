<%@ Page Title="ARKOS - Proveedores" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="AdministrarProveedor.aspx.cs" Inherits="ArkosWebApplication.WebForms.Empleado.Proveedores.AdministrarProveedor" ContentType="text/html;charset=utf-8" %>
<%@ OutputCache Location="None" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">
    <style>
        .uploadPanel {
            position: relative;
            height: 200px;
            width: 100%;
            border: 1px solid #dfdfdf;
        }
        .asyncUpload {
            position: absolute !important;
            top: 25px;
            right: 1px;
            width: 40px;
            height: 40px;
            z-index: 1000;
            opacity: 0;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">

    <asp:Panel runat="server" ID="panelContenedorPrincipal" CssClass="container-small pt-4 pb-2" 
        Style="padding-left:30px; padding-right:30px; border:1px solid #EEEEEE; max-width:820px">

        <h3><asp:Label runat="server" ID="labelTituloPagina" Text="..."></asp:Label></h3>

        <asp:UpdatePanel runat="server" ID="panelControlesPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>

                <div class="row mt-4 mb-4">
                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">
                        <button type="button" class="d-non btn btn-dedalo position-relative me-3">
                            Proveedor
                        </button>

                        <button type="button" class="d-non btn btn-secondary disabled position-relative me-3">
                            <i class="bi bi-ban"></i>
                            Deshabilitar
                        </button>

                        <asp:LinkButton runat="server" ID="buttonRegresar" OnClientClick="window.location.href='ListadoProveedores.aspx'; return false;" CssClass="btn btn-dark position-relative ms-0 float-none float-lg-end text-end d-block">
                            <i class="bi bi-arrow-return-left" style="line-height:42px"></i>
                            Regresar al listado
                        </asp:LinkButton>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">
                        <div class="alert alert-secondary mt-2" role="alert">
                            <i class="bi bi-exclamation-circle float-start"></i>
                            Verifica la información antes de guardar los cambios
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="updateFormPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>

                <div class="row m-0">
                    <%-- COLUMNA IZQUIERDA --%>
                    <div class="col-12 col-md-12 col-lg-8 m-0 pe-3">
                        <div class="row mt-2">
                            <div class="col-12 col-md-6 col-lg-4 mb-3 p-0 pe-md-2">
                                <label class="form-label">RFC</label>
                                <asp:TextBox runat="server" ID="txtRFC" CssClass="form-control" autocomplete="off" placeholder="RFC"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6 col-lg-8 mb-3 p-0">
                                <label class="form-label">Razón Social</label>
                                <asp:TextBox runat="server" ID="txtRazonSocial" CssClass="form-control" autocomplete="off" placeholder="Razón Social"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Nombre Comercial</label>
                                <asp:TextBox runat="server" ID="txtNombreComercial" CssClass="form-control" autocomplete="off" placeholder="Nombre Comercial"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Página Web</label>
                                <asp:TextBox runat="server" ID="txtPaginaWeb" CssClass="form-control" TextMode="Url" autocomplete="off" placeholder="https://www.ejemplo.com"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6 col-lg-8 mb-3 p-0 pe-md-2">
                                <label class="form-label">CLABE Bancaria</label>
                                <asp:TextBox runat="server" ID="txtClabeBancaria" CssClass="form-control" MaxLength="18" autocomplete="off" placeholder="18 dígitos"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-3 p-0">
                                <label class="form-label">Banco</label>
                                <asp:DropDownList runat="server" ID="ddlBanco" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="002" Text="BANAMEX"></asp:ListItem>
                                    <asp:ListItem Value="012" Text="BBVA"></asp:ListItem>
                                    <asp:ListItem Value="014" Text="SANTANDER"></asp:ListItem>
                                    <asp:ListItem Value="021" Text="HSBC"></asp:ListItem>
                                    <asp:ListItem Value="072" Text="BANORTE"></asp:ListItem>
                                    <asp:ListItem Value="036" Text="INBURSA"></asp:ListItem>
                                    <asp:ListItem Value="042" Text="MIFEL"></asp:ListItem>
                                    <asp:ListItem Value="044" Text="SCOTIABANK"></asp:ListItem>
                                    <asp:ListItem Value="106" Text="BANK OF AMERICA"></asp:ListItem>
                                    <asp:ListItem Value="108" Text="MUFG"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 mt-4 mb-2">
                                <asp:LinkButton runat="server" ID="btnGuardar" CssClass="btn btn-dark float-end" OnClick="btnGuardar_Click">
                                    <i class="bi bi-check-circle me-2"></i>
                                    Guardar Proveedor
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <%-- COLUMNA DERECHA --%>
                    <div class="col-12 col-md-12 col-lg-4 m-0 ps-3">
                        <div class="row mt-2">
                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Código de Proveedor</label>
                                <i class="bi bi-lightning-charge"></i>
                                <asp:TextBox runat="server" ID="txtCodigoProveedor" Enabled="false" CssClass="form-control" autocomplete="off" placeholder="Código"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Tipo de Proveedor</label>
                                <asp:DropDownList runat="server" ID="ddlTipoProveedor" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Nacional"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Internacional"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0 position-relative" style="padding-top:4px !important">
                                <label class="form-label d-block" style="margin-bottom:2px">Logotipo</label>                                
                                <div class="uploadPanel">
                                    <asp:Image runat="server" Visible="true" ID="imageLogoDefault" CssClass="img-fluid p-5" Style="width:100%; height:200px; object-fit:contain; opacity:0.2" ImageUrl="https://pixsector.com/cache/517d8be6/av5c8336583e291842624.png" />
                                    <asp:Image runat="server" Visible="false" ID="imageLogo" CssClass="img-fluid p-2" Style="width:100%; height:200px; object-fit:contain" />
                                    <ajaxToolkit:AsyncFileUpload ID="asyncUploadLogo" runat="server" 
                                        CssClass="asyncUpload"
                                        OnUploadedComplete="asyncUploadLogo_UploadedComplete"
                                        OnClientUploadComplete="uploadComplete"
                                        OnClientUploadError="uploadError"
                                        OnClientUploadStarted="uploadStarted"
                                        CompleteBackColor="#FFFFFF"
                                        UploadingBackColor="#FFFFFF"
                                        ThrobberID="loader"
                                        Width="40"
                                        UploaderStyle="Traditional"
                                    />
                                    <asp:Image ID="loader" runat="server" ImageUrl="/Images/loading.gif" Style="display:none; position:absolute; top:50%; left:50%; transform:translate(-50%,-50%)" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- SECCIÓN DE CONTACTOS --%>
                <div class="row mt-5">
                    <div class="col-12">
                        <h4 class="position-relative" style="height:30px">                    
                            <div style="height:1px; border-bottom:1px solid #dfdfdf; position:absolute; top:14px; width:100%"></div>
                            <span class="bg-white pe-3" style="position:absolute">CONTACTOS DEL PROVEEDOR</span>
                        </h4>

                        <%-- Formulario de Contacto --%>
                        <asp:UpdatePanel runat="server" ID="updatePanelFormularioContacto" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row mt-4">
                                    <div class="col-12 col-md-6 col-lg-6 mb-3">
                                        <label class="form-label">Nombres</label>
                                        <asp:TextBox runat="server" ID="txtNombresContacto" CssClass="form-control" autocomplete="off" placeholder="Nombres"></asp:TextBox>
                                    </div>

                                    <div class="col-12 col-md-6 col-lg-6 mb-3">
                                        <label class="form-label">Apellidos</label>
                                        <asp:TextBox runat="server" ID="txtApellidosContacto" CssClass="form-control" autocomplete="off" placeholder="Apellidos"></asp:TextBox>
                                    </div>

                                    <div class="col-12 col-md-6 col-lg-6 mb-3">
                                        <label class="form-label">Correo Electrónico</label>
                                        <asp:TextBox runat="server" ID="txtEmailContacto" CssClass="form-control" TextMode="Email" autocomplete="off" placeholder="ejemplo@correo.com"></asp:TextBox>
                                    </div>

                                    <div class="col-12 col-md-6 col-lg-6 mb-3">
                                        <label class="form-label">Teléfono</label>
                                        <asp:TextBox runat="server" ID="txtTelefonoContacto" CssClass="form-control" autocomplete="off" placeholder="(55) 1234 5678"></asp:TextBox>
                                    </div>

                                    <div class="col-12 col-md-8 col-lg-8 mb-3">
                                        <label class="form-label">Puesto</label>
                                        <asp:DropDownList runat="server" ID="ddlPuestoContacto" CssClass="btn-dropdown form-control" autocomplete="off">
                                            <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Director General"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Gerente de Ventas"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Gerente de Compras"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Gerente de Finanzas"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="Coordinador de Logística"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="Representante Comercial"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="Ejecutivo de Cuenta"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="Asistente Administrativo"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="Contador"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="Otro"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-4 mb-3 d-flex align-items-end">
                                        <asp:LinkButton runat="server" ID="btnAgregarContacto" CssClass="btn btn-dark w-100" OnClick="btnAgregarContacto_Click">
                                            <i class="bi bi-plus-circle me-2"></i>
                                            Agregar Contacto
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <%-- Grid de Contactos --%>
                        <asp:UpdatePanel runat="server" ID="updatePanelContactos" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="row mt-4">
                                    <div class="col-12">
                                        <asp:GridView runat="server" ID="gridContactos" CssClass="table table-hover" AutoGenerateColumns="false"
                                            EmptyDataText="No hay contactos registrados" ShowHeaderWhenEmpty="true" OnRowCommand="gridContactos_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="NombreCompleto" HeaderText="Nombre Completo" />
                                                <asp:BoundField DataField="Puesto" HeaderText="Puesto" />
                                                <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
                                                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                                                <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="150px">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" CssClass="btn btn-sm btn-dark me-2" CommandName="EditarContacto" CommandArgument='<%# Eval("ID") %>'>
                                                            <i class="bi bi-pencil"></i>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton runat="server" CssClass="btn btn-sm btn-dark" CommandName="EliminarContacto" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('¿Está seguro de eliminar este contacto?');">
                                                            <i class="bi bi-trash"></i>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAgregarContacto" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </asp:Panel>

</asp:Content>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContainer" runat="server">
    <script type="text/javascript">
        function uploadStarted() {
            console.log('Upload started');
            $('#<%= loader.ClientID %>').show();
        }

        function uploadComplete(sender, args) {
            console.log('Upload complete');
            if (args.get_fileName()) {
                $('#<%= imageLogo.ClientID %>').attr('src', '<%= ResolveUrl("~/FileSystem/Proveedores/Logos/") %>' + args.get_fileName());
                $('#<%= imageLogo.ClientID %>').show();
                $('#<%= imageLogoDefault.ClientID %>').hide();
            }
            $('#<%= loader.ClientID %>').hide();
        }

        function uploadError(sender, args) {
            console.log('Upload error: ' + args.get_errorMessage());
            $('#<%= loader.ClientID %>').hide();
            alert('Error al cargar el archivo: ' + args.get_errorMessage());
        }

        // Agregar logs para verificar que el script se carga
        console.log('Script de upload inicializado');
    </script>
</asp:Content> 