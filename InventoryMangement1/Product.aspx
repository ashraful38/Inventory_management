<%@ Page Title="" Language="C#" MasterPageFile="~/PMangement.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="InventoryMangement1.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
    .auto-style41 {
        text-align: center;
    }
    .auto-style43 {
            text-align: right;
            width: 608px;
        }
    .auto-style44 {
        text-align: left;
    }
        .auto-style51 {
            text-align: center;
        }
        .auto-style52 {
            color: #003399;
        }

    .tablenew{
        margin:auto;
        background:aqua;
        display:inline-block;
        padding:20px;
        text-align:center;
    }

        .btnsty1{
            background:blue;
            color:white;
            margin:10px;
            padding:10px;
            display:inline-block;
            
        }

       .btnsty1:hover{
            background:white;
            color:blue;
        }
         .auto-style53 {
             margin: auto;
             background: aqua;
             display: inline-block;
             padding: 20px;
             text-align: center;
             width: 403px;
         }

         .TextBox{
            padding:5px;
           margin:2px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="auto-style41">
    <h3 class="auto-style52">Product</h3>
        <asp:HiddenField ID="hfProductId" runat="server"  />
     <div class="auto-style53">
          <table class="w-100">
        <tr>
            <td class="auto-style43 float-left" colspan="2">Product Name:</td>
            <td class="auto-style44" colspan="2">
                <asp:TextBox ID="txtproname" class="TextBox" runat="server" Width="128px"></asp:TextBox>
            </td>
        </tr>

         <tr>
            <td class="auto-style43 float-left" colspan="2">Color:</td>
            <td class="auto-style44" colspan="2">
                <asp:TextBox ID="Txtcolor" class="TextBox" runat="server" Width="128px"></asp:TextBox>
            </td>
        </tr>

         <tr>
            <td class="auto-style43" colspan="2">Catagory Name :</td>
            <td class="auto-style44" colspan="2">
                <asp:DropDownList ID="DropDownCatagory" runat="server" class="TextBox" Height="36px" Width="128px" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownSupplier_SelectedIndexChanged">
                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button class="btnsty1" ID="btnsave" runat="server" Width="72px" Text="Save" Font-Bold="True"  OnClick="btnsave_Click"  />
            </td>
            <td>
                <asp:Button ID="btndelete" runat="server" Text="Delete" Width="72px"  class="btnsty1" Font-Bold="True" OnClick="btndelete_Click" />
            </td>
            <td>
                <asp:Button ID="btnclear" runat="server" Width="72px" Text="Clear" Font-Bold="True"  class="btnsty1" OnClick="btnclear_Click" />
            </td>
            <td class="text-start">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblsuccessmassage" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
     </div>
        <h4>
            <br />
            <span class="auto-style52">Product List</span><br />
        <br />
        </h4>
        <div class="auto-style51">
        <asp:GridView ID="productGrid" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center"  Width="511px"  >
            <columns>
                <asp:BoundField Datafield="ProductId" HeaderText="Product Id" />
                <asp:BoundField Datafield="ProductName" HeaderText="Product Name" />
                <asp:BoundField Datafield="Color" HeaderText="Color" />
                <asp:BoundField Datafield="CatagoryName" HeaderText="Catagory" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("ProductId") %>' OnClick="lnk_onClick">Select</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
        </asp:GridView>
            <br />
        </div>
</div>
</asp:Content>
