<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication8._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row">
        
        Enter your name:
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
        <asp:Label ID="Label1" runat="server" />

    </div>

    <div class="jumbotron">
        <h1>Ren's Home</h1>
        <p class="lead">Ren is starting a new chapter of his life!</p>
        <p><a href="http://www.google.com" class="btn btn-primary btn-lg">Search me! &raquo;</a></p>
    </div>

    <div class="row">
        <h1>Ren's Family</h1>
        <div class="col-md-4">
            <h2>Ren's daughter</h2>
            <p>
                FeiFei is Ren's cute little girl who is going to preschool now!
            </p>
            <p>
                <a class="btn btn-default" href="https://www.youtube.com">Watch FeiFei's cute videos! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Ren's parents</h2>
            <p>
                Ren's dad and mom live in China and they come to visit Ren once every other year.
            </p>
            <p>
                <a class="btn btn-default" href="https://www.baidu.com">Search them! &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
