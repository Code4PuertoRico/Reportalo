<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportaIssue.aspx.cs" Inherits="Reportalo.ReportaIssue" %>


<!DOCTYPE html>

<script type="text/javascript" src="http://ecn.dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=7.0"></script>
<script src="js/geo.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">
    

    var x = document.getElementById("Label1");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        }
        else { x.innerHTML = "Geolocation is not supported by this browser."; }
    }

    function showPosition(position) {
        document.getElementById("hdnLat").value = position.coords.latitude
        document.getElementById("hdnLong").value = position.coords.longitude

        //x.innerHTML = "Latitude: " + position.coords.latitude +
        //"<br>Longitude: " + position.coords.longitude;
    }


    function displayInfobox(e) {
        if (e.targetType == 'pushpin') {
            infobox.setLocation(e.target.getLocation());
            infobox.setOptions({ visible: true, title: e.target.Title, description: e.target.Description });
        }
    }


</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width"/>
    <title></title>
</head>
<body onload="getLocation();" ">
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnLat" runat="server" />
        <asp:HiddenField ID="hdnLong" runat="server" />

        <table style="width:100% ;background: url(../images/belly.png);background-repeat:repeat-y;ba" >
            <tr>
                <td>

                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Mi Posicion:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkLocation" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1"><asp:Label ID="lblSituacion" runat="server" Text="Situacion:"></asp:Label></td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ddlCategoria" ErrorMessage="Requerido" MaximumValue="99999" MinimumValue="1"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblDetalle" runat="server" Text="Detalle:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubCategoria" runat="server"></asp:DropDownList>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="ddlSubCategoria" ErrorMessage="Requerido" MaximumValue="99999" MinimumValue="1"></asp:RangeValidator>
                </td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Información:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtInfo" runat="server" TextMode="MultiLine" BorderStyle="Dotted" Height="73px" Width="315px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInfo" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Anonimo:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="chkAnonimo" runat="server" />
                    </td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="431px" />
                    </td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnReportalo" runat="server" OnClick="Button1_Click" Text="Reportalo" />
                    </td>

            </tr>
            <tr style="height:100px width:100% ;background: url(../images/butt.png);background-repeat:repeat-y" >
                <td></td>
                <td></td>
            </tr>
        </table>
    </form>
</body>

</html>
