using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void salesbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("own_sales.aspx");
    }

    protected void thresholdbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("own_threshold.aspx");
    }

    protected void procurebtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("procure.aspx");
    }
}