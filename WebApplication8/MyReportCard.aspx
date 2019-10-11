<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyReportCard.aspx.cs" Inherits="WebApplication8.MyReportCard" %>

<asp:Content ContentPlaceHolderID="ControlOptionsTopHolder" runat="server">
    <div class="options">
        <div class="options-item">
            <dx:ASPxCheckBox ID="chkMemoLocation" runat="server" Checked="False" OnCheckedChanged="chkMemoLocation_CheckedChanged" Text="Show memo at bottom" AutoPostBack="True" Theme="MaterialCompactOrange" />
        </div>
        <div class="options-item">
            <dx:ASPxCheckBox ID="chkNewRowLocation" runat="server" Checked="False" OnCheckedChanged="chkNewRowLocation_CheckedChanged" Text="Show New Item row at bottom" AutoPostBack="True" Theme="MaterialCompactOrange" />
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentHolder" Runat="server">
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="DemoDataSource1"
        KeyFieldName="EmployeeID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true" VisibleIndex="0" />
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="1">
                <EditFormSettings VisibleIndex="0" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataColumn FieldName="Title" VisibleIndex="4">
                <EditFormSettings VisibleIndex="1" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataMemoColumn FieldName="Notes" Visible="False">
                <EditFormSettings VisibleIndex="2" Visible="True" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataColumn FieldName="LastName" VisibleIndex="2">
                <EditFormSettings VisibleIndex="3" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="BirthDate" VisibleIndex="3">
                <EditFormSettings VisibleIndex="4" />
            </dx:GridViewDataColumn>
            <dx:GridViewDataColumn FieldName="HireDate" VisibleIndex="5">
                <EditFormSettings VisibleIndex="5" />
            </dx:GridViewDataColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords"/>
        <EditFormLayoutProperties ColCount="3">
            <Items>
                <dx:GridViewColumnLayoutItem ColumnName="FirstName" />
                <dx:GridViewColumnLayoutItem ColumnName="Title" />
                <dx:GridViewColumnLayoutItem ColumnName="Notes" />
                <dx:GridViewColumnLayoutItem ColumnName="LastName" />
                <dx:GridViewColumnLayoutItem ColumnName="BirthDate" />
                <dx:GridViewColumnLayoutItem ColumnName="HireDate" />
                <dx:EditModeCommandLayoutItem Width="100%" HorizontalAlign="Right" />
            </Items>
        </EditFormLayoutProperties>
        <EditFormLayoutProperties>
            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
        </EditFormLayoutProperties>
    </dx:ASPxGridView>
    <demo:DemoDataSource runat="server" ID="DemoDataSource1" IdentityKey="EmployeeID" DataSourceID="EmployeesDataSource" />
    <ef:EntityDataSource runat="server" ID="EmployeesDataSource"
        ContextTypeName="DevExpress.Web.Demos.NorthwindContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True"
        EntitySetName="Employees" />
</asp:Content>