<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterM.aspx.cs" Inherits="Reportalo.RegisterM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%;"><asp:Image ID="Image1" runat="server" ImageUrl="../images/crear cuenta.png" Width="80%" ImageAlign="Middle"/> </div>
    <table style="width: 100%; padding-top:4%">

        <tr>
            <td class=" columnsTitle">
                <div class="title">nombre</div>
            </td>
        </tr>

        <tr>
            <td class=" columnsObject">
                <asp:TextBox ID="textNombre" runat="server" CssClass="loginTextbox"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class=" columnsTitle">
                <div class="title">Apellido</div>
            </td>
        </tr>

        <tr>
            <td class=" columnsObject">
                <asp:TextBox ID="textApellido" runat="server" CssClass="loginTextbox"></asp:TextBox>
            </td>

        </tr>

        <tr>
            <td class=" columnsTitle">
                <div class="title">email</div>
            </td>
        </tr>

        <tr>
            <td class=" columnsObject">
                <asp:TextBox ID="textEmail" runat="server" CssClass="loginTextbox"></asp:TextBox>
            </td>

        </tr>

        <tr>
            <td class=" columnsTitle">
                <div class="title">contraseña</div>
            </td>
        </tr>

        <tr>
            <td class=" columnsObject">
                <asp:TextBox ID="textPassword" runat="server" CssClass="loginTextbox" TextMode="Password"></asp:TextBox>
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
                <asp:ImageButton CssClass="buttonLogin" ID="buttonReg" runat="server" ImageUrl="images\crear cuenta btn.png" OnClick="buttonReg_Click" />
            </td>


        </tr>

    </table>

</asp:Content>
