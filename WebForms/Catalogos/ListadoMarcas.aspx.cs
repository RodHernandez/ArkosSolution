using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using ArkosWebApplication.Models.Marcas;
using ArkosWebApplication.Models.Proveedores;

namespace ArkosWebApplication.WebForms.Catalogos
{
    public partial class ListadoMarcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarcas();
            }
        }

        private void CargarMarcas()
        {
            // TODO: Obtener marcas desde la base de datos
            var marcas = new List<Marca>
            {
                new Marca 
                { 
                    Id = 1, 
                    Nombre = "3M", 
                    Activo = true, 
                    FechaRegistro = DateTime.Now.AddDays(-5),
                    Proveedores = new List<Proveedor> 
                    { 
                        new Proveedor { Codigo = "PROV001" },
                        new Proveedor { Codigo = "PROV002" }
                    }
                },
                new Marca 
                { 
                    Id = 2, 
                    Nombre = "PHILIPS", 
                    Activo = true, 
                    FechaRegistro = DateTime.Now.AddDays(-3),
                    Proveedores = new List<Proveedor> 
                    { 
                        new Proveedor { Codigo = "PROV003" }
                    }
                },
                new Marca 
                { 
                    Id = 3, 
                    Nombre = "OSRAM", 
                    Activo = false, 
                    FechaRegistro = DateTime.Now.AddDays(-1),
                    Proveedores = new List<Proveedor>()
                }
            };

            gvMarcas.DataSource = marcas;
            gvMarcas.DataBind();

            // Actualizar contadores
            lblTotalMarcas.Text = marcas.Count.ToString();
            lblMarcasActivas.Text = marcas.Count(m => m.Activo).ToString();
        }

        protected void gvMarcas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMarcas.PageIndex = e.NewPageIndex;
            CargarMarcas();
        }

        protected void gvMarcas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditarMarca")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"~/WebForms/Catalogos/AdministrarMarca.aspx?id={id}");
            }
        }

        protected void btnNuevaMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForms/Catalogos/AdministrarMarca.aspx");
        }

        protected void buttonRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForms/Empleado/Principal.aspx");
        }
    }
} 