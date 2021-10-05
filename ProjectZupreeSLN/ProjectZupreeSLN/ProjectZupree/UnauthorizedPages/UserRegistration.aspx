<%@ Page Title="" Language="C#" MasterPageFile="~/UnauthorizedPages/LogInAndReg.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="ProjectZupree.UnauthorizedPages.UserRegistration" %>

<%@ Register Src="~/User_Control/RegistrationUserControl.ascx" TagPrefix="uc1" TagName="RegistrationUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <uc1:registrationusercontrol runat="server" id="RegistrationUserControl" />
</asp:Content>
