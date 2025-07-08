using System;
using System.IO;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Linq;

namespace ArkosWebApplication.WebForms.Empleado.Proveedores
{
    public partial class AdministrarProveedor : System.Web.UI.Page
    {
        private DataTable TablaContactos
        {
            get
            {
                if (Session["ContactosProveedor"] == null)
                {
                    var dt = new DataTable();
                    dt.Columns.Add("ID", typeof(int));
                    dt.Columns.Add("NombreCompleto", typeof(string));
                    dt.Columns.Add("Puesto", typeof(string));
                    dt.Columns.Add("Email", typeof(string));
                    dt.Columns.Add("Telefono", typeof(string));
                    Session["ContactosProveedor"] = dt;
                }
                return (DataTable)Session["ContactosProveedor"];
            }
            set
            {
                Session["ContactosProveedor"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Generar código de proveedor automáticamente
                string codigoProveedor = "PROV-" + DateTime.Now.ToString("yyMMdd") + "-" + new Random().Next(1000, 9999).ToString();
                txtCodigoProveedor.Text = codigoProveedor;

                if (Request.QueryString["idProveedor"] != null)
                {
                    int idProveedor = int.Parse(Request.QueryString["idProveedor"]);
                    labelTituloPagina.Text = "Administrar proveedor (ID " + idProveedor + ")";
                    // TODO: Cargar información del proveedor
                }
                else
                {
                    labelTituloPagina.Text = "Registrar nuevo proveedor";
                }

                ActualizarGridContactos();
            }
        }

        protected void asyncUploadLogo_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            if (asyncUploadLogo.HasFile)
            {
                string fileName = e.FileName;
                string saveExtension = System.IO.Path.GetExtension(asyncUploadLogo.PostedFile.FileName);

                // Verificar que sea una imagen
                if (saveExtension.ToLower().Equals(".jpg") || saveExtension.ToLower().Equals(".png"))
                {
                    string uploadFolder = Server.MapPath("~/FileSystem/Proveedores/Logos/");
                    
                    // Crear el directorio si no existe
                    if (!Directory.Exists(uploadFolder))
                    {
                        Directory.CreateDirectory(uploadFolder);
                    }

                    // Generar un nombre único para el archivo
                    string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(fileName);
                    string filePath = Path.Combine(uploadFolder, uniqueFileName);

                    // Guardar el archivo
                    asyncUploadLogo.SaveAs(filePath);

                    // Actualizar la imagen en la página
                    imageLogo.ImageUrl = "~/FileSystem/Proveedores/Logos/" + uniqueFileName;
                    imageLogo.Visible = true;
                    imageLogoDefault.Visible = false;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // TODO: Validar campos requeridos
                if (string.IsNullOrEmpty(txtRFC.Text) || string.IsNullOrEmpty(txtRazonSocial.Text))
                {
                    // Mostrar mensaje de error
                    return;
                }

                // TODO: Guardar en base de datos
                // Por ahora solo mostraremos un mensaje de éxito
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", 
                    "alert('Proveedor guardado exitosamente.');", true);
            }
            catch (Exception ex)
            {
                // TODO: Manejar el error apropiadamente
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", 
                    "alert('Error al guardar el proveedor: " + ex.Message + "');", true);
            }
        }

        protected void btnAgregarContacto_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos requeridos
                if (string.IsNullOrEmpty(txtNombresContacto.Text) || string.IsNullOrEmpty(txtApellidosContacto.Text) ||
                    string.IsNullOrEmpty(txtEmailContacto.Text) || string.IsNullOrEmpty(txtTelefonoContacto.Text) ||
                    string.IsNullOrEmpty(ddlPuestoContacto.SelectedValue))
                {
                    ScriptManager.RegisterStartupScript(updatePanelFormularioContacto, GetType(), "alertMessage",
                        "alert('Todos los campos del contacto son requeridos.');", true);
                    return;
                }

                // Crear nuevo contacto
                DataRow dr = TablaContactos.NewRow();
                dr["ID"] = TablaContactos.Rows.Count > 0 ? 
                    TablaContactos.AsEnumerable().Max(r => r.Field<int>("ID")) + 1 : 1;
                dr["NombreCompleto"] = $"{txtNombresContacto.Text.Trim()} {txtApellidosContacto.Text.Trim()}";
                dr["Puesto"] = ddlPuestoContacto.SelectedItem.Text;
                dr["Email"] = txtEmailContacto.Text.Trim();
                dr["Telefono"] = txtTelefonoContacto.Text.Trim();

                // Agregar a la tabla
                TablaContactos.Rows.Add(dr);

                // Limpiar campos y actualizar grid
                LimpiarFormularioContacto();
                ActualizarGridContactos();

                // Mostrar mensaje de éxito
                ScriptManager.RegisterStartupScript(updatePanelFormularioContacto, GetType(), "alertMessage",
                    "alert('Contacto agregado exitosamente.');", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(updatePanelFormularioContacto, GetType(), "alertMessage",
                    "alert('Error al agregar el contacto: " + ex.Message + "');", true);
            }
        }

        protected void gridContactos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                DataRow[] rows = TablaContactos.Select($"ID = {id}");

                if (rows.Length > 0)
                {
                    if (e.CommandName == "EliminarContacto")
                    {
                        rows[0].Delete();
                        TablaContactos.AcceptChanges();
                        ActualizarGridContactos();

                        ScriptManager.RegisterStartupScript(updatePanelContactos, GetType(), "alertMessage",
                            "alert('Contacto eliminado exitosamente.');", true);
                    }
                    else if (e.CommandName == "EditarContacto")
                    {
                        // TODO: Implementar edición de contacto
                        // Por ahora solo mostramos mensaje
                        ScriptManager.RegisterStartupScript(updatePanelContactos, GetType(), "alertMessage",
                            "alert('Funcionalidad de edición en desarrollo.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(updatePanelContactos, GetType(), "alertMessage",
                    "alert('Error al procesar la acción: " + ex.Message + "');", true);
            }
        }

        private void ActualizarGridContactos()
        {
            gridContactos.DataSource = TablaContactos;
            gridContactos.DataBind();
            updatePanelContactos.Update();
        }

        private void LimpiarFormularioContacto()
        {
            txtNombresContacto.Text = string.Empty;
            txtApellidosContacto.Text = string.Empty;
            txtEmailContacto.Text = string.Empty;
            txtTelefonoContacto.Text = string.Empty;
            ddlPuestoContacto.SelectedIndex = 0;
            
            // Actualizar el panel del formulario
            updatePanelFormularioContacto.Update();
        }
    }
} 