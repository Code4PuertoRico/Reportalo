using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reportalo
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            if (this.textApellido.Text == "" || this.textEmail.Text == string.Empty || this.textNombre.Text == "" || this.textPassword.Text == string.Empty)
            {
                Response.Redirect("ErrorRegistro.aspx");
            }

            ReportaloWS.ReportaloSoapClient cli = new ReportaloWS.ReportaloSoapClient();
            if (cli.RegisterUser(textEmail.Text, textNombre.Text, textApellido.Text, textPassword.Text, 0))
            {
                Response.Redirect("LoginPage.aspx");
            }
        }

       
  

       
    }
}