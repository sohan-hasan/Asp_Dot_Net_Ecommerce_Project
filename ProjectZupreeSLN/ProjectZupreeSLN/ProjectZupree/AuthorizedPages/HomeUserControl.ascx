<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.HomeUserControl" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
        height: 363px;
    }
    .auto-style2 {
        height: 36px;
        text-align: center;
    }
    .auto-style3 {
        height: 34px;
        text-align: center;
    }
    .auto-style5 {
        height: 72px;
        text-align: center;
    }
    .auto-style6 {
        text-align: center;
    }
    .auto-style7 {
        height: 55px;
        text-align: center;
    }
</style>
<asp:Label ID="Label1" runat="server" Text="List View" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
<asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
        &nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style2" style="background-color: #0099CC">
                    <asp:Label ID="lblProductName" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="White" Text='<%# Eval("ProductName") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" style="background-color: #999999">
                    <asp:Label ID="lblProductId" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="White" Text='<%# Eval("ProductId") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Image ID="Image1" runat="server" CssClass="img-fluid"  Width="200px" Height="200px" ImageUrl='<%# Eval("ImageUrl") %>' />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:ImageButton ID="btnViewDetails" runat="server" CausesValidation="false" ImageUrl="~/App_Images/View-Details-button.png" Height="42px" Width="106px" CommandName="viewdetail" CommandArgument='<%#Eval("ProductId") %>' />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Price : "></asp:Label>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
