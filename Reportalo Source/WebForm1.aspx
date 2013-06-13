<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ MasterType virtualpath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">

    function getData() {
        alert('si');
        var oTable = document.getElementById('GridView1');
        var rowLen = oTable.rows.lenght;

        for (i = 0; i < rowLenght; i++) {
            var oCells = oTable.rows.item(i).cells;
            var cellLen = oCells.lenght;
            for (var j = 0; j < cellLen; j++) {
                var cellVal = oCells.item(j).innerHTML;
                alert(cellVal);
            }
        }
    }


</script>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>


    <asp:UpdatePanel ID="UPDMain" runat="server">
        <ContentTemplate>


            <table>

                <tr>
                    <td>
                        <asp:Label ID="category" runat="server" Text="Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="subCategory" runat="server" Text="Sub Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSubCategoria" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="labelStart" runat="server" Text="Start Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="startDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender
                            ID="CalendarExtender3"
                            TargetControlID="startDate"
                            runat="server" />
                        <asp:RequiredFieldValidator ControlToValidate="startDate" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Start Date is needed!!"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="labelFinish" runat="server" Text="Finish Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="endDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender
                            ID="CalendarExtender2"
                            TargetControlID="endDate"
                            runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="endDate" runat="server" ErrorMessage="End Date is needed!!"></asp:RequiredFieldValidator>

                    </td>
                </tr>


                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td>
                </tr>

            </table>

        
    
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField HeaderText="Incident ID" DataField="issue_id" />
                        <asp:BoundField DataField="issue_date" HeaderText="Date Submited" />
                        <asp:BoundField DataField="last_update" HeaderText="Last Update" />
                        <asp:BoundField HeaderText="Category" DataField="category_ud" />
                        <asp:BoundField HeaderText="Sub Category" DataField="sub_category_ud" />
                        <asp:BoundField HeaderText="Description" DataField="issue_desc" />
                        <asp:BoundField HeaderText="Status" DataField="issue_status_desc" />
                    </Columns>

                </asp:GridView>
       <div id='myMap' style="position: relative; width: 600px; height: 400px;"></div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
