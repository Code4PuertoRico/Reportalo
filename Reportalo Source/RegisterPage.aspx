<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="Reportalo.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <meta name="viewport" content="width=device-width" />

</head>
<body style="background: url(../images/cuenta.png) no-repeat 49% 0;" >
    <form id="form1" runat="server">
    <div >
    
        <table width="100%">

            <tr>
                <td height ="305px">

                </td>
            </tr>

            <tr>
                <td align ="center">
                    <asp:TextBox ID="textNombre" runat="server" Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td height ="48px">

                </td>
            </tr>

            <tr>
                <td align ="center">
                    <asp:TextBox ID="textApellido" runat="server" Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td height ="48px">

                </td>
            </tr>

            <tr>
                <td align ="center">
                    <asp:TextBox ID="textEmail" runat="server" Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td height ="45px">

                </td>
            </tr>

            <tr>
                <td align ="center">
                    <asp:TextBox ID="textPassword" runat="server" Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td height ="45px">

                </td>
            </tr>

            <tr>

                <td align ="center">
                    <asp:ImageButton ID="buttonReg" runat="server" OnClick="Button1_Click" ImageUrl="images\crear cuenta btn.png" />
                </td>
               

            </tr>

        </table>




    </div>
    </form>
</body>
</html>
