<%@ Page Title="Directory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Directory.aspx.cs" Inherits="WebApplication8.Directory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <p>
            Very first ASP.NET app...
        </p>
    </div>

    <div>
    </div>

    <div>
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Export">
        </dx:ASPxButton>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportSelectedRowsOnly="False" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="UserID" OnRowDeleting="ASPxGridView1_RowDeleting1" OnRowInserting="ASPxGridView1_RowInserting" OnRowUpdating="ASPxGridView1_RowUpdating1" SettingsDataSecurity-AllowInsert="true" ForeColor="#993333">
            <SettingsPopup>
                <HeaderFilter MinHeight="140px"></HeaderFilter>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserDesc" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Password" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ModifiedBy" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsDetail ShowDetailRow="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IOSWeb_TestConnectionString %>" SelectCommand="TestGrid_GetUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>

</asp:Content>
