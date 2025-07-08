using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArkosWebApplication.WebForms.Empleado.Proveedores
{
    public partial class ListadoProveedores : System.Web.UI.Page
    {
        private DataTable TablaProveedores
        {
            get
            {
                if (Session["Proveedores"] == null)
                {
                    var dt = new DataTable();
                    dt.Columns.Add("ID", typeof(int));
                    dt.Columns.Add("CodigoProveedor", typeof(string));
                    dt.Columns.Add("RFC", typeof(string));
                    dt.Columns.Add("RazonSocial", typeof(string));
                    dt.Columns.Add("NombreComercial", typeof(string));
                    dt.Columns.Add("TipoProveedor", typeof(string));
                    Session["Proveedores"] = dt;
                }
                return (DataTable)Session["Proveedores"];
            }
            set
            {
                Session["Proveedores"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosEjemplo();
            }
        }

        private void CargarDatosEjemplo()
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("ID", typeof(int)),
                new DataColumn("CodigoProveedor", typeof(string)),
                new DataColumn("RFC", typeof(string)),
                new DataColumn("RazonSocial", typeof(string)),
                new DataColumn("NombreComercial", typeof(string)),
                new DataColumn("TipoProveedor", typeof(string))
            });

            // Agregar datos de ejemplo - Primera página
            dt.Rows.Add(1, "PROV001", "XAXX010101000", "Suministros Industriales S.A. de C.V.", "Suministros Industriales", "Nacional");
            dt.Rows.Add(2, "PROV002", "XEXX010101000", "Global Tech Solutions Inc.", "Global Tech", "Internacional");
            dt.Rows.Add(3, "PROV003", "ZAXX010101000", "Materiales y Equipos del Norte S.A.", "Materiales del Norte", "Nacional");
            dt.Rows.Add(4, "PROV004", "YAXX010101000", "Herramientas Profesionales S.A. de C.V.", "Herramientas Pro", "Nacional");
            dt.Rows.Add(5, "PROV005", "WAXX010101000", "European Supplies Ltd.", "Euro Supplies", "Internacional");
            dt.Rows.Add(6, "PROV006", "UAXX010101000", "Químicos y Solventes S.A.", "QuimiSol", "Nacional");
            dt.Rows.Add(7, "PROV007", "TAXX010101000", "Asian Electronics Co.", "AsiaElec", "Internacional");
            dt.Rows.Add(8, "PROV008", "SAXX010101000", "Empaques y Embalajes del Centro", "EmpaCenter", "Nacional");
            dt.Rows.Add(9, "PROV009", "RAXX010101000", "Aceros y Metales del Sur S.A.", "AceroSur", "Nacional");
            dt.Rows.Add(10, "PROV010", "QAXX010101000", "Plásticos Industriales S.A. de C.V.", "PlastiIndustrial", "Nacional");
            dt.Rows.Add(11, "PROV011", "PAXX010101000", "German Machinery GmbH", "GerMach", "Internacional");
            dt.Rows.Add(12, "PROV012", "OAXX010101000", "Papelera del Norte S.A.", "PapelNorte", "Nacional");
            dt.Rows.Add(13, "PROV013", "NAXX010101000", "Italian Design Solutions SRL", "ItalDesign", "Internacional");
            dt.Rows.Add(14, "PROV014", "MAXX010101000", "Transportes Rápidos S.A.", "TransRápidos", "Nacional");
            dt.Rows.Add(15, "PROV015", "LAXX010101000", "Office Supplies International", "OfficeInt", "Internacional");
            dt.Rows.Add(16, "PROV016", "KAXX010101000", "Maquinaria Pesada S.A.", "MaqPesada", "Nacional");
            dt.Rows.Add(17, "PROV017", "JAXX010101000", "Swiss Precision Tools AG", "SwissTool", "Internacional");
            dt.Rows.Add(18, "PROV018", "IAXX010101000", "Materiales Eléctricos del Centro", "ElectroCentro", "Nacional");
            dt.Rows.Add(19, "PROV019", "HAXX010101000", "Canadian Wood Products Inc.", "CanWood", "Internacional");
            dt.Rows.Add(20, "PROV020", "GAXX010101000", "Pinturas y Recubrimientos S.A.", "PinturasPro", "Nacional");

            // Agregar datos de ejemplo - Segunda página
            dt.Rows.Add(21, "PROV021", "FAXX010101000", "Brazilian Steel Corp.", "BraSteel", "Internacional");
            dt.Rows.Add(22, "PROV022", "EAXX010101000", "Vidrios y Cristales S.A.", "VidriosCris", "Nacional");
            dt.Rows.Add(23, "PROV023", "DAXX010101000", "French Automation Systems", "FrenchAuto", "Internacional");
            dt.Rows.Add(24, "PROV024", "CAXX010101000", "Productos Químicos del Bajío", "QuimiBajío", "Nacional");
            dt.Rows.Add(25, "PROV025", "BAXX010101000", "Nordic Safety Equipment", "NordicSafe", "Internacional");
            dt.Rows.Add(26, "PROV026", "AAXX010101000", "Herrajes y Cerraduras S.A.", "HerraCer", "Nacional");
            dt.Rows.Add(27, "PROV027", "ABXX010101000", "Australian Mining Supplies", "AusMining", "Internacional");
            dt.Rows.Add(28, "PROV028", "ACXX010101000", "Bombas y Válvulas del Norte", "BomValNorte", "Nacional");
            dt.Rows.Add(29, "PROV029", "ADXX010101000", "Korean Tech Innovations", "KorTech", "Internacional");
            dt.Rows.Add(30, "PROV030", "AEXX010101000", "Materiales de Construcción S.A.", "MatCons", "Nacional");
            dt.Rows.Add(31, "PROV031", "AFXX010101000", "Dutch Agricultural Solutions", "DutchAgro", "Internacional");
            dt.Rows.Add(32, "PROV032", "AGXX010101000", "Equipos de Seguridad Industrial", "SegIndustrial", "Nacional");

            // Guardar en sesión para mantener los datos entre postbacks
            Session["Proveedores"] = dt;
            
            BindGrid();
        }

        private void BindGrid()
        {
            if (Session["Proveedores"] != null)
            {
                gridProveedores.DataSource = (DataTable)Session["Proveedores"];
                gridProveedores.DataBind();
            }
        }

        protected void gridProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProveedores.PageIndex = e.NewPageIndex;
            BindGrid();
            updateGridProveedores.Update();
        }

        protected void btnNuevoProveedor_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/WebForms/Empleado/Proveedores/AdministrarProveedor.aspx");
        }

        protected void gridProveedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditarProveedor")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"~/WebForms/Empleado/Proveedores/AdministrarProveedor.aspx?idProveedor={id}");
            }
        }
    }
} 