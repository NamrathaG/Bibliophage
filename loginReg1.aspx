<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="loginReg1.aspx.cs" Inherits="_Default"    %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        function checkPass(source ,args)
        {
            var pass = args.Value;
            var r = /\d/;
            var r1 = /\W/;
            var r2 = /.{7,}/;
            if (r.test(pass) && r1.test(pass) && r2.test(pass)) {
               
                args.IsValid = true;

            }
            else {
                args.IsValid = false;

            }
           
        }
    </script>
     <style type="text/css">
         .auto-style1 {
             z-index: 1;
             left: 270px;
             top: 124px;
             position: absolute;
         }
         .auto-style2 {
             z-index: 1;
             left: 260px;
             top: 182px;
             position: absolute;
         }
         .auto-style3 {
             z-index: 1;
             left: 380px;
             top: 182px;
             position: absolute;
         }
         .auto-style4 {
             z-index: 1;
             left: 260px;
             top: 153px;
             position: absolute;
         }
         .auto-style5 {
             z-index: 1;
             left: 388px;
             top: 153px;
             position: absolute;
             bottom: 112px;
         }
         .auto-style6 {
             z-index: 1;
             left: 260px;
             top: 95px;
             position: absolute;
         }
         .auto-style7 {
             z-index: 1;
             left: 380px;
             top: 95px;
             position: absolute;
         }
         .auto-style8 {
             z-index: 1;
             left: 257px;
             top: 61px;
             position: absolute;
         }
         .auto-style9 {
             z-index: 1;
             left: 280px;
             top: 57px;
             position: absolute;
         }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <asp:Panel ID="Panel1" runat="server" style="z-index: 3; left: 56px; top: 175px; position: absolute; height: 137px; width: 257px" Width="257px">

            <asp:Label ID="Label1" runat="server" Text="Login" Font-Names="Edwardian Script ITC" Font-Size="55" Font-Bold="true" style="z-index: 1; left: 3px; top: -54px; position: absolute"></asp:Label>

            <br /><br />

            <asp:Label ID="Label2" runat="server" Text="Username" style="z-index: 1; left: 0px; top: 38px; position: absolute; right: 196px;"></asp:Label>
            <asp:TextBox ID="usernametb" runat="server" ValidationGroup="login" style="z-index: 1; left: 87px; top: 38px; position: absolute"></asp:TextBox>

            <br />


            <asp:Label ID="Label3" runat="server" Text="Password" style="z-index: 1; left: 0px; top: 77px; position: absolute"></asp:Label>
            <asp:TextBox ID="passwordtb" runat="server" ValidationGroup="login" style="z-index: 1; left: 87px; top: 77px; position: absolute"></asp:TextBox>

            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me!"  ValidationGroup="login" style="z-index: 1; left: 0px; top: 116px; position: absolute"/>
            <br />
            <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="loginbtn_Click" ValidationGroup="login" style="z-index: 1; left: 0px; top: 145px; position: absolute" />



        </asp:Panel>

         <asp:Panel ID="Panel2" runat="server" style="z-index: 2; left: 368px; top: 175px; position: absolute; height: 284px; width: 656px">
             <asp:Label ID="Label11" runat="server" Text="Sign Up" Font-Names="Edwardian Script ITC" Font-Size="55" Font-Bold="true" style="z-index: 1; left: -2px; top: -58px; position: absolute"></asp:Label>
             <br /><br />
             <asp:Label ID="Label4" runat="server" Text="Username" style="z-index: 1; left: 0px; top: 35px; position: absolute"></asp:Label>
             <asp:TextBox ID="new_usernametb" runat="server" style="z-index: 1; left: 125px; top: 35px; position: absolute"  OnTextChanged="usernametb_TextChanged"  AutoPostBack="true"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required"    ControlToValidate="new_usernametb" style="z-index: 1; left: 250px; top: 38px; position: absolute"   ></asp:RequiredFieldValidator>
             <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username not available" ControlToValidate="new_usernametb" OnServerValidate="checkUsername" style="z-index: 1; left: 387px; top: 38px; position: absolute"></asp:CustomValidator>
              <br />


             <asp:Label ID="Label5" runat="server" Text="Password" style="z-index: 1; left: 0px; top: 65px; position: absolute"></asp:Label>
             <asp:TextBox ID="new_passwordtb" runat="server" TextMode="Password" style="z-index: 1; left: 125px; top: 65px; position: absolute"  ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required"    ControlToValidate="new_passwordtb" CssClass="auto-style8"   ></asp:RequiredFieldValidator>
             <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Min len is 7 and use atleast one digit and special char"    ClientValidationFunction="checkPass" ControlToValidate="new_passwordtb" CssClass="auto-style9"  ></asp:CustomValidator>             <br />
            <br />


             <asp:Label ID="Label6" runat="server" Text="Confirm Password" style="z-index: 1; left: 0px; top: 95px; position: absolute"></asp:Label>  
             <asp:TextBox ID="con_passwordtb" runat="server"  TextMode="Password" style="z-index: 1; left: 125px; top: 95px; position: absolute"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords didn't match" ControlToCompare="new_passwordtb" ControlToValidate="con_passwordtb" CssClass="auto-style7" ></asp:CompareValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password"    ControlToValidate="con_passwordtb" CssClass="auto-style6"   ></asp:RequiredFieldValidator>
             <br />

             <asp:Label ID="Label7" runat="server" Text="Name" style="z-index: 1; left: 0px; top: 125px; position: absolute"></asp:Label>
             <asp:TextBox ID="nametb" runat="server" style="z-index: 1; left: 125px; top: 125px; position: absolute"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Name" ControlToValidate="nametb" CssClass="auto-style1"></asp:RequiredFieldValidator>
             <br />

             <asp:Label ID="Label8" runat="server" Text="Email" style="z-index: 1; left: 0px; top: 155px; position: absolute"></asp:Label>
             <asp:TextBox ID="emailtb" runat="server" style="z-index: 1; left: 125px; top: 155px; position: absolute"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Email" ControlToValidate="emailtb" CssClass="auto-style5"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Missing @ symbol" ValidationExpression=".+@.+" ControlToValidate="emailtb" CssClass="auto-style4"></asp:RegularExpressionValidator>
             <br />

             <%--
             <asp:Label ID="Label9" runat="server" Text="Confirm Email" style="z-index: 1; left: 0px; top: 185px; position: absolute"></asp:Label>
             <asp:TextBox ID="con_emailtb" runat="server" style="z-index: 1; left: 125px; top: 185px; position: absolute"  ></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator2" runat="server"  ControlToCompare="con_emailtb" ControlToValidate="emailtb" CssClass="auto-style3" ></asp:CompareValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Confirm Email ID" ControlToValidate="con_emailtb" CssClass="auto-style2"></asp:RequiredFieldValidator>
             <br />
                 --%>

             <asp:Label ID="Label10" runat="server" Text="User Type" style="z-index: 1; left: 0px; top: 215px; position: absolute"></asp:Label>
             <asp:DropDownList ID="typeddl" runat="server" style="z-index: 1; left: 125px; top: 215px; position: absolute" OnSelectedIndexChanged="typeddl_SelectedIndexChanged" AutoPostBack="true">
                 <asp:ListItem   Value="cus">Customer</asp:ListItem>
                  <asp:ListItem  Value="own">Owner</asp:ListItem>
                  <asp:ListItem  Value="emp">Employer</asp:ListItem>
             </asp:DropDownList>
             <br />

             <asp:Button ID="regbtn" runat="server" Text="Sign Up" OnClick="regbtn_Click" style="z-index: 1; left: 0px; top: 240px; position: absolute"  />
             <br />
           

             <asp:Label ID="successlbl" runat="server" Text="Label" Visible="false" style="z-index: 1; left: 0px; top: 279px; position: absolute"></asp:Label>

         </asp:Panel>

</asp:Content>

