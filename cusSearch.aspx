<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cusSearch.aspx.cs" Inherits="_Default"   %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style>


        .AutoExtender
        {
            font-family: Verdana, Helvetica, sans-serif; 
            font-size: .8em;
             margin:0px;
            font-weight: normal; 
            border:solid 1px #006699;

            line-height:20px; 
            padding:0px;
            background-color:White; 
        }

        .AutoExtenderList
        {
            border-bottom:dotted 1px #006699; 
            cursor:default;
            color:Maroon;
            left:auto;
            margin:0px;
            
        }

        .AutoExtenderHighlight
        {
            color:White; 
            background-color:#006699;
            cursor:default; 
            margin:0px;
        }
 

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    
   
     <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

        <asp:TextBox ID="searchtb" runat="server" placeholder="Search by book title or author" style="z-index: 1; left: 23px; top: 115px; position: absolute; height: 17px; width: 658px"   ></asp:TextBox>
       
                <asp:AutoCompleteExtender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"  
                    CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="searchtb"  
                    
                     
                    ID="AutoCompleteExtender1" runat="server" CompletionListCssClass="AutoExtender"  CompletionListHighlightedItemCssClass="AutoExtenderHighlight"    >  
                </asp:AutoCompleteExtender>  
 
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" style="z-index: 1; left: 703px; top: 111px; position: absolute" />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" style="z-index: 1; left: 15px; top: 145px; position: absolute; height: 27px; width: 375px">
            <asp:ListItem Selected="True">All</asp:ListItem>
            <asp:ListItem>Title</asp:ListItem>
            <asp:ListItem>Author</asp:ListItem>
            <asp:ListItem>Genre</asp:ListItem>
            <asp:ListItem>ISBN</asp:ListItem>
        </asp:RadioButtonList>


    <asp:GridView ID="GridView1" runat="server"   AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
          AllowSorting="True"  style="z-index: 1; left: 16px; top: 187px; position: absolute; "
 Width="1330px"        
        
        >
        <Columns>
            <asp:BoundField  DataField="ISBN" HeaderText="ISBN" />
             <asp:BoundField  DataField="Title" HeaderText="Title"/>
             <asp:BoundField  DataField="Author" HeaderText="Author"/>
             <asp:BoundField  DataField="Price" HeaderText="Price"    DataFormatString="{0:c2}"/>
             <%-- <asp:BoundField DataField="RackNo" HeaderText="Rack No." /> --%>
          

             <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                    ImageUrl='<%# "data:Image/png;base64,"
                    + Convert.ToBase64String((byte[])Eval("Image")) %>' />
            </ItemTemplate>
            </asp:TemplateField>
            
            <asp:ButtonField   Text="Select"  CommandName="Select"/>



        </Columns>


        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />


    </asp:GridView>

    



       <br /><br />
        <asp:Label ID="Label1" runat="server" Text="No results." style="z-index: 1; left: 19px; top: 190px; position: absolute"  Visible="false"></asp:Label>
       <br />
       <br />
        <asp:Button ID="Button3" runat="server" Text="Add a new record &raquo;" style="z-index: 1; left: 16px; top: 216px; position: absolute"  Visible="false" />

    



    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" style="z-index: 1; left: 707px; top: 150px; position: absolute" Visible="false"  />













</asp:Content>

