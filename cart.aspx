<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
     <br />
     <br />

    <asp:GridView ID="GridView1" runat="server"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged1"  AutoGenerateColumns="False"   OnRowDeleting="GridView1_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" 
         
          AllowSorting="True"  Width="1340px"
        
        >
        <Columns>
            <asp:BoundField  DataField="ISBN" HeaderText="ISBN" />
             <asp:BoundField  DataField="Title" HeaderText="Title"/>
             <asp:BoundField  DataField="Author" HeaderText="Author"/>
             <asp:BoundField  DataField="Price" HeaderText="Price"  DataFormatString="{0:c2}"/>
             <asp:BoundField  DataField="Quantity" HeaderText="Quantity"/>
          

             <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' />
            </ItemTemplate>
            </asp:TemplateField>
            

             <asp:ButtonField   Text="Update Quantity"   CommandName="Select" ButtonType="Link"/>
           <asp:TemplateField HeaderText="Quantity Change">
             <ItemTemplate>
             
                 <asp:TextBox runat="server" id ="qtytb"> </asp:TextBox>

              </ItemTemplate>
           </asp:TemplateField>
            <asp:CommandField   ShowDeleteButton="true" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"  HorizontalAlign="Left"/>
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>




  

   

    <asp:Button ID="Button1" runat="server" Text="Continue Shopping" OnClick="Button1_Click" EnableTheming="false"  ForeColor="White" BackColor="#43617B"  height="30"   BorderStyle="solid" BorderColor="#43617B"  BorderWidth="1px"   />





    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;





    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Generate Receipt" EnableTheming="false" ForeColor="White" BackColor="#43617B"  height="30"   BorderStyle="solid" BorderColor="#43617B"  BorderWidth="1px" />





</asp:Content>

