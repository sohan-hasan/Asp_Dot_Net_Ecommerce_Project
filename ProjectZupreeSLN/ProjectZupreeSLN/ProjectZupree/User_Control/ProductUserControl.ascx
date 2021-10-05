<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.ProductUserControl" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="row">
            <div class="col-lg-6 col-md-9">
                <div class="card-body">
                    <h2 class="title">Add New Product</h2>
                    <div class="input-group">
                        <asp:TextBox ID="txtProductName" runat="server" placeholder="product Name" class="input--style-3"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtProductName" Display="Dynamic" ErrorMessage="Required Contact Name !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtPurchaseDate" runat="server" Width="150px" class="input--style-3 js-datepicker" type="text" placeholder="purchase date" name="PurchaseDate"></asp:TextBox>
                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPurchaseDate" Display="Dynamic" ErrorMessage="Required Purchase Date !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:DropDownList ID="ddlCompany" runat="server" Height="35px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" class="select-dropdown rs-select2 input--style-3">
                        </asp:DropDownList>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="supplier phone" ReadOnly="True" class="input--style-3"></asp:TextBox>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="supplier email" ReadOnly="True" class="input--style-3"></asp:TextBox><br />
                    </div>
                    <div class="input-group">
                        <asp:DropDownList class="select-dropdown rs-select2 input--style-3" ID="ddlCategory" runat="server" Height="35px" Width="100%">
                        </asp:DropDownList>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtPurchaseQuantity" runat="server" placeholder="quantity" class="input--style-3"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPurchaseQuantity" Display="Dynamic" ErrorMessage="Required Quantity!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtPurchaseUnitPrice" runat="server" placeholder="unit price" class="input--style-3"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPurchaseUnitPrice" Display="Dynamic" ErrorMessage="Required Unit Price !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group">
                        <asp:TextBox ID="txtMaximumSalesRetailPrice" runat="server" placeholder="M.S.R.P." class="input--style-3"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtMaximumSalesRetailPrice" Display="Dynamic" ErrorMessage="Required Unit Price !" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="my-3">
                        <asp:Image ID="Image1" runat="server" Style="width: 100%; max-width: 100%;" /><br />
                        <asp:FileUpload class="my-3" ID="FileUpload1" runat="server" Width="90px" onchange="if(confirm('upload'+this.value+'?')) this.form.submit()" /><br />
                        <asp:Label ID="lblMessage" runat="server" Text="Image uploaded successfully." ForeColor="Green" Visible="false" />
                        <asp:HiddenField ID="HiddenFieldImageName" runat="server" />
                        <asp:HiddenField ID="HiddenFieldImageUrl" runat="server" />
                    </div>
                    <div class="p-t-10">
                        <asp:Button ID="btnSaveProduct" runat="server" class="btn btn--pill btn--green" Text="SAVE" Width="120px" OnClick="btnSaveProduct_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="CLEAR" Width="110px" class="btn btn--pill btn--red" CausesValidation="False" />
                    </div>
                </div>

            </div>
            <div class="col-lg-6 col-md-9">
                <div class="card-body">
                    <h2 class="title">Add New Category</h2>
                    <div class="input-group">
                        <asp:TextBox ID="txtCategoryName" runat="server" placeholder="category name" class="input--style-3"></asp:TextBox><br />
                    </div>
                    <div class="p-t-10">
                        <asp:Button ID="btnSaveCategory" runat="server" class="btn btn--pill btn--green" Text="SAVE" Width="120px" CausesValidation="false" OnClick="btnSaveCategory_Click" />
                    </div>
                </div>

            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSaveProduct" />
    </Triggers>
</asp:UpdatePanel>


