using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    string connectionString = WebConfigurationManager.ConnectionStrings["bookdb"].ConnectionString;
    SqlConnection con = new SqlConnection();
    string role = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["username"];



        if (cookie != null)
        {
            role = cookie["role"];
            Response.Redirect("blank.aspx");

            /*
                        if (role.Equals("cus"))
                            Response.Redirect("cusSearch.aspx");
                        else if (role.Equals("man"))
                            Response.Redirect("managerhome.aspx");
                        else if (role.Equals("emp"))
                            Response.Redirect("employerhome.aspx");
                        else if (role.Equals("own"))
                            Response.Redirect("owner.aspx");
                        else { }*/
        }



    }


    protected void checkUsername(object source, ServerValidateEventArgs args)
    {
        args.IsValid = true;
    }

    protected void regbtn_Click(object sender, EventArgs e)
    {
        int r = 0;
        con.ConnectionString = connectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into users values('" + new_usernametb.Text + "','" + new_passwordtb.Text + "','" + nametb.Text + "','" + emailtb.Text + "','" + typeddl.SelectedItem.Value + "')", con);

        try
        {
            r = cmd.ExecuteNonQuery();
            System.Diagnostics.Debug.Write("r==========" + r);
        }
        catch (Exception eer)
        {

        }
        finally
        {
            con.Close();
        }
        if (r > 0)
        {
            successlbl.Text = "Successfully registered!";
            successlbl.Visible = true;
        }

    }

    protected void loginbtn_Click(object sender, EventArgs e)
    {

        string pass = "";

        con.ConnectionString = connectionString;
        try
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("select password,role from users where username='" + usernametb.Text + "'", con);

            System.Diagnostics.Debug.Write("select password from users where username='" + usernametb.Text + "'");
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                pass = reader[0].ToString();
                role = reader["role"].ToString();
                // System.Diagnostics.Debug.Write("i am here ");

            }


        }
        catch (Exception eer)
        {

        }

        finally
        {
            con.Close();
        }

        if ((passwordtb.Text.Trim()).Equals(pass.Trim()))
        {
            Session["role"] = role;
            Session["username"] = usernametb.Text;

            if (CheckBox1.Checked)
            {
                System.Diagnostics.Debug.Write("I did craete");
                HttpCookie cookie = new HttpCookie("username");
                cookie["username"] = usernametb.Text;
                cookie["role"] = role;
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("blank.aspx");
            //if (role.Equals("cus"))
            //    Response.Redirect("cusSearch.aspx");
            //else if (role.Equals("man"))
            //    Response.Redirect("managerhome.aspx");
            //else if (role.Equals("emp"))
            //    Response.Redirect("employerhome.aspx");
            //else if (role.Equals("own"))
            //    Response.Redirect("ownerhome.aspx");
            //else { }

        }
        else
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Username or Password')", true);
        }

    }

    protected void usernametb_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con_chkusr = new SqlConnection(connectionString);
        SqlCommand cmd_chkusr = new SqlCommand("select * from users where username=@text", con_chkusr);
        cmd_chkusr.Parameters.AddWithValue("@text", new_usernametb.Text);
        try
        {
            //

            con_chkusr.Open();
                    SqlDataReader rdr = cmd_chkusr.ExecuteReader();
                
                    if (rdr.Read())
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Username not available')", true);

                    }
                 
                

            
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.Write(ex.Message);
        }
        finally
        {
            con_chkusr.Close();
        }
        





    }

    protected void typeddl_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
}