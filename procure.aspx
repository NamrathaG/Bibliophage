<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="procure.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">





    <br />
    <br />
    
    <br />

    
        <asp:TextBox ID="searchtb" runat="server" placeholder="Search by book title or author" Width="543px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">All</asp:ListItem>
            <asp:ListItem>Title</asp:ListItem>
            <asp:ListItem>Author</asp:ListItem>
            <asp:ListItem>Genre</asp:ListItem>
            <asp:ListItem>ISBN</asp:ListItem>
        </asp:RadioButtonList>

    
    <asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField  DataField="ISBN" HeaderText="ISBN"/>
             <asp:BoundField  DataField="Title" HeaderText="Title"/>
             <asp:BoundField  DataField="Author" HeaderText="Author"/>
             <asp:BoundField  DataField="Price" HeaderText="Price"/>
             <asp:BoundField  DataField="Quantity" HeaderText="Quantity"/>
             <asp:BoundField  DataField="Category" HeaderText="Category"/>
             <asp:BoundField  DataField="Publisher" HeaderText="Publisher"/>
             <asp:BoundField  DataField="RackNo" HeaderText="RackNo"/>

           

             <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
         
            <asp:ButtonField   Text="Procure Command"  CommandName="Select" ButtonType="Button"/>
           <asp:TemplateField HeaderText="Quantity to Procure">

               <ItemTemplate>
                           <asp:TextBox ID="qtytb" runat="server" ></asp:TextBox>



               </ItemTemplate>



           </asp:TemplateField>



        </Columns>


        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />


    </asp:GridView>

    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"  Visible="false"/>


    <asp:Label ID="fail" runat="server" Text="No results." Visible="false"></asp:Label>




</asp:Content>

