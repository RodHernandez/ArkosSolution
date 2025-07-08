using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArkosWebApplication.WebForms.Masters
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void buttonLogin_Click(object sender, EventArgs e)
        {
            CloseSession();
        }

        private void CloseSession()
        {
            Context.GetOwinContext().Authentication.SignOut();
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("~/Account/Login");
        }
    }
}