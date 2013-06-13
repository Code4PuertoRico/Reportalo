<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReportaloM.aspx.cs" Inherits="Reportalo.ReportaloM" %>

<%@ MasterType virtualpath="~/Site1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="TPPRjss.js"></script>

    <script type="text/javascript">
        function DimeCoords() {
            alert(document.getElementById("MhdnLat").value + ',' + document.getElementById("MhdnLong").value);
        }

    </script>

    <asp:HiddenField ID="hdnLat" runat="server" />
    <asp:HiddenField ID="hdnLong" runat="server" />




    <asp:ScriptManager ID="scriptMain" runat="server"></asp:ScriptManager>

    <table style="width: 100%;">

        <tr>
            <td class="columnsObject">
                <img style="width:60%" id="localizacionIMG" src="images/localizacion_off.png" onclick="changeImageLocation();" />
            </td>
        </tr>
    </table>
<asp:UpdatePanel ID="udpMain" runat="server">
    <ContentTemplate>


    <table style="width: 100%;">

        <tr>
            <td class="columnsTitle">
                <div class="title">Situacion</div>

            </td>
        </tr>
        <tr>
            <td class="columnsObject">
                <asp:DropDownList CssClass="loginTextbox" ID="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="columnsTitle">
                <div class="title">Detalle</div>
            </td>
        </tr>
        <tr>
            <td class="columnsObject">
                <asp:DropDownList ID="ddlSubCategoria" runat="server" CssClass="loginTextbox"></asp:DropDownList>

            </td>

        </tr>

        <tr>
            <td class="columnsTitle">
                <div class="title">Informacion</div>
            </td>
        </tr>
        <tr>
            <td class="columnsObject">
                <asp:TextBox CssClass="loginTextbox" ID="txtInfo" runat="server"  BorderStyle="Dotted"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td class="columnsTitle">
                <div class="title">Imagen</div>
            </td>
        </tr>


        <tr>
            <td></td>


        </tr>

    </table>

    </ContentTemplate>
</asp:UpdatePanel>
        <table style="width: 100%;">
        <tr>

            <td class="columnsObject">

                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="loginTextbox" />
                
            </td>

        </tr>
        <tr>
            <td class="columnsObject">
                <img style="width:60%; padding-top:4%;" id="anonimoIMG" src="images/anonimo_off.png" onclick="changeImageAnonimo();" />
            </td>

        </tr>
        <tr>
            <td class="columnsObject">
                <asp:ImageButton CssClass="buttonLogin" ID="btnReportalo" runat="server" ImageUrl="../images/reportalo_btn.png" OnClientClick="DimeCoords();" OnClick="btnReportalo_Click" />

            </td>

        </tr>
        </table>
</asp:Content>
