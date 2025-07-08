<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="ArkosWebApplication.WebForms.Empleado.Principal" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">

    <%-- CONTENIDO HEAD --%>

    <style>
        .icon-color, .icon-outline {
            display: none;
        }
        
        .icon-outline {
            opacity: 0.7;
        }
    </style>

    <style runat="server" id="styleColorIcons" visible="true">
        .icon-color {
            display: inline;
        } 
    </style>

    <style runat="server" id="styleOutlineIcons" visible="false">
        .icon-outline {
            display: inline;
        }
    </style>

</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">

    <asp:Panel runat="server" ID="panelMainContainer" Visible="true" CssClass="container-fluid pt-0 pt-sm-0 pt-md-2 pt-lg-4">

        <h3 class="text-center">Menú principal</h3>

        <div class="row mt-4 mb-4" style="">
            <div class="col-12 text-center">

                <div class="menu-cards-container">

                    <asp:Panel runat="server" ID="panelNuevoProyecto" class="menu-card">
                        <div class="menu-card-title" style="background-color: #c1272d; color: #ffffff">
                            Nuevo Proyecto
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Portfolio.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/briefcase.png" class="icon-outline" alt="" />
                            <p>Registrar un nuevo proyecto en el sistema</p>
                            <i class="bi bi-plus-circle"></i>
                            <button type="button" onclick="location.href='/NuevoPedido'" class="btn btn-dedalo">REGISTRAR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panelAdministrarProyectos" class="menu-card">
                        <div class="menu-card-title">
                            Administrar Proyectos
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Portfolio.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/briefcase.png" class="icon-outline" alt="" />
                            <p>Administrar proyectos que se encuentran activos</p>
                            <button type="button" onclick="location.href='/RegistroPedidos'" class="btn btn-dark">ADMINISTRAR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panelHistorialProyectos" class="menu-card" Visible="false">
                        <div class="menu-card-title">
                            Historial de Proyectos
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Bill.png" class="icon-color" style="filter: hue-rotate(40deg) brightness(0.86)" />
                            <img src="https://img.icons8.com/ios/100/activity-history.png" class="icon-outline" alt="" />
                            <i class="bi bi-check2-all" style="color: #489d8f; font-size: 32px"></i>
                            <p>Verificar la información del historial de proyectos cerrados</p>
                            <button type="button" onclick="location.href='/RegistroPedidos'" class="btn btn-dark">ABRIR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panelCatalogoMarcas" class="menu-card">
                        <div class="menu-card-title">
                            Catálogo de Marcas
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Catalog.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/magazine.png" class="icon-outline" alt="" />
                            <p>Registrar o actualizar la información de las marcas registradas</p>
                            <button type="button" onclick="location.href='/WebForms/Catalogos/ListadoMarcas.aspx'" class="btn btn-dark">ADMINISTRAR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panelCatalogoProveedores" class="menu-card">
                        <div class="menu-card-title">
                            Catálogo de Proveedores
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Provider.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/fork-lift.png" class="icon-outline" alt="" />
                            <i class="bi bi-plus-circle"></i>
                            <p>Registrar o administrar cuentas de proveedores</p>
                            <button type="button" onclick="location.href='/WebForms/Empleado/Proveedores/ListadoProveedores.aspx'" class="btn btn-dark">ABRIR CATÁLOGO</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel7" class="menu-card">
                        <div class="menu-card-title">
                            Catálogos
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/ColorPalette.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/product-documents.png" class="icon-outline" alt="" />
                            <p>Administrar catálogos de clasificaciones, unidades, áreas, etcétera</p>
                            <button type="button" onclick="location.href='/MenuCatalogos'" class="btn btn-dark">VER CATÁLOGOS</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel8" class="menu-card">
                        <div class="menu-card-title">
                            Control de Precios
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Pricetags.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/price-tag-usd--v1.png" class="icon-outline" alt="" />
                            <p>Configurar precios de los productos registrados</p>
                            <button type="button" onclick="location.href='/ControlPrecios'" class="btn btn-dark">configurar</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panelCatalogoClientes" class="menu-card">
                        <div class="menu-card-title">
                            Catálogo de Clientes
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Cooperation.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/lawyer.png" class="icon-outline" alt="" />
                            <i class="bi bi-plus-circle"></i>
                            <p>Registrar o administrar cuentas de clientes</p>
                            <button type="button" onclick="location.href='/CatalogoClientes'" class="btn btn-dark">ABRIR CATÁLOGO</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel9" class="menu-card">
                        <div class="menu-card-title">
                            Administrar Personal
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Developer.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/cloud-user.png" class="icon-outline" alt="" />
                            <i class="bi bi-arrow-down-left-circle" style="color: #7c7b75"></i>
                            <p>Altas bajas y cambios del personal operativo y administrativo</p>
                            <button type="button" onclick="location.href='/AdministrarPersonal'" class="btn btn-dark">ADMINISTRAR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel1" class="menu-card">
                        <div class="menu-card-title" style="background-color: #c1272d; color: #ffffff">
                            Registrar Items
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Lamp.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/lights.png" class="icon-outline" alt="" />
                            <p>Registro y actualización de items en catálogo</p>
                            <button type="button" onclick="location.href='/AdministrarItem'" class="btn btn-dedalo">NUEVO ITEM</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel11" class="menu-card">
                        <div class="menu-card-title">
                            Configuraciones
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/CloudSettings.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/laptop-settings--v2.png" class="icon-outline" alt="" />
                            <p>Realizar configuraciones y ajustes a la plataforma</p>
                            <button type="button" class="btn btn-success">ABRIR</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel12" class="menu-card disabled">
                        <div class="menu-card-title">
                            Reportes
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Report.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/fine-print--v1.png" class="icon-outline" alt="" />
                            <p>Módulo generador de reportes e indicadores generales</p>
                            <button type="button" onclick="location.href='/Reportes'" class="btn btn-dark">ABRIR REPORTES</button>
                        </div>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="panel13" class="menu-card disabled">
                        <div class="menu-card-title" style="background-color: #0b5ed7; color: #ffffff">
                            Análisis de datos
                        </div>
                        <div class="menu-card-content">
                            <img src="/Images/Gallery/Report.png" class="icon-color" />
                            <img src="https://img.icons8.com/ios/100/bar-chart--v1.png" class="icon-outline" alt="" />
                            <p>Módulo generador de reportes e indicadores generales</p>
                            <button type="button" onclick="location.href='/Reportes'" class="btn btn-dark">ABRIR REPORTES</button>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>

    </asp:Panel>

    <script>
        setTimeout(() => {
            const isFirefox = navigator.userAgent.toLowerCase().includes('firefox');

            if (isFirefox) {
                console.log("Your browser is Firefox");
            } else {
                console.log("Your browser is not Firefox");
            }
        }, 600);
    </script>

</asp:Content>

