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
    //static Dictionary<string, int> dic = new Dictionary<string, int>();
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        TextBox tb =(TextBox) GridView1.SelectedRow.Cells[10].FindControl("qtytb");
        if (tb == null)
        {
            System.Diagnostics.Debug.Write("yes it is null");
        }
        else
        {

            int qty = Convert.ToInt32(tb.Text);
            string isbn = GridView1.SelectedRow.Cells[0].Text;

            if(Application["procureList"] == null)
            {
                Dictionary<string, int> dic = new Dictionary<string, int>();
                dic.Add(isbn, qty);
                Application["procureList"] = dic;

            }
            else
            {
                Dictionary<string, int> dic = Application["procureList"] as Dictionary<string, int>;
                dic.Add(isbn,qty);
                Application["procureList"] = dic;


            }

          


        
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string wherestring = "";
        string title = "";
        string author = "";
        string genre = "";
        string isbn = "";

        con.ConnectionString = connectionString;
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Book", con);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                title += "@" + reader["ISBN"].ToString() + "%" + reader["Title"].ToString() + "@";
                author += "@" + reader["ISBN"].ToString() + "%" + reader["Author"].ToString() + "@";
                genre += "@" + reader["ISBN"].ToString() + "%" + reader["Category"].ToString() + "@";
                isbn += "@" + reader["ISBN"].ToString() + "%" + reader["ISBN"].ToString() + "@";

            }


        }
        catch (Exception eer)
        {

        }

        finally
        {
            con.Close();
        }




        //string title = "@1-2%harry potter and the one@@1-3%the harry potter and the two@@1-4%harrye@";
        title = title.ToLower();
        //string author = "@1-2%jk rowling@@1-3%jk rowling@@1-4%danbrown@";
        author = author.ToLower();
        //string genre = "@1-2%fiction@@1-3%adventure@@1-4%enid blyton@";
        genre = genre.ToLower();

        string data = "";

        string search = searchtb.Text;
        search = search.ToLower();
        search = search.Trim();
        string selected = RadioButtonList1.SelectedItem.ToString();
        if (selected.Equals("All"))
        {
            data = title + author + genre;
        }
        else if (selected.Equals("Title"))
        {
            data = title;
        }
        else if (selected.Equals("Author"))
        {
            data = author;
        }
        else if (selected.Equals("Genre"))
        {
            data = genre;
        }
        else if (selected.Equals("ISBN"))
        {
            data = isbn;
        }

        data = data.Trim();
        // System.Diagnostics.Debug.WriteLine("data= "+ data);
        //System.Diagnostics.Debug.WriteLine(title);
        //System.Diagnostics.Debug.WriteLine(author);
        //System.Diagnostics.Debug.WriteLine(genre);

        string pattern = "@[\\d-]+%[\\w\\s',:\\.\\d-\\(]*" + search + "[\\w\\s',:\\.\\d-\\(]*@";
        foreach (Match m in Regex.Matches(data, pattern))
        {

            //System.Diagnostics.Debug.WriteLine("here"+m.Value);
            string find = m.Value;
            int i = find.IndexOf('%');
            string ISBN = find.Substring(1, i - 1);
            wherestring += "'" + ISBN + "',";

            System.Diagnostics.Debug.WriteLine(ISBN);

        }
        System.Diagnostics.Debug.WriteLine(wherestring);
        //SqlDataSource1.SelectCommand = "select * from Book where ISBN in (" + wherestring.Substring(0, wherestring.Length - 1) + ")";

        //   SqlDataSource1.SelectCommand = "select * from Book where ISBN='xx'";



        string cs = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
        if (wherestring.Length > 0)
        {
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
        else
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            fail.Visible = true;

        }





    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        foreach (KeyValuePair<string, int> entry in Application["procureList"] as Dictionary<string,int>)
        {
            // do something with entry.Value or entry.Key
            System.Diagnostics.Debug.Write(entry.Value + "  " + entry.Key);

        }



    }
}