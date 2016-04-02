using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_Banner : System.Web.UI.UserControl
{
    public Direction DisplayDirection
    {
        get
        {
            object _displayDirection = ViewState["DisplayDirection"];
            if (_displayDirection != null)
            {
                return (Direction)_displayDirection;
            }
            else
            {
                return Direction.Vertical; // Return a default value
            }
        }

        set
        {
            ViewState["DisplayDirection"] = value;
        }
    }

    public string NavigateUrl
    {
        get
        {
            object _navigateUrl = ViewState["NavigateUrl"];
            if (_navigateUrl != null)
            {
                return (string)_navigateUrl;
            }
            else
            {
                return "http://p2p.wrox.com"; // Return a default value
            }
        }

        set
        {
            ViewState["navigateUrl"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        HorizontalPanel.Visible = false;
        VerticalPanel.Visible = false;

        switch (DisplayDirection)
        {
            case Direction.Horizontal:
                HorizontalPanel.Visible = true;
                HorizontalLink.HRef = NavigateUrl;
                break;

            case Direction.Vertical:
                VerticalPanel.Visible = true;
                VerticalLink.HRef = NavigateUrl;
                break;
        }        
    }
}