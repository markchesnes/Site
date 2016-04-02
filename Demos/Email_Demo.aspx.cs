﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Demos_Email_Demo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MailMessage myMessage = new MailMessage();
        myMessage.Subject = "Test Message";
        myMessage.Body = "Hello, World!";
        myMessage.From = new MailAddress("sender@sender.com", "Me");
        myMessage.To.Add(new MailAddress("sender@sender.com", "Me"));

        SmtpClient mySmtpClient = new SmtpClient();
        mySmtpClient.Send(myMessage);
    }
}