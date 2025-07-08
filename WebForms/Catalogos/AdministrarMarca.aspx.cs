using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using ArkosWebApplication.Models.Proveedores;
using ArkosWebApplication.Models.Marcas;

namespace ArkosWebApplication.WebForms.Catalogos
{
    public partial class AdministrarMarca : System.Web.UI.Page
    {
        private List<Proveedor> ProveedoresSeleccionados
        {
            get
            {
                if (Session["ProveedoresSeleccionados"] == null)
                    Session["ProveedoresSeleccionados"] = new List<Proveedor>();
                return (List<Proveedor>)Session["ProveedoresSeleccionados"];
            }
            set
            {
                Session["ProveedoresSeleccionados"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProveedores();
                
                // Si es edición, cargar datos de la marca
                if (Request.QueryString["id"] != null)
                {
                    int marcaId;
                    if (int.TryParse(Request.QueryString["id"], out marcaId))
                    {
                        CargarDatosMarca(marcaId);
                    }
                }
            }
        }

        private void CargarProveedores()
        {
            // TODO: Obtener proveedores de la base de datos
            var proveedores = new List<Proveedor>
            {
                new Proveedor { Codigo = "PROV001", RazonSocial = "+ LUZ", RFC = "LUZ123456789", NombreComercial = "JAIME CASANOVA | VENTAS" },
                new Proveedor { Codigo = "PROV002", RazonSocial = "ACOLYTE", RFC = "ACO123456789", NombreComercial = "JACQUELINE HERNANDEZ | VENTAS" },
                new Proveedor { Codigo = "PROV003", RazonSocial = "ACUITY BRANDS", RFC = "ACU123456789", NombreComercial = "ROCIO CADENA | VENTAS" }
            };

            rptProveedores.DataSource = proveedores;
            rptProveedores.DataBind();

            // Marcar los checkboxes de proveedores ya seleccionados
            foreach (RepeaterItem item in rptProveedores.Items)
            {
                CheckBox chkProveedor = (CheckBox)item.FindControl("chkProveedor");
                string codigo = chkProveedor.Attributes["data-codigo"];
                chkProveedor.Checked = ProveedoresSeleccionados.Any(p => p.Codigo == codigo);
            }
        }

        private void CargarDatosMarca(int marcaId)
        {
            // TODO: Obtener datos de la marca desde la base de datos
            // Por ahora usamos datos de ejemplo
            txtNombreMarca.Text = "3M";
            lblNombreMarca.Text = "3M";
            chkActivo.Checked = true;
        }

        protected void chkActivo_CheckedChanged(object sender, EventArgs e)
        {
            // Actualizar el estilo visual según el estado
            string script = $"document.querySelector('.marca-activa').style.color = '{(chkActivo.Checked ? "#198754" : "#6c757d")}';";
            ScriptManager.RegisterStartupScript(this, GetType(), "updateActiveStyle", script, true);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Recopilar proveedores seleccionados
                var proveedoresSeleccionados = new List<Proveedor>();
                foreach (RepeaterItem item in rptProveedores.Items)
                {
                    CheckBox chkProveedor = (CheckBox)item.FindControl("chkProveedor");
                    if (chkProveedor.Checked)
                    {
                        string codigo = chkProveedor.Attributes["data-codigo"];
                        // TODO: Obtener el proveedor completo de la base de datos
                        proveedoresSeleccionados.Add(new Proveedor { Codigo = codigo });
                    }
                }

                // Crear o actualizar la marca
                var marca = new Marca
                {
                    Nombre = txtNombreMarca.Text.Trim(),
                    Activo = chkActivo.Checked
                };

                // TODO: Guardar en la base de datos
                // 1. Guardar información de la marca
                // 2. Guardar relaciones con proveedores

                // Redirigir al listado de marcas
                Response.Redirect("~/WebForms/Catalogos/ListadoMarcas.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForms/Catalogos/ListadoMarcas.aspx");
        }
    }
} 