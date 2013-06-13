using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reportalo
{
    public partial class ReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void buttonRegister_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            ReportaloWS.ReportaloSoapClient cli = new ReportaloWS.ReportaloSoapClient();
            if (cli.Login(textEmail.Text, textPassword.Text))
            {
                Session["user_email"] = textEmail.Text;
                Response.Redirect("Reportaissue.aspx");
            }
            else { Response.Redirect("ErrorLogin.aspx"); }
        }
    }
}