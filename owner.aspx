<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="owner.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



        <div>
        <asp:Button ID="salesbtn" runat="server" Text="Sales stats" OnClick="salesbtn_Click" />
        <asp:Button ID="thresholdbtn" runat="server" Text="Books below threshold" OnClick="thresholdbtn_Click" />
        <asp:Button ID="procurebtn" runat="server" Text="Procure new books" OnClick="procurebtn_Click" />
        </div>















</asp:Content>

