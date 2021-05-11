<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="generateReceipt.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <br />
    <br />

    
    <asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
          
          AllowSorting="True"  Width="1340px"
        >
        <Columns>
            <asp:BoundField  DataField="ISBN" HeaderText="ISBN" />
             <asp:BoundField  DataField="Title" HeaderText="Title"/>
             <asp:BoundField  DataField="Author" HeaderText="Author"/>
             <asp:BoundField  DataField="Price" HeaderText="Price" DataFormatString="{0:c2}"/>
           
          

             <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' />
            </ItemTemplate>
            </asp:TemplateField>
            

            
           <asp:TemplateField HeaderText="Quantity Ordered">
             <ItemTemplate>
             
                 <asp:Label runat="server" ID="qtytb"></asp:Label>
                 

              </ItemTemplate>
           </asp:TemplateField>
            
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  HorizontalAlign="left"/>
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>




    <asp:Label ID="Label1" runat="server" Text="Total Price: "></asp:Label>

    <asp:Label ID="totallbl" runat="server" Text=""></asp:Label>









</asp:Content>

