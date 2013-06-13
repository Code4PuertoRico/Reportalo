<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TEST.aspx.cs" Inherits="Reportalo.TEW" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #header {
            background-image: url('../images/reportalo-mobile_01.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            height: 129px;
        }

        #content {
            background-image: url('../images/reportalo-mobile_02.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            height: 70px;
        }

        #footer {
            background-image: url('../images/reportalo-mobile_04.png');
            background-repeat: repeat-y;
            background-position: center;
            height: 300px;
        }

        #title {
            color: #4d4d4d;
            font-weight: bold;
            font-size: 28px;
            font-family: Calibri;
            text-transform: uppercase;
            text-indent: 32%;
            font-stretch: narrower;
        }
    </style>

</head>
<body style="background: url(../images/reportalo-mobile_04.png) repeat-y center;">

    <form id="form1" runat="server">
        
        

            <table width="100%">
                <tr>
                    <td align=center>
                        <asp:Image ID="Image1" runat="server" ImageUrl="../images/reportalo-mobile_01.png"/></td>
                </tr>
                <tr>
                    <td height="15px">
                        <div id="title">email</div>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <asp:TextBox ID="textEmail" runat="server" Width="320" Height="25" BackColor="Silver"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td height="15px">
                        <div id="title">contraseña</div>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <asp:TextBox ID="textPassword" runat="server" Width="320" Height="25" BackColor="Silver"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../images/inicio_btn.png" />
                    </td>
                </tr>
            </table>

        
    </form>
</body>
</html>
