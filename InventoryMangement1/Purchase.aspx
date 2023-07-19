<%@ Page Title="" Language="C#" MasterPageFile="~/PMangement.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="InventoryMangement1.Purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
    .auto-style41 {
        text-align: center;
                margin-left: 0px;
            }
    .auto-style43 {
            text-align: right;
            width: 608px;
        }
    .auto-style44 {
        text-align: left;
    }
        .auto-style46 {
        text-align: right;
        width: 571px;
    }
    .auto-style50 {
        text-align: center;
        width: 73px;
    }
    .auto-style51 {
        text-align: center;
    }
    .auto-style52 {
        color: #003399;
    }
    .auto-style53 {
        margin-left: 0px;
    }

    .tablenew{
        margin:auto;
        background:aqua;
        display:inline-block;
        padding:20px;
        text-align:center;
        display:block;
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

        .TextBox{
            padding:5px;
            margin:2px;
            display:block;
         }
            .auto-style58 {
                height: 360px;
                width: 708px;
            }
            .auto-style59 {
                text-align: center;
                width: 34px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="auto-style41">
    <h3 class="auto-style52">Purchase</h3>
         <p class="auto-style52">&nbsp;</p>
        <asp:HiddenField ID="hfPurchaseId" runat="server" />
    <table class="auto-style58">
        <tr>
            <td class="auto-style43" colspan="2">Product Name:</td>
            <td class="auto-style44" colspan="2">
                <asp:DropDownList ID="DropDownProduct" CssClass="TextBox" runat="server" Height="45px" Width="128px" AppendDataBoundItems="True" >
                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style43" colspan="2">Supplier Name :</td>
            <td class="auto-style44" colspan="2">
                <asp:DropDownList ID="DropDownSupplier"  CssClass="TextBox" runat="server" Height="46px" Width="128px" AppendDataBoundItems="True">
                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style43" colspan="2">Quantity:</td>
            <td class="auto-style44" colspan="2">
                <asp:TextBox ID="txtQuantity" runat="server"  CssClass="TextBox" Width="131px" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
            </td>
        </tr>
      
        <tr>
            <td class="auto-style46">
                <asp:Button ID="btnsave" runat="server" CssClass="btnsty1" Text="Save" Font-Bold="True" OnClick="btnsave_Click" Width="69px" />
            </td>
            <td class="auto-style59">
                <asp:Button ID="btndelete" runat="server"  Text="Delete" Width="74px" Font-Bold="True" OnClick="btndelete_Click" CssClass="auto-style53 btnsty1" />
            </td>
            <td class="auto-style50">
                <asp:Button ID="btnclear" runat="server" CssClass="btnsty1" Text="Clear" Font-Bold="True" OnClick="btnclear_Click" Width="77px" />
            </td>
            <td class="auto-style44">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblsuccessmassage" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
        <h4>
            <br />
            <span class="auto-style52">Purchase List</span><br />
        <br />
        </h4>
        <div class="auto-style51">
        <asp:GridView ID="purchaseGrid" runat="server" AutoGenerateColumns="false" HorizontalAlign="Center" Width="502px"  >
            <columns>
                <asp:BoundField Datafield="PurchaseId" HeaderText="Purchase Id" />
                <asp:BoundField Datafield="ProductName" HeaderText="Product Name" />
                <asp:BoundField Datafield="CompanyName" HeaderText="Supplier Name" />
                <asp:BoundField Datafield="Quantity" HeaderText="Quantity" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("PurchaseId") %>' OnClick="lnk_onClick">Select</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </columns>
        </asp:GridView>
            <br />
        </div>
</div>
</asp:Content>
