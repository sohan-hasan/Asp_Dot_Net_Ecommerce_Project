<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SuppliersUserControl.ascx.cs" Inherits="ProjectZupree.User_Control.SuppliersUserControl" %>
<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        
<div class="row">
    <div class="col-lg-6 col-md-9">
        <div class="card-body">
            <h2 class="title">Add Supplier</h2>
            <div class="input-group">
                <asp:TextBox ID="txtCompanyName" runat="server" placeholder="company name" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyName" Display="Dynamic" ErrorMessage="Required Company Name !" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtContactName" runat="server" placeholder="contact name" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContactName" Display="Dynamic" ErrorMessage="Required Contact Name !" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="input-group">
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="address" class="input--style-3 multiline-txt"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Required Address !" ForeColor="Red"></asp:RequiredFieldValidator>
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
                <asp:TextBox ID="txtConfirmEmail" runat="server" placeholder="Re-type Email" class="input--style-3"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtConfirmEmail" Display="Dynamic" ErrorMessage="Required Confirm Email !" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtConfirmEmail" Display="Dynamic" ErrorMessage="Please Insert a valid Email Address !" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" Display="Dynamic" ErrorMessage="CompareValidator" ForeColor="Red"></asp:CompareValidator>
            </div>
            <div class="my-3">
                <asp:Image ID="Image1" runat="server" Style="width: 100%; max-width: 100%;" /><br />
                <asp:FileUpload class="my-3" ID="FileUpload1" runat="server" Width="90px" onchange="if(confirm('upload'+this.value+'?')) this.form.submit()" /><br />
                <asp:Label ID="lblMessage" runat="server" Text="Image uploaded successfully." ForeColor="Green" Visible="false" />
                <asp:HiddenField ID="HiddenFieldImageName" runat="server" />
                <asp:HiddenField ID="HiddenFieldImageUrl" runat="server" />
            </div>
            <div class="p-t-10">
                <asp:Button ID="btnSaveSupplier" runat="server" class="btn btn--pill btn--green" Text="SAVE" Width="120px" OnClick="btnSaveSupplier_Click" />
                <asp:Button ID="btnClearSupplier" runat="server" Text="CLEAR" Width="110px" class="btn btn--pill btn--red" CausesValidation="False" />
            </div>
        </div>
    </div>
</div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSaveSupplier" />
    </Triggers>
</asp:UpdatePanel>
