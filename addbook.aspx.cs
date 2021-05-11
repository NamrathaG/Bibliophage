using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

using System.Web.Configuration;


public partial class _Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
//
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        con.ConnectionString = connectionString;
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string fileName = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(fileName);
        int filesize = postedFile.ContentLength;


        int rowsaffected = 0;


        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            byte[] img = binaryReader.ReadBytes((int)stream.Length);




            SqlCommand cmd = new SqlCommand("insert into Book values('" + isbntb.Text + "',@title,'" + authortb.Text + "'," + pricetb.Text + "," + quantitytb.Text + ",'" + categorytb.Text + "','" + publishertb.Text + "','" + racknotb.Text + "',@desc,@img)", con);

            System.Diagnostics.Debug.Write("insert into Book values('" + isbntb.Text + "','" + titletb.Text + "','" + authortb.Text + "'," + pricetb.Text + "," + quantitytb.Text + ",'" + categorytb.Text + "','" + publishertb.Text + "','" + racknotb.Text + "','" + descripttb.Text + "',@img)");
            cmd.Parameters.Add(new SqlParameter("@img", img));
            cmd.Parameters.Add(new SqlParameter("@desc", descripttb.Text));
            cmd.Parameters.Add(new SqlParameter("@title", titletb.Text));
            try
            {
                con.Open();
              rowsaffected=  cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                danger.Visible = true;
                success.Visible = false;
                System.Diagnostics.Debug.Write("here " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            if(rowsaffected>0)
            {
                danger.Visible = false;
                success.Visible = true;
            }


        }
        else
        {
            danger.Visible = true;
            success.Visible = false;
            System.Diagnostics.Debug.Write("image wrong uploaded");
        }



    }


    /*protected void Button2_Click(object sender, EventArgs e)
    {
        con.ConnectionString = connectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("select Image from Book where ISBN='xx'", con);
        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            byte[] img = (byte[])reader[0];

            Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(img);
        }


    }
    */
}