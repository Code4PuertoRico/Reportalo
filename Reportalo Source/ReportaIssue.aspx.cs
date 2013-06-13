using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Reportalo
{
    public partial class ReportaIssue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadCategorias();
            }
        }

        protected void LoadCategorias()
        {
            ReportaloWS.ReportaloSoapClient ws = new ReportaloWS.ReportaloSoapClient();
            DataSet Ds = ws.LoadCategories();
            this.ddlCategoria.DataSource = Ds.Tables[0];
            this.ddlCategoria.DataValueField = "category_id";
            this.ddlCategoria.DataTextField = "category_ud";
            this.ddlCategoria.DataBind();

            ListItem Li = new ListItem("--Seleccione una--", "0");
            this.ddlCategoria.Items.Insert(0, Li);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportaloWS.ReportaloSoapClient c = new ReportaloWS.ReportaloSoapClient();
            byte[] buffer = null;
            if (FileUpload1.HasFile)
            {
             Stream fileStream = FileUpload1.FileContent;    //new FileStream(this.FileUpload1., FileMode.Open, FileAccess.Read);
            buffer = new byte[fileStream.Length];
            fileStream.Read(buffer, 0, (int)fileStream.Length);
            fileStream.Close(); 
            }

            string LatVal = "";
            string LongVal = "";

            //Busca la Lat y Long
            if (this.hdnLat.Value != null)
            {
                LatVal = this.hdnLat.Value.ToString();
            }

            if (this.hdnLong.Value != null)
            {
                LongVal = this.hdnLong.Value.ToString();
            }


            //Identificar si el usuario no quiere usar el Location para postearlo en blanco
            if (!this.chkLocation.Checked)
            {
                LatVal = "";
                LongVal = "";
            }

            c.CreateIssue(Session["user_email"] == null ? "" : this.chkAnonimo.Checked ==true ? "" : Session["user_email"].ToString(),
                            Convert.ToInt32(this.ddlSubCategoria.SelectedValue),
                            1,
                            this.txtInfo.Text,
                            "",
                            LatVal + "," + LongVal,
                            buffer);
                      

        }

        protected void LoadSubCategorias()
        {
            ReportaloWS.ReportaloSoapClient ws = new ReportaloWS.ReportaloSoapClient();
            DataSet Ds = ws.LoadSubCategories(Convert.ToInt32(this.ddlCategoria.SelectedValue));
            this.ddlSubCategoria.DataSource = Ds.Tables[0];
            this.ddlSubCategoria.DataValueField = "sub_category_id";
            this.ddlSubCategoria.DataTextField = "sub_category_ud";
            this.ddlSubCategoria.DataBind();

            ListItem Li = new ListItem("--Seleccione una--", "0");
            this.ddlSubCategoria.Items.Insert(0, Li);

        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadSubCategorias();
        }
    }
}