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
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            Dictionary<string, int> d = Session["cart"] as Dictionary<string, int>;
  
            foreach (GridViewRow row in GridView1.Rows)
            {
                TextBox t = (TextBox)row.Cells[7].FindControl("qtytb");
                string ISBN1=row.Cells[0].Text;
                int updateq = Convert.ToInt32(t.Text);
                int tableqty = 0;
                string cs = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
                using (SqlConnection con2 = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("select quantity from Book where ISBN ='" + ISBN1 + "';", con2);

                    //SqlCommand cmd = new SqlCommand("select * from Book where ISBN ='xx'", con2);

                    con2.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                   if(rdr.Read())
                    {
                        tableqty = Convert.ToInt32(rdr[0].ToString());
                    }
                }
                if(tableqty>=updateq)
                {
                    d[ISBN1] = Convert.ToInt32(t.Text);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sorry quantity not available')", true);

                }



            }
            Session["cart"] = d;
        }

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
                    int value = ls[isbn1];
                    TextBox t = (TextBox)row.Cells[7].FindControl("qtytb");
                    t.Text = value.ToString();

                }
            
        }
    }









   protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        Dictionary<string, int> ls = Session["cart"] as Dictionary<string, int>;
        if (ls != null)
        {

            TableCell cell =GridView1.Rows[e.RowIndex].Cells[0];
            string sn = cell.Text;
            ls.Remove(sn);
            Session["cart"] = ls;
        }

        Response.Redirect("cart.aspx");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("cusSearch.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("generateReceipt.aspx");
    }


    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        

    }
    }
