<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ErrorInicioM.aspx.cs" Inherits="Reportalo.ErrorInicioM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <asp:Image ID="Image1" runat="server" ImageUrl="../images/iniciar sec.png" Width="100%" />
    </div>
    <table style="width: 100%; padding-top: 4%">

        <tr>
            <td class=" columnsTitle">
                <div class="title">nombre de usuario o contraseña invalida, favor de corregir sus credenciales.</div>
            </td>
        </tr>

        <tr>
            <td></td>
        </tr>

        <tr>
            <td></td>
        </tr>


        <tr>
            <td class=" columnsObject">
                <asp:ImageButton CssClass="buttonLogin" ID="ImageButton1" runat="server" ImageUrl="../images/inicio_btn.png" OnClick="ImageButton1_Click"/>
            </td>
        </tr>




    </table>

</asp:Content>
