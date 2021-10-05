<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="ProjectZupree.AuthorizedPages.ViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 38px;
        }
        .auto-style2 {
        }
        .auto-style3 {
            text-align: center;
            width:50%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="Label5" runat="server" Text="List View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1" Width="100%">
        <ItemTemplate>
            <div class="text-left">
                <table class="w-100">
                    <tr>
                        <td class="auto-style1" colspan="2" style="background-color: #0099CC">
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Image ID="Image2" runat="server" Height="300px" ImageUrl='<%# Eval("ImageUrl") %>' Width="300px" />
                        </td>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server" Text="Products - Food &amp; Drinks - Jewellery &amp; Watches Cosmetics. Easy access - 3 studios . Photography &amp; film production."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: #C0C0C0">
                            <asp:Label ID="Label2" runat="server" Text="Tk. " ForeColor="White"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("UnitPrice") %>' ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:ImageButton ID="ImageButton1" CausesValidation="false" ImageUrl="~/App_Images/buy-now.png" runat="server" Height="84px" Width="161px" OnClick="ImageButton1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" SelectCommand="SELECT * FROM [Products] WHERE ([ProductId] = @ProductId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductId" QueryStringField="ProductId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="Details View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <asp:DetailsView ID="DetailsView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" Height="50px" Width="100%">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:Label ID="Label6" runat="server" Text="Form View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource2" GridLines="Both" AllowPaging="True" DataKeyNames="ProductId" Width="100%">
        <EditItemTemplate>
            ProductId:
            <asp:Label ID="ProductIdLabel1" runat="server" Text='<%# Eval("ProductId") %>' />
            <br />
            ProductName:
            <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
            <br />
            PurchaseDate:
            <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
            <br />
            SupplierId:
            <asp:TextBox ID="SupplierIdTextBox" runat="server" Text='<%# Bind("SupplierId") %>' />
            <br />
            CategoryId:
            <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            UnitPrice:
            <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
            <br />
            MSRP:
            <asp:TextBox ID="MSRPTextBox" runat="server" Text='<%# Bind("MSRP") %>' />
            <br />
            ImageName:
            <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
            <br />
            ImageUrl:
            <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            ProductName:
            <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
            <br />
            PurchaseDate:
            <asp:TextBox ID="PurchaseDateTextBox" runat="server" Text='<%# Bind("PurchaseDate") %>' />
            <br />
            SupplierId:
            <asp:TextBox ID="SupplierIdTextBox" runat="server" Text='<%# Bind("SupplierId") %>' />
            <br />
            CategoryId:
            <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            UnitPrice:
            <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
            <br />
            MSRP:
            <asp:TextBox ID="MSRPTextBox" runat="server" Text='<%# Bind("MSRP") %>' />
            <br />
            ImageName:
            <asp:TextBox ID="ImageNameTextBox" runat="server" Text='<%# Bind("ImageName") %>' />
            <br />
            ImageUrl:
            <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            ProductId:
            <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("ProductId") %>' />
            <br />
            ProductName:
            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>' />
            <br />
            PurchaseDate:
            <asp:Label ID="PurchaseDateLabel" runat="server" Text='<%# Bind("PurchaseDate") %>' />
            <br />
            SupplierId:
            <asp:Label ID="SupplierIdLabel" runat="server" Text='<%# Bind("SupplierId") %>' />
            <br />
            CategoryId:
            <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Bind("CategoryId") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            UnitPrice:
            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice") %>' />
            <br />
            MSRP:
            <asp:Label ID="MSRPLabel" runat="server" Text='<%# Bind("MSRP") %>' />
            <br />
            ImageName:
            <asp:Label ID="ImageNameLabel" runat="server" Text='<%# Bind("ImageName") %>' />
            <br />
            ImageUrl:
            <asp:Image ID="Image3" runat="server" Height="200px" ImageUrl='<%# Eval("ImageUrl") %>' Width="200px" />
            <br />
        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:FormView>
    <asp:Label ID="Label7" runat="server" Text="Tree View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <div style="font-family: Arial">    
             <asp:TreeView runat="server" ID="TreeView1">    
                 <Nodes>    
                   <asp:TreeNode Text="Home" NavigateUrl="../index" Target="_blank"/>    
                    <asp:TreeNode Text="Suppliers" NavigateUrl="../suppliers" Target="_blank">    
                      <asp:TreeNode Text="Product" NavigateUrl="../product" Target="_blank" />    
                      <asp:TreeNode Text="Order" NavigateUrl="../order" Target="_blank" />      
                   </asp:TreeNode>    
                    <asp:TreeNode Text="Employer" NavigateUrl="~/Employer.aspx" Target="_blank">    
                        <asp:TreeNode Text="Upload Job" NavigateUrl="~/Upload_Job.aspx" Target="_blank" />    
                        <asp:TreeNode Text="Edit Job" NavigateUrl="~/Edit_Job.aspx" Target="_blank" />    
                        <asp:TreeNode Text="View Job" NavigateUrl="~/View_Job.aspx" Target="_blank" />    
                    </asp:TreeNode>    
                    <asp:TreeNode Text="Admin" NavigateUrl="~/Admin.aspx" Target="_blank">    
                       <asp:TreeNode Text="Add User" NavigateUrl="~/Add_User.aspx" Target="_blank" />    
                       <asp:TreeNode Text="Edit User" NavigateUrl="~/Edit_Use.aspx" Target="_blank" />    
                       <asp:TreeNode Text="View User" NavigateUrl="~/View_User.aspx" Target="_blank" />    
                    </asp:TreeNode>    
                 </Nodes>    
             </asp:TreeView>    
         </div>    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ZupreeDB %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
    <asp:Label ID="Label8" runat="server" Text="Multi View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <asp:MultiView ID="MultiView1" runat="server">  
  
                <asp:View ID="View1" runat="server">  
                    <table style="width: 100%;">  
                        <tr>  
                            <td class="auto-style4"><strong>Customer Details</strong></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style4">Customer FirstName</td>  
                            <td>  
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>  
                            <td></td>  
                        </tr>  
                        <tr>  
                            <td class="auto-style4">Customer LastName</td>  
                            <td>  
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>  
                            <td> </td>  
                        </tr>  
                        <tr>  
                            <td class="auto-style4"> </td>  
                            <td>  
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Next" />  
                            </td>  
                            <td> </td>  
                        </tr>  
                    </table>  
  
                </asp:View>  
                <asp:View ID="View2" runat="server">  
                    <table style="width: 100%;">  
                        <tr>  
                            <td class="auto-style3"><strong>Customer Personal Detail</strong></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style3">Customer Phone</td>  
                            <td>  
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style3">Customer Type</td>  
                            <td>  
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style3">  
                                <asp:Button ID="Button3" runat="server" Text="Previous" OnClick="Button3_Click" />  
                            </td>  
                            <td>  
                                <asp:Button ID="Button4" runat="server" Text="Next" OnClick="Button4_Click" />  
                            </td>  
                        </tr>  
                    </table>  
  
  
                </asp:View>  
                <asp:View ID="View3" runat="server">  
  
                    <table style="width: 100%;">  
                        <tr>  
                            <td class="auto-style2"><strong>Customer Personal Detail</strong></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style2">Student EmailId</td>  
                            <td>  
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style2">Student City</td>  
                            <td>  
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style2">Student State</td>  
                            <td>  
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>  
  
                        </tr>  
                        <tr>  
                            <td class="auto-style2">  
                                <asp:Button ID="Button5" runat="server" Text="Previous" OnClick="Button5_Click" />  
                            </td>  
                            <td>  
                                <asp:Button ID="Button6" runat="server" Text="Next" OnClick="Button6_Click" style="height: 26px" />  
                            </td>  
                        </tr>  
                    </table>  
  
                </asp:View>  
                <asp:View ID="View4" runat="server">  
  
                    <table class="auto-style1">  
                        <tr>  
                            <td><strong>Customer Details</strong></td>  
  
                            <td> </td>  
  
                        </tr>  
                        <tr>  
                            <td>Customer FirstName:</td>  
                            <td>  
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>  
                            </td>  
                            <td> </td>  
  
                        </tr>  
                        <tr>  
                            <td>Customer LastName:</td>  
  
                            <td>  
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>  
                            </td>  
  
                        </tr>  
  
                        <tr>  
                            <td></td>  
                            <td> </td>  
                        </tr>  
                        <tr>  
                            <td><strong>Customer Personal Details</strong></td>  
                            <td> </td>  
                        </tr>  
  
                        <tr>  
                            <td>Customer Phone :</td>  
                            <td>  
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>  
                            </td>  
                        </tr>  
                        <tr>  
                            <td>Customer Type:</td>  
                            <td>  
                                <asp:Label ID="Label9" runat="server" Text=""></asp:Label>  
                            </td>  
                        </tr>  
  
                        <tr>  
                            <td> </td>  
                            <td> </td>  
                        </tr>  
                        <tr>  
                            <td><strong>Customer Personal Details</strong></td>  
                            <td> </td>  
                        </tr>  
                        <tr>  
                            <td>Customer EmailId:</td>  
                            <td>  
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>  
                            </td>  
                        </tr>  
                        <tr>  
                            <td>Customer City:</td>  
                            <td>  
                                <asp:Label ID="Label11" runat="server" Text=""></asp:Label>  
                            </td>  
                        </tr>  
                        <tr>  
                            <td>Customer State:</td>  
                            <td>  
                                <asp:Label ID="Label12" runat="server" Text=""></asp:Label>  
                            </td>  
                        </tr>  
  
                    </table>  
                </asp:View>  
            </asp:MultiView> 

    <asp:Label ID="Label20" runat="server" Text="Wizard View Control:" ForeColor="#000099" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="210px" OnNextButtonClick="Wizard1_NextButtonClick" Width="496px">  
            <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" HorizontalAlign="Center" />  
            <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />  
            <SideBarButtonStyle ForeColor="White" />  
            <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />  
            <WizardSteps>  
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Customer Details">  
                    <table style="width: 100%;">  
                        <tr>  
                            <td><strong>Customer Details</strong></td>  
                              
                        </tr>  
                        <tr>  
                            <td>Customer FirstName</td>  
                            <td><asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>  
                            <td></td>  
                        </tr>  
                        <tr>  
                            <td>Customer LastName</td>  
                            <td><asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>  
                            <td> </td>  
                        </tr>  
                    </table>  
  
  
                </asp:WizardStep>  
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Customer Personal Details">  
                     <table style="width: 100%;">  
                    <tr>  
                        <td><strong>Customer Personal Detail</strong></td>  
                         
                    </tr>  
                    <tr>  
                        <td>Customer Phone</td>  
                        <td><asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>  
                         
                    </tr>  
                    <tr>  
                        <td>Customer Type</td>  
                        <td><asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>  
                          
                    </tr>  
                </table>  
  
                </asp:WizardStep>  
                 <asp:WizardStep ID="WizardStep3" runat="server" Title="Customer Personal Details">  
                <table style="width: 100%;">  
                    <tr>  
                        <td><strong>Customer Personal Detail</strong></td>  
                        
                    </tr>  
                    <tr>  
                        <td>Customer EmailId</td>  
                        <td><asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>  
                          
                    </tr>  
                    <tr>  
                        <td>Customer City</td>  
                        <td><asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>  
                         
                    </tr>  
                    <tr>  
                        <td>Customer State</td>  
                        <td><asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>  
                         
                    </tr>  
                </table>  
  
            </asp:WizardStep>  
  
                 <asp:WizardStep ID="WizardStep4" runat="server" Title="Customer Summary">  
                       
                     <table class="auto-style1">  
                         <tr>  
                             <td><strong>Customer Details</strong></td>  
                               
                             <td> </td>  
                               
                         </tr>  
                         <tr>  
                             <td>  
                                 Customer FirstName:</td>  
                             <td>  
                                 <asp:Label ID="Label13" runat="server" Text=""></asp:Label>  
                                 </td>  
                             <td> </td>  
                               
                         </tr>  
                         <tr>  
                             <td>Customer LastName:</td>  
                               
                             <td>  
                                 <asp:Label ID="Label14" runat="server" Text=""></asp:Label>  
                             </td>  
                               
                         </tr>  
                           
                         <tr>  
                             <td></td>  
                             <td> </td>  
                         </tr>  
                         <tr>  
                             <td><strong>Customer Personal Details</strong></td>  
                             <td> </td>  
                         </tr>  
                           
                         <tr>  
                             <td>Customer Phone:</td>  
                             <td>  
                                 <asp:Label ID="Label15" runat="server" Text=""></asp:Label>  
                             </td>  
                         </tr>  
                          <tr>  
                             <td>Customer Type:</td>  
                             <td>  
                                 <asp:Label ID="Label16" runat="server" Text=""></asp:Label>  
                              </td>  
                         </tr>  
                           
                         <tr>  
                             <td> </td>  
                             <td> </td>  
                         </tr>  
                         <tr>  
                             <td><strong>Customer Personal Details</strong></td>  
                             <td> </td>  
                         </tr>  
                         <tr>  
                             <td>Customer EmailId:</td>  
                             <td>  
                                 <asp:Label ID="Label17" runat="server" Text=""></asp:Label>  
                             </td>  
                         </tr>  
                         <tr>  
                             <td>Customer City:</td>  
                             <td>  
                                 <asp:Label ID="Label18" runat="server" Text=""></asp:Label>  
                             </td>  
                         </tr>  
                         <tr>  
                             <td>Customer State:</td>  
                             <td>  
                                 <asp:Label ID="Label19" runat="server" Text=""></asp:Label>  
                             </td>  
                         </tr>  
                           
                     </table>  
                </asp:WizardStep>  
  
                 
            </WizardSteps>  
             
        </asp:Wizard>  
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
