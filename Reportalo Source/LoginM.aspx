<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginM.aspx.cs" Inherits="Reportalo.LoginM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%"><asp:Image ID="Image2" runat="server" ImageUrl="../images/iniciar sec.png" Width="70%" ImageAlign="Middle"/> </div>
     <table style="width:100%;padding-top:4%">
              
                <tr>
                    <td class =" columnsTitle">
                        <div class="title">email</div>
                    </td>
                </tr>

                <tr>
                    <td class =" columnsObject">
                        <asp:TextBox ID="textEmail" runat="server" CssClass="loginTextbox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class =" columnsTitle" >
                        <div class="title">contraseña</div>
                    </td>
                </tr>

                <tr>
                    <td class =" columnsObject">
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
                    <td class =" columnsObject">
                        <asp:ImageButton CssClass="buttonLogin" ID="ImageButton1" runat="server" ImageUrl="../images/inicio_btn.png" OnClick="ImageButton1_Click" />
                    </td>
                </tr>
         <tr>
                    <td class =" columnsObject">
                        <asp:ImageButton CssClass="buttonLogin" ID="ImageButton2" runat="server" ImageUrl="../images/crear cuenta btn.png" OnClick="ImageButton2_Click" />
                    </td>
                </tr>
            </table>
</asp:Content>
