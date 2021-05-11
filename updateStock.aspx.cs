using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

      
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        TextBox tb = (TextBox)GridView1.SelectedRow.Cells[7].FindControl("qtytb");
        if (tb == null)
        {
            System.Diagnostics.Debug.Write("yes it is null");
        }
        else
        {

            int qty = Convert.ToInt32(tb.Text);
            string isbn = GridView1.SelectedRow.Cells[0].Text;


            SqlConnection con3 = new SqlConnection(connectionString);
            //con3.ConnectionString = connectionString;
            SqlCommand cmd3 = new SqlCommand("update Book set Quantity=Quantity+" + qty + " where ISBN='" + isbn + "'", con3);
           // System.Diagnostics.Debug.Write("update Book set Quantity=Quantity-" + value + " where ISBN='" + isbn1 + "'");
            try
            {
                con3.Open();
                cmd3.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.Write(ex.Message);
            }
            finally
            {
                con3.Close();
            }

            Response.Redirect("updateStock.aspx");





        }


   
    }
}