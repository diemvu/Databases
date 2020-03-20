<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="phaseIII.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #000099;
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            Streaming Services Handling<br />
            <br />
            <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px" style="font-size: medium" Orientation="Horizontal" RenderingMode="Table" Width="100%">
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#E3EAEB" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/WebForm1.aspx" Text="Search by Services" Value="Search by Services"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/WebForm2.aspx" Text="Search by Movies" Value="Search by Movies"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/WebForm3.aspx" Text="Search by TV Series" Value="Search by TV Series"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#1C5E55" />
            </asp:Menu>
            <h5 class="auto-style2">Please choose a movie to see castcrew members<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="MovieName" DataValueField="MovieID">
                </asp:DropDownList>
            </h5>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="castcrewID" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                <asp:BoundField DataField="rolename" HeaderText="rolename" SortExpression="rolename" />
                <asp:BoundField DataField="castcrewID" HeaderText="castcrewID" InsertVisible="False" ReadOnly="True" SortExpression="castcrewID" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Select [person].[firstName], [person].[lastName], [roles].[rolename], [castcrew].[castcrewID]
from [person] 
join [roles] 
on [person].[personID] = [roles].[personID] 
join [castcrew] 
on [castcrew].[castcrewID] = [roles].[castcrewID] 
join [movies] 
on [movies].[castcrewID] = [castcrew].[castcrewID] 
where ([castcrew].[castcrewID] = (select [movies].[castcrewID] 
                            from [movies] 
                            where ([movies].[movieID] =@movieID))) ;">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="movieID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
