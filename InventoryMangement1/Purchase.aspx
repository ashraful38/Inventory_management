<%@ Page Title="" Language="C#" MasterPageFile="~/PMangement.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="InventoryMangement1.Purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
    .auto-style43 {
            text-align: right;
            width: 608px;
        }
    .auto-style44 {
        text-align: left;
    }
        .auto-style50 {
        text-align: center;
        width: 73px;
                height: 63px;
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

        .flex{
            display:flex;
            justify-content:space-between;
            align-items:center;
            
        }
            .auto-style58 {
                height: 360px;
                width: 862px;
            }
            .auto-style60 {
                text-align: left;
                width: 230px;
            }
            .auto-style61 {
                background: blue;
                color: white;
                margin: 10px 10px 10px 128px;
                padding: 10px;
                display: inline-block;
            }
            .auto-style62 {
                text-align: left;
                width: 593px;
            }
            .auto-style63 {
                width: 230px;
            }
            .auto-style64 {
                margin-right: 0px;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="flex">
         <div style="margin-left:250px" >
            <h3 style="text-align:center" class="auto-style52">Purchase</h3>
                 <p class="auto-style52">&nbsp;</p>
                <asp:HiddenField ID="hfPurchaseId" runat="server" />
            <table class="auto-style58">
                <tr>
                    <td class="auto-style43" colspan="2">Product Name:</td>
                    <td class="auto-style60">
                        <asp:DropDownList ID="DropDownProduct" CssClass="TextBox" runat="server" Height="45px" Width="128px" AppendDataBoundItems="True" >
                    
                        </asp:DropDownList>
                    </td>
                 
                </tr>
                <tr>
                    <td class="auto-style43" colspan="2">Supplier Name :</td>
                    <td class="auto-style44" colspan="3">
                        <asp:DropDownList ID="DropDownSupplier"  CssClass="TextBox" runat="server" Height="46px" Width="128px" AppendDataBoundItems="True">
                    
                        </asp:DropDownList>
                    </td>
                       <td class="auto-style62">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td style="margin-left:10px" class="auto-style44">
                        <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" Width="450px" CssClass="auto-style64">
                            <%--<columns >
                                <asp:BoundField Datafield="PurchaseId" HeaderText="Purchase Id" />
                                <asp:BoundField Datafield="ProductName" HeaderText="Product Name" />
                                <asp:BoundField Datafield="CompanyName" HeaderText="Supplier Name" />
                                <asp:BoundField Datafield="Quantity" HeaderText="Quantity" />
               
                
                            </columns>--%>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style43" colspan="2">Quantity:</td>
                    <td class="auto-style44" colspan="3">
                        <asp:TextBox ID="txtQuantity" runat="server"  CssClass="TextBox" Width="131px" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" CssClass="btnsty1" Text="Save All" Font-Bold="True" OnClick="btnAllsave_Click"  Width="93px" />

                    </td>
                </tr>

                <tr>
                     <td class="auto-style50" colspan="3">
                        &nbsp;<asp:Button ID="btnadd" runat="server" CssClass="auto-style61 btnsty1" Text="Add" Font-Bold="True" Width="118px"  OnClick="btnAdd_Click" />
                     </td>
                </tr>

       
                <tr>
                    <td  style="margin-left:50px" >
                        <asp:Button ID="btnsave" runat="server" CssClass="btnsty1" Text="Save" Font-Bold="True" OnClick="btnsave_Click"  Width="70px" />
                    </td>
                    <td>
                        <asp:Button ID="btndelete" runat="server"  Text="Delete" Width="70px" Font-Bold="True" OnClick="btndelete_Click" CssClass=" btnsty1" />
                    </td>
                    <td class="auto-style63">
                        <asp:Button ID="btnclear" runat="server"  Width="79px" Text="Clear" Font-Bold="True" CssClass=" btnsty1"  OnClick="btnclear_Click"   />
                    &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:Label ID="lblsuccessmassage" runat="server" Text="" ForeColor="Green"></asp:Label>
                        <asp:Label ID="lblerrormessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
             <br />
          </div>


   </div>
    

 <div>
        <h4 style="text-align:center">
            <br />
            <span">Purchase List</span><br />
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
