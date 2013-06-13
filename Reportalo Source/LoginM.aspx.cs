using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Reportalo
{
    public partial class LoginM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ReportaloWS.ReportaloSoapClient cli = new ReportaloWS.ReportaloSoapClient();
            if (cli.Login(textEmail.Text, textPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(this.textEmail.Text,false);
                Session["user_email"] = textEmail.Text;
                Response.Redirect("ReportaloM.aspx");
            }
            else { Response.Redirect("ErrorInicioM.aspx"); }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("RegisterM.aspx");
        }
    }
}