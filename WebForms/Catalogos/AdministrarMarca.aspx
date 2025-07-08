<%@ Page Title="ARKOS - Administrar Marca" Language="C#" MasterPageFile="~/WebForms/Masters/Main.Master" AutoEventWireup="true" CodeBehind="AdministrarMarca.aspx.cs" Inherits="ArkosWebApplication.WebForms.Catalogos.AdministrarMarca" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContainer" runat="server">
    <style>
        .provider-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .provider-item {
            padding: 12px;
            border: 1px solid #EEEEEE;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            background-color: #ffffff;
        }

        .provider-icon {
            color: #c1272d;
            margin-right: 15px;
            font-size: 1.2em;
        }

        .provider-info {
            flex-grow: 1;
        }

        .provider-name {
            font-weight: 500;
            display: block;
        }

        .provider-contact {
            color: #666;
            font-size: 0.9em;
        }

        .provider-checkbox {
            margin-left: 15px;
        }

        .btn-dropdown {
            text-align: left;
            position: relative;
        }

        .header-with-icon {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .header-with-icon i {
            font-size: 1.5em;
        }

        .marca-activa {
            color: #198754;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="BodyContainer" runat="server">
    <asp:Panel runat="server" ID="panelContenedorPrincipal" CssClass="container-small pt-4 pb-2" 
        Style="padding-left:30px; padding-right:30px; border:1px solid #EEEEEE; max-width:820px">

        <h3><asp:Label runat="server" ID="labelTituloPagina" Text="Administrar Marca"></asp:Label></h3>

        <asp:UpdatePanel runat="server" ID="panelControlesPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <div class="row mt-4 mb-4">
                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">
                        <button type="button" class="d-non btn btn-dedalo position-relative me-3">
                            Marca
                        </button>

                        <asp:LinkButton runat="server" ID="buttonRegresar" OnClick="btnCancelar_Click" CssClass="btn btn-dark position-relative ms-0 float-none float-lg-end text-end d-block">
                            <i class="bi bi-arrow-return-left" style="line-height:42px"></i>
                            Regresar al listado
                        </asp:LinkButton>
                    </div>

                    <div class="col-12 col-md-12 col-lg-12" style="min-height:40px">
                        <div class="alert alert-secondary mt-2" role="alert">
                            <i class="bi bi-exclamation-circle float-start me-2"></i>
                            Verifica la información antes de guardar los cambios
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:UpdatePanel runat="server" ID="updateFormPagina" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <div class="row m-0">
                    <!-- Columna Izquierda -->
                    <div class="col-12 col-md-12 col-lg-8 m-0 pe-3">
                        <div class="row mt-2">
                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Nombre de la marca</label>
                                <asp:TextBox ID="txtNombreMarca" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombreMarca" runat="server" 
                                    ControlToValidate="txtNombreMarca" 
                                    ErrorMessage="El nombre de la marca es requerido" 
                                    CssClass="text-danger" 
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <div class="form-check">
                                    <asp:CheckBox ID="chkActivo" runat="server" Checked="true" CssClass="form-check-input" AutoPostBack="true" OnCheckedChanged="chkActivo_CheckedChanged" />
                                    <label class="form-check-label marca-activa" for="<%= chkActivo.ClientID %>">
                                        <i class="bi bi-check-circle-fill me-1"></i>Marca activa
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Columna Derecha -->
                    <div class="col-12 col-md-12 col-lg-4 m-0 ps-3">
                        <div class="row mt-2">
                            <div class="col-12 col-md-12 col-lg-12 mb-3 p-0">
                                <label class="form-label">Código de marca</label>
                                <asp:TextBox runat="server" ID="txtCodigoMarca" Enabled="false" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sección de Proveedores -->
                <h4 class="mt-4 position-relative" style="height:30px">                    
                    <div style="height:1px; border-bottom:1px solid #dfdfdf; position:absolute; top:14px; width:100%"></div>
                    <span class="bg-white pe-3" style="position:absolute">PROVEEDORES ASOCIADOS</span>
                </h4>

                <div class="row mt-4">
                    <div class="col-12">
                        <asp:Panel ID="pnlProveedores" runat="server" CssClass="provider-list">
                            <asp:Repeater ID="rptProveedores" runat="server">
                                <ItemTemplate>
                                    <div class="provider-item">
                                        <i class="bi bi-truck provider-icon"></i>
                                        <div class="provider-info">
                                            <span class="provider-name"><%# Eval("RazonSocial") %></span>
                                            <span class="provider-contact"><%# Eval("RFC") %> | <%# Eval("Codigo") %></span>
                                        </div>
                                        <div class="provider-checkbox">
                                            <asp:CheckBox ID="chkProveedor" runat="server" 
                                                CssClass="form-check-input"
                                                data-codigo='<%# Eval("Codigo") %>' />
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </div>
                </div>

                <!-- Botones de Acción -->
                <div class="row mt-4">
                    <div class="col-md-12 text-end">
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-light me-2" OnClick="btnCancelar_Click" CausesValidation="false" />
                        <asp:Button ID="btnGuardar" runat="server" Text="GUARDAR Y CERRAR" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content> 