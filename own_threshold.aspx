<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="own_threshold.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Enter the threshold"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="showbtn" runat="server" Text="Show books" OnClick="showbtn_Click" EnableTheming="false"  ForeColor="White" BackColor="#43617B"  height="30"   BorderStyle="solid" BorderColor="#43617B"  BorderWidth="1px"   />
            <br />
            <br />
     <asp:gridview ID="gv" runat="server" DataSourceID="SqlDataSource1"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Height="163px" Width="857px"
          
         >
         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
         <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="left" />
         <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
         <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F7F7F7" />
         <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
         <SortedDescendingCellStyle BackColor="#E5E5E5" />
         <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:gridview>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookdb %>"
          SelectCommand="select ISBN,Title,Author,Price,Quantity from Book"
         
         ></asp:SqlDataSource>
        </div>
</asp:Content>

