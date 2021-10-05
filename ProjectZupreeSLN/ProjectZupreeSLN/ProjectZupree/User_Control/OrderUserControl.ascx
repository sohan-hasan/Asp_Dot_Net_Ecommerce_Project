<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.OrderUserControl" %>
<div class="row">
    <div class="col-lg-6 col-md-9">
        <div class="card-body">
            <h2 class="title">Add Order</h2>
             <div class="input-group">
                <asp:TextBox ID="txtCustomerName" runat="server" placeholder="customer name" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerName" Display="Dynamic" ErrorMessage="Required Contact Name !" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtPhone" runat="server" placeholder="phone" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Required Phone Number !" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="email" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Required Email !" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please Insert a valid Email Address !" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            
            <div class="input-group">
                <asp:DropDownList class="select-dropdown rs-select2 input--style-3" ID="ddlProductId" runat="server" Height="35px" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddlProductId_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
             <div class="my-3">
                <asp:Image ID="Image1" runat="server" Style="width: 100%; max-width: 100%;" />
            </div>
           <div class="input-group">
                <asp:DropDownList ID="ddlPaymentId" runat="server" Height="35px" Width="100%"  class="select-dropdown rs-select2 input--style-3">
                </asp:DropDownList>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtSalesQuantity" runat="server" placeholder="quantity" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSalesQuantity" Display="Dynamic" ErrorMessage="Required Quantity!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtSalesUnitPrice" runat="server" placeholder="unit price" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtSalesUnitPrice" Display="Dynamic" ErrorMessage="Required Unit Price !" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="p-t-10">
                <asp:Button ID="btnSaveOrder" runat="server" class="btn btn--pill btn--green" Text="SAVE" Width="120px" OnClick="btnSaveOrder_Click" />
                <asp:Button ID="btnClear" runat="server" Text="CLEAR" Width="110px" class="btn btn--pill btn--red" CausesValidation="False" />
            </div>
        </div>

    </div>
    <div class="col-lg-6 col-md-9">
        <div class="card-body">
            <h2 class="title">Add Payment Type</h2>
            <div class="input-group">
                <asp:TextBox ID="txtPaymentType" runat="server" placeholder="paymet type" class="input--style-3"></asp:TextBox><br />
            </div>
            <div class="p-t-10">
                <asp:Button ID="btnSavePaymentType" runat="server" class="btn btn--pill btn--green" Text="SAVE" Width="120px" CausesValidation="false" OnClick="btnSavePaymentType_Click"/>
            </div>
        </div>

    </div>
</div>
