<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage2.master"  AutoEventWireup="true" CodeFile="loginReg.aspx.cs" Inherits="loginReg" %>

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
                <a href="loginReg.aspx.cs">loginReg.aspx.cs</a>
            }
            else {
                args.IsValid = false;

            }
           
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
    <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 17px; top: 128px; position: absolute; height: 137px; width: 257px" Width="257px">

            <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>

            <br /><br />

            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="usernametb" runat="server" ValidationGroup="login"></asp:TextBox>

            <br />


            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="passwordtb" runat="server" ValidationGroup="login"></asp:TextBox>

            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me!"  ValidationGroup="login"/>
            <br />
            <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="loginbtn_Click" ValidationGroup="login" />



        </asp:Panel>

         <asp:Panel ID="Panel2" runat="server" style="z-index: 1; left: 310px; top: 31px; position: absolute; height: 284px; width: 656px">



             <asp:Label ID="Label11" runat="server" Text="Sign Up"></asp:Label>
             <br /><br />
             <asp:Label ID="Label4" runat="server" Text="Username"></asp:Label>
             <asp:TextBox ID="new_usernametb" runat="server" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is required"    ControlToValidate="new_usernametb"   ></asp:RequiredFieldValidator>
             <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username not available" ControlToValidate="new_usernametb" OnServerValidate="checkUsername"></asp:CustomValidator>
              <br />


             <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
             <asp:TextBox ID="new_passwordtb" runat="server" TextMode="Password"  ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required"    ControlToValidate="new_passwordtb"   ></asp:RequiredFieldValidator>
             <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Min len is 7 and use atleast one digit and special char"    ClientValidationFunction="checkPass" ControlToValidate="new_passwordtb"  ></asp:CustomValidator>             <br />
            <br />


             <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label>  
             <asp:TextBox ID="con_passwordtb" runat="server"  TextMode="Password"></asp:TextBox>
             <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords didn't match" ControlToCompare="new_passwordtb" ControlToValidate="con_passwordtb" ></asp:CompareValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Email ID"    ControlToValidate="con_passwordtb"   ></asp:RequiredFieldValidator>
             <br />

             <asp:Label ID="Label7" runat="server" Text="Name"></asp:Label>
             <asp:TextBox ID="nametb" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Name" ControlToValidate="nametb"></asp:RequiredFieldValidator>
             <br />

             <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
             <asp:TextBox ID="emailtb" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Email" ControlToValidate="emailtb"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Missing @ symbol" ValidationExpression=".+@.+" ControlToValidate="emailtb"></asp:RegularExpressionValidator>
             <br />


             <asp:Label ID="Label9" runat="server" Text="Confirm Email"></asp:Label>
             <asp:TextBox ID="con_emailtb" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Confirm Email ID" ControlToValidate="con_emailtb"></asp:RequiredFieldValidator>
             <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Emails didn't match" ControlToCompare="con_emailtb" ControlToValidate="emailtb" ></asp:CompareValidator>
             <br />


             <asp:Label ID="Label10" runat="server" Text="User Type"></asp:Label>
             <asp:DropDownList ID="typeddl" runat="server">
                 <asp:ListItem   Value="cus">Customer</asp:ListItem>
                  <asp:ListItem  Value="own">Owner</asp:ListItem>
                  <asp:ListItem  Value="emp">Employer</asp:ListItem>
             </asp:DropDownList>
             <br />

             <asp:Button ID="regbtn" runat="server" Text="Sign Up" OnClick="regbtn_Click" />
             <br />

             <asp:Label ID="successlbl" runat="server" Text="Label" Visible="false"></asp:Label>

         </asp:Panel>

    
</asp:Content>

