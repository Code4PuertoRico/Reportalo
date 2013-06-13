using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace WebApplication4
{
    public partial class Resultados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadDatos();
            }
        }

        protected void LoadDatos()
        {
            ReportaloWS.ReportaloSoapClient c = new ReportaloWS.ReportaloSoapClient();
            DataSet ds = c.SearchIssueByDateCategory(Convert.ToInt32(Session["category_id"]), Convert.ToDateTime(Session["date_from"]), Convert.ToDateTime(Session["date_to"]), Convert.ToInt32(Session["sub_category_id"]));

            GridView1.DataSource = ds;
            GridView1.DataBind();

            LoadTheMap(ds);

        }

        protected void LoadTheMap(DataSet ds)
        {
            DataTable ElReader = ds.Tables[0];

            string _locations = "";

            foreach (DataRow R in ElReader.Rows)
            {
                if (R["GIS"].ToString().Trim() != ",")
                {
                    _locations += "var pushpin = new Microsoft.Maps.Pushpin(new Microsoft.Maps.Location(" +
                      R["GIS"].ToString() +
                      "), null);Microsoft.Maps.Events.addHandler(pushpin, 'mouseup', ZoomIn);map.entities.push(pushpin);";
                }
            }

            string creds = "\"AkTho68juGJOhxbF9NqDa4qk1soLpnq-kzOzX1TnYfj8NdpUcer0_mIiKo6JmP1s\"";
            string center = " ,center:\"18.3683,-66.2734\"";

                     Literal1.Text = @"
                      <script type='text/javascript' src='http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0'>
                      </script>
                      <script type='text/javascript'>
                           var  map = new Microsoft.Maps.Map(document.getElementById('myMap'), {
                                      credentials: " + creds + @"
                           });
                           dataLayer = new Microsoft.Maps.EntityCollection();
                    map.entities.push(dataLayer);
            
                    var infoboxLayer = new Microsoft.Maps.EntityCollection();
                    map.entities.push(infoboxLayer);
            
                    infobox = new Microsoft.Maps.Infobox(new Microsoft.Maps.Location(0, 0), { visible: false, offset: new Microsoft.Maps.Point(0, 20) });
                    infoboxLayer.push(infobox);
            
                                map.entities.clear();
                                " + _locations + @"
             
                                function ZoomIn(e){
                                     if (e.targetType == 'pushpin'){
                                           var location = e.target.getLocation();
                                           map.setView({
                                                zoom:5,
                                                center: location
                                           });
                               }
                          }
                   
            </script>";
        }
    }
}