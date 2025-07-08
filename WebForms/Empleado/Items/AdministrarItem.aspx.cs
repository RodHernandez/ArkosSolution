using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArkosWebApplication.WebForms.Empleado.Items
{
    public partial class AdministrarItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GenerarCodigoQR();

                if (Request.QueryString["idProducto"] != null)
                {
                    int idItem = int.Parse(Request.QueryString["idItem"]);
                    labelTituloPagina.Text = "Administrar item (ID " + idItem + ")";


                }
                else
                {
                    labelTituloPagina.Text = "Registrar nuevo item";
                }
            }
        }

        private void GenerarCodigoQR()
        {
            string urlImagenQR_URL = "~/FileSystem/TEMP_CodigosQR/QR-Producto_" + DateTime.Now.Ticks + ".png";

            try
            {

                string baseUrl = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
                string codigoSkuBaseQR = "LDMSNEEI-640-" + new Random().Next(0, 100000).ToString("D5");
                string urlCodigoQR = baseUrl + "/AdministrarProducto?sku=" + codigoSkuBaseQR;

                // CÓDIGO QR URL UBICACIÓN

                QrEncoder encoderQR = new QrEncoder(ErrorCorrectionLevel.M);
                QrCode codeQR = new QrCode();

                bool encodingSuccess = encoderQR.TryEncode(urlCodigoQR, out codeQR);

                if (encodingSuccess)
                {
                    GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), System.Drawing.Brushes.Black, System.Drawing.Brushes.White);

                    using (var stream = new FileStream(HttpContext.Current.Server.MapPath(urlImagenQR_URL), FileMode.Create))
                    {
                        renderer.WriteToStream(codeQR.Matrix, System.Drawing.Imaging.ImageFormat.Png, stream);

                        // MOSTRAR EN FRONT-END

                        imageUrlCodigoQR.ImageUrl = urlImagenQR_URL;
                    }
                }

                // CÓDIGO QR SKU PRODUCTO

                string urlImagenQR_SKU = "~/FileSystem/TEMP_CodigosQR/QR-Producto_" + DateTime.Now.Ticks + ".png";

                encoderQR = new QrEncoder(ErrorCorrectionLevel.H);
                codeQR = new QrCode();

                encodingSuccess = encoderQR.TryEncode(codigoSkuBaseQR, out codeQR);

                if (encodingSuccess)
                {
                    GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), System.Drawing.Brushes.Black, System.Drawing.Brushes.White);

                    using (var stream = new FileStream(HttpContext.Current.Server.MapPath(urlImagenQR_SKU), FileMode.Create))
                    {
                        renderer.WriteToStream(codeQR.Matrix, System.Drawing.Imaging.ImageFormat.Png, stream);

                        // MOSTRAR EN FRONT-END

                        imageSkuCodigoQR.ImageUrl = urlImagenQR_SKU;
                    }
                }

            }
            catch (Exception exc)
            {

            }
        }
    }
}