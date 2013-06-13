using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ReportaloWS
{
    /// <summary>
    /// Summary description for Reportalo
    /// </summary>
    [WebService(Namespace = "http://reportaloWS.azurewebsites.net/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Reportalo : System.Web.Services.WebService
    {
    
        [WebMethod]
        public bool RegisterUser(string user_email, string user_name, string user_lastname, string password, int category_id )
        {
            bool _retVal = true;
            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("RegisterUser", _CONN))
                    {
                        CMD.CommandType = CommandType.StoredProcedure;
                        CMD.Parameters.AddWithValue("@user_email", user_email).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@user_name", user_name).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@user_lastname", user_lastname).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@password", password).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@category_id", category_id).Direction = ParameterDirection.Input;

                        CMD.ExecuteNonQuery();

                    }
                }
                
            }
            catch (Exception ex)
            {
                _retVal = false;
            }
              
            return _retVal;
        }

        [WebMethod]
        public bool Login(string user_email, string password)
        {
            bool _retVal = true;

            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("LoginToMobileApp", _CONN))
                    {
                        CMD.CommandType = CommandType.StoredProcedure;
                        CMD.Parameters.AddWithValue("@user_email", user_email).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@password", password).Direction = ParameterDirection.Input;

                        int _qryResult = 0;
                        _qryResult = Convert.ToInt32(CMD.ExecuteScalar());

                        if (_qryResult == 0) _retVal = false;

                    }
                }

            }
            catch (Exception ex)
            {
                _retVal = false;
            }


            return _retVal;
        }

        [WebMethod]
        public DataSet LoadCategories()
        {
            DataSet Ds = null;

            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("LoadCategoryDDL", _CONN))
                    {
                        Ds = new DataSet();
                        CMD.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter Da = new SqlDataAdapter(CMD);
                        Da.Fill(Ds);

                        Da.Dispose();
                    }
                }

            }
            catch (Exception ex)
            {
                Ds = null;
            }
    

            return Ds;
        }
        
        [WebMethod]
        public DataSet LoadSubCategories(int category_id)
        {
            DataSet Ds = null;

            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("LoadSubCategoryDDL", _CONN))
                    {
                        Ds = new DataSet();
                        CMD.CommandType = CommandType.StoredProcedure;
                        CMD.Parameters.AddWithValue("@category_id", category_id).Direction = ParameterDirection.Input;
                        SqlDataAdapter Da = new SqlDataAdapter(CMD);
                        Da.Fill(Ds);

                        Da.Dispose();
                    }
                }

            }
            catch (Exception ex)
            {
                Ds = null;
            }


            return Ds;
        }

        [WebMethod]
        public bool CreateIssue(string user_email, int sub_category_id, int status_id, string issue_desc, string issue_action, string GIS,byte[] photo)
        {
            bool _retVal = true;
            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("CreateIssue", _CONN))
                    {
                        CMD.CommandType = CommandType.StoredProcedure;
                        CMD.Parameters.AddWithValue("@user_email", user_email).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@sub_category_id", sub_category_id).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@status_id", status_id).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@issue_desc", issue_desc).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@issue_action", issue_action).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@photo", photo).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@GIS", GIS).Direction = ParameterDirection.Input;
                       
                        
                        CMD.ExecuteNonQuery();

                    }
                }

            }
            catch (Exception ex)
            {
                _retVal = false;
            }

            return _retVal;
        }

        [WebMethod]
        public DataSet SearchIssueByDateCategory(int category_id, DateTime date_from, DateTime date_to, int sub_category_id)
        {
            DataSet Ds = null;

            try
            {
                string _connstr = ConfigurationManager.ConnectionStrings["ReportaloCNN"].ToString();
                using (SqlConnection _CONN = new SqlConnection(_connstr))
                {
                    _CONN.Open();
                    using (SqlCommand CMD = new SqlCommand("SearchIssueByDateCategory", _CONN))
                    {
                        Ds = new DataSet();
                        CMD.CommandType = CommandType.StoredProcedure;
                        CMD.Parameters.AddWithValue("@sub_category_id", sub_category_id).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@category_id", category_id).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@date_from", date_from).Direction = ParameterDirection.Input;
                        CMD.Parameters.AddWithValue("@date_to", date_to).Direction = ParameterDirection.Input;
                        
                        SqlDataAdapter Da = new SqlDataAdapter(CMD);
                        Da.Fill(Ds);

                        Da.Dispose();
                    }
                }

            }
            catch (Exception ex)
            {
                Ds = null;
            }


            return Ds;
        }


    }
}
