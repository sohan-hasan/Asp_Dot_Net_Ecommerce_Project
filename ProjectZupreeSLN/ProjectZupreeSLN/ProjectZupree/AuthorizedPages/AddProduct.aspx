<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ProjectZupree.AuthorizedPages.AddProduct" %>

<%@ Register Src="~/User_Control/ProductUserControl.ascx" TagPrefix="uc1" TagName="ProductUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-wrapper  font-poppins">
        <div class="wrapper">
            <div class="card card-3">
                <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" />
                        <asp:BoundField DataField="ProductId" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="ProductId">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PurchaseDate" SortExpression="PurchaseDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPurchaseDate" class="js-datepicker" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("PurchaseDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supplier" SortExpression="SupplierId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlSupplierCompanyName" runat="server" SelectedValue='<%# Bind("SupplierId") %>' DataTextField="CompanyName" DataValueField="SupplierId" DataSourceID="SqlDataSource3"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlSupplierCompanyName" runat="server" SelectedValue='<%# Bind("SupplierId") %>' DataTextField="CompanyName" DataValueField="SupplierId" DataSourceID="SqlDataSource3" Enabled="false"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Category" SortExpression="CategoryId">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlProductCategory" runat="server" SelectedValue='<%# Bind("CategoryId") %>' DataTextField="CategoryName" DataValueField="CategoryId" DataSourceID="SqlDataSource2"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlProductCategory" runat="server" SelectedValue='<%# Bind("CategoryId") %>' Enabled="false" DataTextField="CategoryName" DataValueField="CategoryId" DataSourceID="SqlDataSource2"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUnitPrice" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MSRP" SortExpression="MSRP">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMSRP" runat="server" Text='<%# Bind("MSRP") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("MSRP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Style="height: 80px; width: 75px;" ImageUrl='<%# Eval("ImageUrl") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ImageName" SortExpression="ImageName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtImageName" runat="server" Text='<%# Bind("ImageName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ImageName") %>'></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [PurchaseDate], [SupplierId], [CategoryId], [Quantity], [UnitPrice], [MSRP], [ImageUrl], [ImageName]) VALUES (@ProductName, @PurchaseDate, @SupplierId, @CategoryId, @Quantity, @UnitPrice, @MSRP, @ImageUrl, @ImageName)" SelectCommand="SELECT [ProductId], [ProductName], [PurchaseDate], [SupplierId], [CategoryId], [Quantity], [UnitPrice], [MSRP], [ImageUrl], [ImageName] FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [PurchaseDate] = @PurchaseDate, [SupplierId] = @SupplierId, [CategoryId] = @CategoryId, [Quantity] = @Quantity, [UnitPrice] = @UnitPrice, [MSRP] = @MSRP, [ImageUrl] = @ImageUrl, [ImageName] = @ImageName WHERE [ProductId] = @ProductId">
                    <DeleteParameters>
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="PurchaseDate" Type="DateTime" />
                        <asp:Parameter Name="SupplierId" Type="Int32" />
                        <asp:Parameter Name="CategoryId" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="MSRP" Type="Decimal" />
                        <asp:Parameter Name="ImageUrl" Type="String" />
                        <asp:Parameter Name="ImageName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="PurchaseDate" Type="DateTime" />
                        <asp:Parameter Name="SupplierId" Type="Int32" />
                        <asp:Parameter Name="CategoryId" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="UnitPrice" Type="Decimal" />
                        <asp:Parameter Name="MSRP" Type="Decimal" />
                        <asp:Parameter Name="ImageUrl" Type="String" />
                        <asp:Parameter Name="ImageName" Type="String" />
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" SelectCommand="SELECT * FROM [Suppliers]"></asp:SqlDataSource>
                
                <uc1:ProductUserControl runat="server" ID="ProductUserControl" />
            </div>
        </div>
    </div>
</asp:Content>
