using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["category_id"] = this.ddlCategoria.SelectedValue;
            Session["sub_category_id"] = this.ddlSubCategoria.SelectedValue;
            Session["date_from"] = this.startDate.Text;
            Session["date_to"] = this.endDate.Text;

            Response.Redirect("Resultados.aspx");
            //ReportaloWS.ReportaloSoapClient c = new ReportaloWS.ReportaloSoapClient();
            //DataSet ds = c.SearchIssueByDateCategory(Convert.ToInt32(this.ddlCategoria.SelectedValue), Convert.ToDateTime(this.startDate.Text), Convert.ToDateTime(this.endDate.Text), Convert.ToInt32(this.ddlCategoria.SelectedValue));

            //GridView1.DataSource=ds;
            //GridView1.DataBind();

//            DataTable ElReader = ds.Tables[0];

//            string _locations = "";

//            foreach (DataRow R in ElReader.Rows)
//            {
//                if(!string.IsNullOrEmpty( R["GIS"].ToString()))
//                {
//                    _locations += "var pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(" +
//                      R["GIS"].ToString() +
//                      "), null);Microsoft.Maps.Events.addHandler(pushpin, 'mouseup', ZoomIn);map.entities.push(pushpin);";
//                }
//            }


//            Literal1.Text = @"
//          <script type='text/javascript' src='http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0'>
//          </script>
//          <script type='text/javascript'>
//               var  map = new Microsoft.Maps.Map(document.getElementById('myMap'), {
//                          credentials: 'AkTho68juGJOhxbF9NqDa4qk1soLpnq-kzOzX1TnYfj8NdpUcer0_mIiKo6JmP1sy'
//               });
//               dataLayer = new Microsoft.Maps.EntityCollection();
//        map.entities.push(dataLayer);
//
//        var infoboxLayer = new Microsoft.Maps.EntityCollection();
//        map.entities.push(infoboxLayer);
//
//        infobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(0, 0), { visible: false, offset: new Microsoft.Maps.Point(0, 20) });
//        infoboxLayer.push(infobox);
//
//                    map.entities.clear();
//                    " + _locations + @"
// 
//                    function ZoomIn(e){
//                         if (e.targetType == 'pushpin'){
//                               var location = e.target.getLocation();
//                               map.setView({
//                                    zoom:5,
//                                    center: location
//                               });
//                   }
//              }
//       
//</script>";
//           // Master.LoadPins(_locations);


        }

  
    }
}