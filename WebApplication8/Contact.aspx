<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication8.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>How to contact Ren:</h3>
    <address>
        18683 SW Stubblefield Way,<br />
        Aloha, OR 97003<br />
        <abbr title="Phone">Phone:</abbr>
        541.601.8859
    </address>

    <address>
        <strong>work email:</strong>   <a href="mailto:Support@example.com">renz@certifiedlanguages.com</a><br />
        <strong>personal email:</strong> <a href="mailto:Marketing@example.com">renzicheng3@gmail.com</a>
    </address>

</asp:Content>
