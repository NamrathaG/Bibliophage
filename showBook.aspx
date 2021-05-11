<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="showBook.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <br />
    <br />
    <br />
    <br />

    <asp:Image ID="Image1" runat="server" height="100px" Width="100px"/>

   
    <br />
    <br />

   
    <asp:Label ID="Titlelbl" runat="server" Text="Label"></asp:Label>

    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="Author: "></asp:Label>
    <asp:Label ID="Authorlbl" runat="server" Text="Label"></asp:Label>

    <br />

    <asp:Label ID="Label4" runat="server" Text="Publisher: "></asp:Label>
    <asp:Label ID="Publisherlbl" runat="server" Text="Label"></asp:Label>


    <br />


    <asp:Label ID="Label6" runat="server" Text="Price: "></asp:Label>
    <asp:Label ID="Pricelbl" runat="server" Text="Label"  ></asp:Label>


    <br />


    <asp:Label ID="Label8" runat="server" Text="ISBN: "></asp:Label>
    <asp:Label ID="ISBNlbl" runat="server" Text="Label"></asp:Label>

    <br />
    <br />

    <asp:Label ID="Label10" runat="server" Text="Description: "></asp:Label>
    <asp:Label ID="Desclbl" runat="server" Text="Label"></asp:Label>


    <br />
    <br />


    <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label>
    <asp:Label ID="categorylbl" runat="server" Text="Label"></asp:Label>

    <br />
    <br />

    <asp:Label ID="Label5" runat="server" Text="Quantity"></asp:Label>
    <asp:Label ID="quantitylbl" runat="server" Text="Label"></asp:Label>


    <asp:Button ID="Button1" runat="server" Text="ADD TO CART" OnClick="Button1_Click"   EnableTheming="false"  ForeColor="White" BackColor="#43617B"  height="30"   BorderStyle="solid" BorderColor="#43617B"  BorderWidth="1px"  />




    <asp:Button ID="Button2" runat="server" Text="GO TO CART"  Visible="false" OnClick="Button2_Click"  EnableTheming="false"  ForeColor="White" BackColor="#43617B"  height="30"   BorderStyle="solid" BorderColor="#43617B"  BorderWidth="1px" />




    <asp:Button ID="Button3" runat="server" Text="Request" OnClick="Button3_Click" Visible="false"/>
    <asp:Label ID="notinstocklbl" runat="server" Text="SORRY NOT IN STOCK :(" Visible="false" ForeColor="Red" Font-Bold="true" Font-Size="Large"></asp:Label>




</asp:Content>

