<%@ Page Title="" Language="C#" MasterPageFile="~/PMangement.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="InventoryMangement1.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!DOCTYPE html>

<html>
<head>
    <title></title>
    <style type="text/css">
       
        
        .tableclass{
            background-color:aqua;
            width:600px;
            margin:auto;
            display:block;
            padding:20px;

        }

        .submitbtn{
            background:blue;
            padding:5px;
            border:1px solid red;
            color:white;
            margin-top:10px;
        }

        .submitbtn:hover{
            background:white;
            color:blue;
        }
        
        .loginbtn{
            background:green;
            padding:5px;
            border:1px solid red;
            color:white;
            margin-top:10px;
        }


        .TextBox{
            padding:5px;
        }

        .main-body{

        }
       
        .auto-style1 {
            width: 225px;
        }
       
    </style>
</head>
<body>
    
        
    <div class="main-body">
         <h2 class="auto-style2 text-center">Registration From</h2>
         <asp:HiddenField ID="hfUserID" runat="server" />
        <table class="tableclass p-4">
            
            <tr>
                <td class="auto-style1">

                    <asp:Label Text="First Name" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtFirstName" class="TextBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Last Name" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtLastName" class="TextBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Contact" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtContact" class="TextBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Gender" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:DropDownList ID="ddlGender" class="TextBox" runat="server" >
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Address" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtAddress" runat="server" class="TextBox" TextMode="MultiLine" Width="131px"  />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Username" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtUsername" class="TextBox" runat="server" />
                    <asp:Label Text="*" runat="server" ForeColor="Red" />
               
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Password" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtPassword" runat="server" class="TextBox" TextMode="Password" />
                     <asp:Label Text="*" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Confirm Password" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:TextBox ID="txtConfirmPassword" class="TextBox" runat="server" TextMode="Password" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td colspan="2" class="auto-style6">
                    <asp:Button Text="Submit" ID="btnSubmit" CssClass="submitbtn" runat="server" OnClick="btnSubmit_Click" Width="97px" />
                </td>
            </tr>
               <tr>

                <td class="auto-style1">
                    <asp:Label Text="Are You already Register, Please Register!!" runat="server" />
                </td>
                <td colspan="2" class="auto-style6">
                    <asp:Button Text="login" ID="Button1" CssClass="loginbtn" runat="server" OnClick="login_Click" Height="40px" Width="72px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td colspan="2" class="auto-style6">
                    <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td colspan="2" class="auto-style6">
                    <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
                </td>
            </tr>

        </table>
    </div>
    
</body>
</html>
</asp:Content>
