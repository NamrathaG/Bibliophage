<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="own_sales.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div>
          <br />
          <br />
          <br />
          <br />
      <asp:gridview runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
           AllowSorting="true" AutoGenerateColumns="false" Height="151px" Width="868px"
          >
          <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
          <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F7F7F7" />
          <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
          <SortedDescendingCellStyle BackColor="#E5E5E5" />
          <SortedDescendingHeaderStyle BackColor="#242121" />
           

          <Columns>

              <asp:BoundField  DataField="ISBN" HeaderText="ISBN" />
             <asp:BoundField  DataField="title" HeaderText="Title"  SortExpression="title"/>
             
             <asp:BoundField  DataField="price" HeaderText="Price" DataFormatString="{0:c2}"  SortExpression="price"/>
    <asp:BoundField  DataField="CopiesSold" HeaderText="CopiesSold" SortExpression="CopiesSold"/>

          </Columns>




          </asp:gridview>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="select sale.ISBN, title, price, CopiesSold from sale, Book where sale.ISBN = Book.ISBN" ConnectionString="<%$ ConnectionStrings:bookdb %>"></asp:SqlDataSource>
        </div>


</asp:Content>

