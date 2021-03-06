﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Reportalo
{
    public partial class ReportaloM : System.Web.UI.Page
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

        protected void btnReportalo_Click(object sender, ImageClickEventArgs e)
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
            string Coords = Master.DameCoordenadas();
            string[] arrCoords = Coords.Split(',');



            //Busca la Lat y Long
            if (arrCoords.Length > 0)
            {
                LatVal = arrCoords[0];
                LongVal = arrCoords[1];
            }


            //Identificar si el usuario no quiere usar el Location para postearlo en blanco
            if (!Master.GetLocation())
            {
                LatVal = "";
                LongVal = "";
            }

            string _user_email = Session["user_email"] == null ? "" : Master.GetAnonimo() ? "" : Session["user_email"].ToString();


            c.CreateIssue(_user_email,
                            Convert.ToInt32(this.ddlSubCategoria.SelectedValue),
                            1,
                            this.txtInfo.Text,
                            "",
                            LatVal + "," + LongVal,
                            buffer);

            Response.Redirect("ReportaloM.aspx");

        }
    }
}