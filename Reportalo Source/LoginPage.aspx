<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Reportalo.ReportPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>

    <meta name="viewport" content="width=device-width" />

</head>

<body style="background: url(../images/inicio.png) no-repeat 50% 0;" >
    <form id="form1" runat="server">
        <div >

            <table width="100%" >
              
                <tr>
                <td height ="290px">

                </td>
            </tr>
                <tr>
                    <td align ="center">
                        <asp:TextBox ID="textEmail" runat="server"  Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                <td height ="45px">

                </td>
            </tr>


                <tr>
                    <td align ="center" >
                        <asp:TextBox ID="textPassword" runat="server"  Width="320" height ="25" BackColor = "Silver"></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                <td height ="20px">

                </td>
            </tr>

                <tr>
                    <td align ="center" >
                        <asp:ImageButton ID="ImageButton2" runat="server" OnClick="Button1_Click" ImageUrl="../images/inicio_btn.png" />
                    </td>

                </tr>
                <tr>
                    
                    <td align ="center">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="buttonRegister_Click" ImageUrl="images/registro_btn_back.png" />
                    </td>
                </tr>


            </table>

        </div>
    </form>
</body>
</html>
