<%@ Page Language="C#" AutoEventWireup="true" CodeFile="autocomplete.aspx.cs" Inherits="autocomplete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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







</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <asp:TextBox ID="TextBox1" runat="server" Width="500px"></asp:TextBox>  
                <asp:AutoCompleteExtender ServiceMethod="GetCompletionList" MinimumPrefixLength="1"  
                    CompletionInterval="10" EnableCaching="false" CompletionSetCount="1" TargetControlID="TextBox1"  
                    ID="AutoCompleteExtender1" runat="server" CompletionListCssClass="AutoExtender"  CompletionListHighlightedItemCssClass="AutoExtenderHighlight">  
                </asp:AutoCompleteExtender>  





        
    </div>
    </form>
</body>
</html>
