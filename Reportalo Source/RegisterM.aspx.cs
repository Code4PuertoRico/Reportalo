using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reportalo
{
    public partial class RegisterM : System.Web.UI.Page
    {

        protected void buttonReg_Click(object sender, ImageClickEventArgs e)
        {
            if (this.textNombre.Text.Trim() == string.Empty || this.textApellido.Text.Trim() == string.Empty || this.textEmail.Text.Trim() == string.Empty || this.textPassword.Text.Trim() == string.Empty)
            {
                Response.Redirect("ErrorRegistroM.aspx");
            }
        }
    }
}