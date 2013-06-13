<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="WebApplication4.Resultados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">



        <table style="width:100%;background-image:url(images/header_strip.png);">
            <tr>
                <td style="text-align:center;">
                    <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="images/logo.png" /></td>
            </tr>
        </table>

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:BoundField HeaderText="Incident ID" DataField="issue_id" />
                        <asp:BoundField DataField="issue_date" HeaderText="Date Submited" />
                        <asp:BoundField DataField="last_update" HeaderText="Last Update" />
                        <asp:BoundField HeaderText="Category" DataField="category_ud" />
                        <asp:BoundField HeaderText="Sub Category" DataField="sub_category_ud" />
                        <asp:BoundField HeaderText="Description" DataField="issue_desc" />
                        <asp:BoundField HeaderText="Status" DataField="issue_status_desc" />
                    </Columns>

                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />

                </asp:GridView>
       <div id='myMap' style="position: relative; width: 600px; height: 400px;"></div>

                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <div>
    
    </div>
    </form>
</body>
</html>
