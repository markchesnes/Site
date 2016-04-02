using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PlanetWroxModel;

public partial class Reviews_All : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (PlanetWroxEntities myEntites = new PlanetWroxEntities())
        {
            var allReviews = from review in myEntites.Reviews
                             where review.Authorized == true
                             orderby review.CreatedDateTime descending
                             select review;
            GridView1.DataSource = allReviews;
            GridView1.DataBind();
        }
    }
}