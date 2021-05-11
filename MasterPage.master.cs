using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        string role = Session["role"].ToString();
        if (role != null)
        {


            if (role.Equals("cus"))
            {
                search.Visible = true;
                cart.Visible = true;
            }
            else if (role.Equals("own"))
            {

                threshold.Visible = true;
                sales.Visible = true;
                procure.Visible = true;
            }
            else if (role.Equals("emp"))
            {
                addBook.Visible = true;
                updateStock.Visible = true;
            }
            else { }

         }



    }

    protected void logoutbtn_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["username"];
        if(cookie!=null)
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
        }
        Session.Clear();
        Session.Abandon();
        Response.Redirect("loginReg1.aspx");
    }
}
