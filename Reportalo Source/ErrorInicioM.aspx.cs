using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reportalo
{
    public partial class ErrorInicioM : System.Web.UI.Page
    {

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("LoginM.aspx");
        }
    }
}