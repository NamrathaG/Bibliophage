using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        decimal totalcost = 0;
        Dictionary<string, int> ls = Session["cart"] as Dictionary<string, int>;
        string wherestring = "";
        if (ls != null)
        {

            foreach (KeyValuePair<string, int> entry in ls)
            {
                // do something with entry.Value or entry.Key
                System.Diagnostics.Debug.Write("dictionary =" + entry.Value + "  " + entry.Key + " ");
                wherestring += "'" + entry.Key + "',";

            }
            if (ls.Count > 0)
            {


                string cs = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
                using (SqlConnection con2 = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select * from Book where ISBN in (" + wherestring.Substring(0, wherestring.Length - 1) + ")", con2);

                    //SqlCommand cmd = new SqlCommand("select * from Book where ISBN ='xx'", con2);

                    con2.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                }
            }

            
            foreach (GridViewRow row in GridView1.Rows)
            {


                string isbn1 = row.Cells[0].Text;
                //decimal price=  Convert.ToDecimal(row.Cells[3].Text);
             decimal  price= Decimal.Parse(row.Cells[3].Text, NumberStyles.Currency);
                int value = ls[isbn1];
                Label t = (Label)row.Cells[5].FindControl("qtytb");
                t.Text = value.ToString();
                totalcost += price * value;


                SqlConnection con3 = new SqlConnection(connectionString);
                SqlCommand cmd3 = new SqlCommand("update Book set Quantity=Quantity-" + value+" where ISBN='"+isbn1+"'",con3);
                System.Diagnostics.Debug.Write("update Book set Quantity=Quantity-" + value + " where ISBN='" + isbn1 + "'");
                try
                {
                    con3.Open();
                    cmd3.ExecuteNonQuery();
                }
                catch(Exception ex)
                {

                }
                finally
                {
                    con3.Close();
                }



                SqlConnection con4 = new SqlConnection(connectionString);
                SqlCommand cmd4 = new SqlCommand("update sale set CopiesSold=CopiesSold+" + value + " where ISBN='" + isbn1 + "'", con4);
                System.Diagnostics.Debug.Write("update Book set Quantity=Quantity-" + value + " where ISBN='" + isbn1 + "'");
                try
                {
                    con4.Open();
                    cmd4.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    con4.Close();
                }








            }
        }
        var culture = CultureInfo.CreateSpecificCulture("hi-IN");
        string currencySymbol = culture.NumberFormat.CurrencySymbol;
        totallbl.Text = currencySymbol+totalcost.ToString();

    }
}