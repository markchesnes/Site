<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<% if(false) { %>
    <script src="../Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
<% } %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }    
</style>

<script type="text/javascript">
    function ValidatePhoneNumbers(source, args) {
        var phoneHome = document.getElementById('<%= PhoneHome.ClientID %>');
        var phoneBusiness = document.getElementById('<%= PhoneBusiness.ClientID %>');
        if (phoneHome.value != '' || phoneBusiness.value != '') 
        {
            args.IsValid = true;
        }
        else 
        {
            args.IsValid = false;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div id="TableWrapper">
            <table class="style1" runat="server" id="FormTable">
                <tr>
                    <td colspan="3">
                        <h1>
                            Get in touch with us</h1>
                        Send us a message by completing this form and pressing the button labeled 
                        &quot;Send&quot;.
                    </td>
                </tr>
                <tr>
                    <td>
                        Name</td>
                    <td>
                        <asp:TextBox ID="Name" runat="server" ToolTip="Enter your name" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="Name" CssClass="ErrorMessage" ErrorMessage="Enter your name">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email Address</td>
                    <td>
                        <asp:TextBox ID="EmailAddress" runat="server" ToolTip="Enter your email address" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="EmailAddress" CssClass="ErrorMessage" Display="Dynamic" 
                            ErrorMessage="Enter an Email Address">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="EmailAddress" CssClass="ErrorMessage" Display="Dynamic" 
                            ErrorMessage="Enter a valid Email address" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Confirm Email Address</td>
                    <td>
                        <asp:TextBox ID="ConfirmEmailAddress" runat="server" ToolTip="Confirm your email address" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="ConfirmEmailAddress" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="Confirm the Email address">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="EmailAddress" ControlToValidate="ConfirmEmailAddress" 
                            CssClass="ErrorMessage" Display="Dynamic" 
                            ErrorMessage="Retype the Email address">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Home Phone</td>
                    <td>
                        <asp:TextBox ID="PhoneHome" runat="server" ToolTip="Enter your phone number" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ClientValidationFunction="ValidatePhoneNumbers" CssClass="ErrorMessage" 
                            Display="Dynamic" ErrorMessage="Enter your home or business phone number" 
                            onservervalidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Business Phone</td>
                    <td>
                        <asp:TextBox ID="PhoneBusiness" runat="server" ToolTip="Enter your business phone number" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Comments</td>
                    <td>
                        <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" ToolTip="Enter your comment" CssClass="InputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="Comments" CssClass="ErrorMessage" Display="Dynamic" 
                            ErrorMessage="Enter a comment">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="SendButton" runat="server" Text="Send" 
                            onclick="SendButton_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            CssClass="ErrorMessage" 
                
                            HeaderText="Please correct the following errors before you press the Send button:" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="Message" Text="Message Sent" runat="server" CssClass="Attention" visible="false" />
        <p runat="server" id="MessageSentPara" visible="false">Thank you for your message. We'll get in touch with you if necessary.</p>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please wait...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<script src="../Scripts/jquery.updnWatermark.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function ()
    {
        $.updnWatermark.attachAll({ cssClass: 'Watermark' });
        $('form').bind('submit', function ()
        {
            if (Page_IsValid)
            {
                $('#TableWrapper').slideUp(3000);
            }
        });
    });
    function pageLoad()
    {
        $('.Attention').animate({ width: '600px' }, 3000).animate({ width: '100px' }, 3000).fadeOut('slow');
    }
</script>
