<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="updateStock.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



     <asp:GridView ID="GridView1" runat="server"   DataSourceID ="SqlDataSource1" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
          AllowPaging="True"  PageSize="6"
          AllowSorting="True"  Width="1330px"
         >
        <Columns>
            <asp:BoundField  DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN"/>
             <asp:BoundField  DataField="Title" HeaderText="Title" SortExpression="Title"/>
             <asp:BoundField  DataField="Author" HeaderText="Author" SortExpression="Author"/>
             <asp:BoundField  DataField="Price" HeaderText="Price"/>
             <asp:BoundField  DataField="Quantity" HeaderText="Quantity"/>
          
           

             <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' />
            </ItemTemplate>
        </asp:TemplateField>
         
            <asp:ButtonField   Text="Update"  CommandName="Select" ButtonType="Button"/>
           <asp:TemplateField HeaderText="Add Quantity">

               <ItemTemplate>
                           <asp:TextBox ID="qtytb" runat="server" ></asp:TextBox>



               </ItemTemplate>



           </asp:TemplateField>



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




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bookdb %>"
         SelectCommand="Select * from Book"
        
        >


    </asp:SqlDataSource>






</asp:Content>

