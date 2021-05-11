<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addbook.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
.danger {
    background-color: #ffdddd;
    border-left: 6px solid #f44336;
    z-index: 1;
    left: 9px;
    top: 458px;
    position: absolute;
    height: 65px;
    width: 741px;
}

.success {
    background-color: #ddffdd;
    border-left: 6px solid #4CAF50;
    z-index: 1;
    left: 10px;
    top: 528px;
    position: absolute;
    height: 65px;
    width: 741px;
}

.info {
    background-color: #e7f3fe;
    border-left: 6px solid #2196F3;
    z-index: 1;
    left: 10px;
    top: 608px;
    position: absolute;
    height: 65px;
    width: 741px;
}


.warning {
    background-color: #ffffcc;
    border-left: 6px solid #ffeb3b;
    z-index: 1;
    left: 10px;
    top: 698px;
    position: absolute;
    height: 65px;
    width: 741px;
}

</style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <asp:Label ID="Label1" runat="server" Text="ISBN" style="z-index: 1; left: 22px; top: 138px; position: absolute"></asp:Label>
        
        <asp:TextBox ID="isbntb" runat="server" style="z-index: 1; left: 140px; top: 138px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label2" runat="server" Text="Title" style="z-index: 1; left: 22px; top: 167px; position: absolute"></asp:Label>

        <asp:TextBox ID="titletb" runat="server" style="z-index: 1; left: 140px; top: 167px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label3" runat="server" Text="Author" style="z-index: 1; left: 22px; top: 196px; position: absolute"></asp:Label>
        
        <asp:TextBox ID="authortb" runat="server" style="z-index: 1; left: 140px; top: 196px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label4" runat="server" Text="Price" style="z-index: 1; left: 22px; top: 225px; position: absolute"></asp:Label>
    
        <asp:TextBox ID="pricetb" runat="server" style="z-index: 1; left: 140px; top: 225px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label5" runat="server" Text="Quantity" style="z-index: 1; left: 22px; top: 254px; position: absolute"></asp:Label>
    
        <asp:TextBox ID="quantitytb" runat="server" style="z-index: 1; left: 140px; top: 254px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label6" runat="server" Text="Category" style="z-index: 1; left: 22px; top: 283px; position: absolute"></asp:Label> 
        <asp:TextBox ID="categorytb" runat="server" style="z-index: 1; left: 140px; top: 283px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label7" runat="server" Text="Publisher" style="z-index: 1; left: 22px; top: 312px; position: absolute"></asp:Label>
        <asp:TextBox ID="publishertb" runat="server" style="z-index: 1; left: 140px; top: 312px; position: absolute"></asp:TextBox>

        <br />

        <asp:Label ID="Label8" runat="server" Text="Rack Number" style="z-index: 1; left: 22px; top: 341px; position: absolute"></asp:Label>
        <asp:TextBox ID="racknotb" runat="server" style="z-index: 1; left: 140px; top: 341px; position: absolute"></asp:TextBox>
    
         <br />
    
         <asp:Label ID="Label9" runat="server" Text="Description" style="z-index: 1; left: 22px; top: 384px; position: absolute"></asp:Label>
        <asp:TextBox ID="descripttb" runat="server" TextMode="MultiLine" style="z-index: 1; left: 140px; top: 384px; position: absolute"></asp:TextBox>
    
         <br />
    
         <asp:Label ID="Label10" runat="server" Text="Upload image" style="z-index: 1; left: 22px; top: 429px; position: absolute"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" style="z-index: 1; left: 140px; top: 429px; position: absolute" />
     

        <br />
        <br />


        <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="Button1_Click" style="z-index: 1; left: 22px; top: 480px; position: absolute" />


       

      


    </div>


    <div id="danger" class="danger" runat="server" visible="false" >
  <p ><strong>Sorry !</strong>Could not add</p>
</div>
        

<div id="success" class="success" runat="server" visible="false">
  <p><strong>Success!</strong> Added</p>
</div>

<div id="info" class="info" runat="server" visible="false">
  <p><strong>Info!</strong> Some text...</p>
</div>

<div id="warning" class="warning" runat="server" visible="false">
  <p><strong>Warning!</strong> Some text...</p>
</div>


</asp:Content>

