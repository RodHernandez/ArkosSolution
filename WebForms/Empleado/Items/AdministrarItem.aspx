<%@ Page Title="ARKOS - Items" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="AdministrarItem.aspx.cs" Inherits="ArkosWebApplication.WebForms.Empleado.Items.AdministrarItem" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">

    <%-- CONTENIDO HEAD --%>

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">

    <asp:Panel runat="server" ID="panelContenedorPrincipal" CssClass="container-small pt-4 pb-2" 
        Style="padding-left:30px; padding-right:30px; border:1px solid #EEEEEE; max-width:820px" >

        <h3><asp:Label runat="server" ID="labelTituloPagina" Text="..."></asp:Label></h3>

        <asp:UpdatePanel runat="server" ID="panelControlesPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>

                <div class="row mt-4 mb-4">

                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">

                        <button type="button" class="d-non btn btn-dedalo position-relative me-3">
                            Item
                        </button>

                        <button type="button" class="d-non btn btn-secondary disabled position-relative me-3">
                            <i class="bi bi-ban"></i>
                            Deshabilitar
                        </button>

                        <asp:LinkButton runat="server" ID="buttonRegresar" OnClientClick="window.location.replace('/Router/RouteProfile')" CssClass="btn btn-dark position-relative ms-0 float-none float-lg-end text-end d-block">
                            <i class="bi bi-arrow-return-left" style="line-height:42px"></i>
                            Regresar al menú
                        </asp:LinkButton>

                    </div>

                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">

                        <div class="alert alert-secondary mt-2" role="alert">
                            <i class="bi bi-exclamation-circle float-start"></i>
                            Verifica la información antes de guardar los cambios
                        </div>

                        <div class="alert alert-danger mt-1 mb-2" role="alert">
                            <strong>Modo de pruebas:</strong> La información registrada en esta sección está definida únicamente para fines de prueba, ninguno de los items coincide necesariamente con datos reales.
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

                            <div class="col-12 col-md-12 col-lg-4 mb-3 p-0 pe-md-2">
                                <label class="form-label">Clave</label>
                                <asp:TextBox runat="server" ID="labelClave" CssClass="form-control" autocomplete="off" placeholder="Clave"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-8 mb-3 p-0">
                                <label class="form-label">Código modelo</label>
                                <asp:TextBox runat="server" ID="labelCodigoModel" CssClass="form-control" autocomplete="off" placeholder="Código"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Marca</label>
                                <asp:DropDownList runat="server" ID="ddlMarca" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Illux"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Tecnolite"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Construlita"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 col-md-6 col-lg-8 mb-3 p-0 pe-md-2">
                                <label class="form-label">Proveedor</label>
                                <asp:DropDownList runat="server" ID="ddlPresentacion" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Bolsa chica"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Bolsa"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Caja"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-3 p-0">
                                <label class="form-label">Unidad</label>
                                <asp:DropDownList runat="server" ID="ddlUnidadMedida" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Gramos"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Kilogramos"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Piezas"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Cajas"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="Paquetes"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-3 p-0 pe-md-2">
                                <label class="form-label">Cantidad</label>
                                <asp:DropDownList runat="server" ID="ddlCantidadPresentacion" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="52"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="300"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="400"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="500"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="650"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 mb-3 p-0 pe-md-2">
                                <label class="form-label">Categoría</label>
                                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="btn-dropdown form-control" autocomplete="off">
                                    <asp:ListItem Value="" Text="Seleccionar"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Iluminación"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Acabados"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Servicio"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Transporte"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="Comida"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                             <div class="col-12 col-md-6 col-lg-8 mb-3 p-0">
                                <asp:LinkButton runat="server" ID="buttonNuevaPresentacion" Style="margin-top:23px" CssClass="btn btn-dark d-block position-relative ms-0 float-none float-lg-end text-end d-block">
                                    <i class="bi bi-plus" style="line-height:42px"></i>
                                    Nueva presentación
                                </asp:LinkButton>
                            </div>

                        </div>

                    </div>

                    <%-- COLUMNA DERECHA --%>

                    <div class="col-12 col-md-12 col-lg-4 m-0 ps-3">
                        
                        <div class="row mt-2">

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">SKU (Clave única)</label>
                                <i class="bi bi-lightning-charge"></i>
                                <asp:TextBox runat="server" ID="labelSkuProducto" Enabled="false" Text="COT-01-LDMSNEEI" CssClass="form-control" autocomplete="off" placeholder="SKU"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0 position-relative" style="padding-top:4px !important">
                                <label class="form-label d-block" style="margin-bottom:2px">Imagen</label>                                
                                <asp:Image runat="server" Visible="true" ID="imageFotoProductoDefault" CssClass="img-fluid p-5" Style="width:100%; border:1px solid #212121; height:200px; object-fit:contain; opacity:0.2" ImageUrl="https://pixsector.com/cache/517d8be6/av5c8336583e291842624.png" />
                                <asp:Image runat="server" Visible="false" ID="imageFotoProducto" CssClass="img-fluid p-2" Style="width:100%; border:1px solid #dfdfdf; height:200px; object-fit:contain" ImageUrl="https://www.cucinare.tv/wp-content/uploads/2020/03/Papas-fritas-de-paquete1.jpg" />
                                <asp:LinkButton runat="server" ID="buttonAgregarFotoProducto" CssClass="btn btn-light position-absolute p-0" Style="top:25px; right:1px; width:40px; border:none !important">
                                    <i class="bi bi-plus m-0 float-none" style="line-height:40px"></i>
                                </asp:LinkButton>
                            </div>

                            

                        </div>

                        

                    </div>

                </div>

                <%-- SECCIÓN CÓDIGOS QR --%>
                <h4 class="mt-4 position-relative" style="height:30px">                    
                    <div style="height:1px; border-bottom:1px solid #dfdfdf; position:absolute; top:14px; width:100%"></div>
                    <span class="bg-white pe-3" style="position:absolute">CÓDIGOS QR 2D</span>
                </h4>

                <div class="row mt-4">

                    <div class="col-12 col-md-12 col-lg-4 mb-3">
                        <label class="form-label d-block" style="margin-bottom:2px">Código QR (URL)</label>                                
                        <asp:Image runat="server" Visible="true" ID="imageUrlCodigoQR" CssClass="img-fluid p-2" Style="width:100%; border:1px solid #dfdfdf; height:200px; object-fit:contain" ImageUrl="https://www.fiamma.com.mx/wp-content/uploads/2022/10/LUMINARIO-ASTURIAS-60-1.jpg" />
                    </div>
                    
                    <div class="col-12 col-md-12 col-lg-4 mb-3">
                        <label class="form-label d-block" style="margin-bottom:2px">Código QR (SKU)</label>                                
                        <asp:Image runat="server" Visible="true" ID="imageSkuCodigoQR" CssClass="img-fluid p-3" Style="width:100%; border:1px solid #dfdfdf; height:200px; object-fit:contain" ImageUrl="https://cdn11.bigcommerce.com/s-7oxj3r7pk9/images/stencil/1280x1280/products/506/8344/TL-2808N30-2__09588.1725494877.jpg" />
                    </div>

                    <div class="col-12 col-md-12 col-lg-4 mb-3">
                        <label class="form-label d-block" style="margin-bottom:2px">Código 2D (SKU)</label>                                
                        <asp:Image runat="server" Visible="true" ID="imageSkuCodicoBarras" CssClass="img-fluid p-3" Style="width:100%; border:1px solid #dfdfdf; height:90px; object-fit:contain" ImageUrl="https://barcodegenerator.seagullscientific.com/Content/Images/BarCodes/524d00b4-2f54-4eb3-bf54-0abf99f899a7.png" />
                        <div class="py-1 px-2 mt-1" style="border:1px solid #dfdfdf; height:105px;">
                            <small class="fw-bold d-block" style="font-size:12px">SKU:</small> LDMSNEEI-640-6468
                            <small class="fw-bold d-block mt-1" style="font-size:12px">PRODUCTO:</small> PRODUCTO
                        </div>
                    </div>

                </div>

                <%-- SECCIÓN ESPECIFICACIONES --%>
                <h4 class="mt-4 position-relative" style="height:30px">                    
                    <div style="height:1px; border-bottom:1px solid #dfdfdf; position:absolute; top:14px; width:100%"></div>
                    <span class="bg-white pe-3" style="position:absolute">ESPECIFICACIONES</span>
                </h4>

                <div class="row mt-3">

                    <div class="col-12 col-md-12 col-lg-8 mb-3">
                        <label class="form-label">Container</label>
                        <asp:TextBox runat="server" ID="label_xxx" CssClass="form-control" autocomplete="off" placeholder="Producto"></asp:TextBox>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4 mb-3">
                        <label class="form-label">SKU</label>
                        <i class="bi bi-lightning-charge"></i>
                        <asp:TextBox runat="server" ID="label_yyy" Enabled="false" Text="LDMSNEEI" CssClass="form-control" autocomplete="off" placeholder="SKU"></asp:TextBox>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4 mb-3">
                        <label class="form-label">Control</label>
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" autocomplete="off" placeholder="Nombre"></asp:TextBox>
                    </div>

                </div>

                <div class="row">

                    

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </asp:Panel>

</asp:Content>

