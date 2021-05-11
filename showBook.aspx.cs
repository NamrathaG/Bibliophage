using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        int qtyavailable = 0;
        string button2 = Request.QueryString["button2"];
        if(button2.Equals("yes"))
        {
            Button2.Visible = true;
            Button1.Visible = false;

        }
      
        string isbn=Request.QueryString["isbn"];
        
        SqlConnection con = new SqlConnection();
        con.ConnectionString = connectionString;
        SqlCommand cmd = new SqlCommand("Select * from Book where ISBN=@isbn1", con);
        cmd.Parameters.AddWithValue("@isbn1", isbn);
        try
        {
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while(rdr.Read())
            {
                var culture = CultureInfo.CreateSpecificCulture("hi-IN");
                string currencySymbol = culture.NumberFormat.CurrencySymbol;
                ISBNlbl.Text = rdr["ISBN"].ToString();
                Titlelbl.Text = rdr["Title"].ToString();
                Authorlbl.Text = rdr["Author"].ToString();
                Pricelbl.Text = currencySymbol+rdr["Price"].ToString();
                Publisherlbl.Text = rdr["Publisher"].ToString();
                Desclbl.Text = rdr["Descript"].ToString();
                byte[] img = (byte[])rdr["Image"];
                quantitylbl.Text = rdr["Quantity"].ToString();
                qtyavailable = Convert.ToInt32(rdr["Quantity"].ToString());
                categorylbl.Text = rdr["Category"].ToString();
                Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);

            }

        }
        catch (Exception ex)
        { }


        if (qtyavailable == 0)
        {

            notinstocklbl.Visible = true;
            Button1.Visible = false;
            Button3.Visible = true;
            Button2.Visible = false;

        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {

       if(Session["cart"] == null)
        {
            
            Dictionary<string,int> ls = new Dictionary<string, int>();
            ls.Add(Request.QueryString["isbn"],1);
            Session["cart"] = ls;

        }
        else
        {
            Dictionary<string, int> ls2 = Session["cart"] as Dictionary<string, int>;
            ls2.Add(Request.QueryString["isbn"],1);
            Session["cart"] = ls2;
        }
       




        Response.Redirect("cart.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("cart.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        SqlConnection con4 = new SqlConnection(connectionString);
        SqlCommand cmd4 = new SqlCommand("update sale set CopiesRequested=CopiesRequested+1  where ISBN='" + Request.QueryString["isbn"]+ "'", con4);
       System.Diagnostics.Debug.Write("update sale set CopiesRequested=CopiesRequested+1  where ISBN='" + Request.QueryString["isbn"] + "'");
        try
        {
            con4.Open();
            cmd4.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.Write("Error here" + ex.Message);
        }
        finally
        {
            con4.Close();
        }



    }
}