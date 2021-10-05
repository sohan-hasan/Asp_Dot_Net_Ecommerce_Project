<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddSuppliers.aspx.cs" Inherits="ProjectZupree.AuthorizedPages.AddSuppliers" %>

<%@ Register Src="~/User_Control/SuppliersUserControl.ascx" TagPrefix="uc1" TagName="SuppliersUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <div class="page-wrapper  font-poppins">
        <div class="wrapper">
            <div class="card card-3">
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="GridView1" DataKeyNames="SupplierId" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1" AllowPaging="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" />
                        <asp:BoundField DataField="SupplierId" HeaderText="SupplierId" SortExpression="SupplierId" />
                        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                        <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="ImageName" HeaderText="ImageName" SortExpression="ImageName" />
                        <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" style="height:80px;width:75px;" ImageUrl='<%# Eval("ImageUrl") %>'  />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteSupplier" InsertMethod="SaveSupplier" SelectMethod="GetSupplierList" TypeName="ProjectZupree.DAL.SupplierGateWay" UpdateMethod="UpdateSupplier">
                    <DeleteParameters>
                        <asp:Parameter Name="SupplierId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="ContactName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="ImageName" Type="String" />
                        <asp:Parameter Name="ImageUrl" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="ContactName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="ImageName" Type="String" />
                        <asp:Parameter Name="ImageUrl" Type="String" />
                        <asp:Parameter Name="SupplierId" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                    </div>
                </div>
                <uc1:SuppliersUserControl runat="server" ID="SuppliersUserControl" />
            </div>
        </div>
    </div>
</asp:Content>
