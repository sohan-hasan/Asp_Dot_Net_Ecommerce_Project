<%@ Page Title="" Language="C#" MasterPageFile="~/UnauthorizedPages/LogInAndReg.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ProjectZupree.UnauthorizedPages.LoginPage" %>

<%@ Register Src="~/User_Control/LoginUserControl.ascx" TagPrefix="uc1" TagName="LoginUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:LoginUserControl runat="server" ID="LoginUserControl" />
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>
</asp:Content>
