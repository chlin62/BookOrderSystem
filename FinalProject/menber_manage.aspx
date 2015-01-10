<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="menber_manage.aspx.cs" EnableEventValidation="false" Inherits="FinalProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <h1>成員管理表單</h1>
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [STUDENT]" 
        DeleteCommand="DELETE FROM [STUDENT] WHERE [STU_NUM] = @original_STU_NUM" 
        InsertCommand="INSERT INTO [STUDENT] ([STU_ACT], [STU_PWD], [STU_NAME], [STU_LEVEL]) VALUES (@STU_ACT, @STU_PWD, @STU_NAME, @STU_LEVEL)" 
        
        UpdateCommand="UPDATE [STUDENT] SET [STU_ACT] = @STU_ACT, [STU_PWD] = @STU_PWD, [STU_NAME] = @STU_NAME, [STU_LEVEL] = @STU_LEVEL WHERE [STU_NUM] = @original_STU_NUM">
        <DeleteParameters>
            <asp:Parameter Name="original_STU_NUM" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
            <asp:Parameter Name="STU_NAME" Type="String" />
            <asp:Parameter Name="STU_LEVEL" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
            <asp:Parameter Name="STU_NAME" Type="String" />
            <asp:Parameter Name="STU_LEVEL" Type="Boolean" />
            <asp:Parameter Name="original_STU_NUM" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div data-role="navbar">
			<ul>
                <li><asp:Button ID="Button2" class="ui-btn-active " runat="server" onclick="Button2_Click" Text="清單" /></li>
                 <li><asp:Button ID="Button1" class="ui-btn-active" runat="server" onclick="Button1_Click" Text="新增" /></li>
            </ul>
    </div>
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1"  runat="server">
            <asp:GridView  ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" CellPadding="4" DataKeyNames="STU_NUM" 
                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
                Width="80%">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="STU_NAME" HeaderText="學生姓名" 
                        SortExpression="STU_NAME" />
                    <asp:BoundField DataField="STU_ACT" HeaderText="學生帳號" 
                        SortExpression="STU_ACT" />
                    <asp:BoundField DataField="STU_PWD" HeaderText="學生密碼" 
                        SortExpression="STU_PWD" />
                    <asp:CheckBoxField DataField="STU_LEVEL" HeaderText="管理權限" 
                        SortExpression="STU_LEVEL" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </asp:View>
        
        <asp:View ID="View2" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="80%" 
                DataSourceID="SqlDataSource1" style="margin-right: 186px" 
                AutoGenerateRows="False" CellPadding="4" DataKeyNames="STU_NUM" 
                ForeColor="#333333" GridLines="None" 
                onpageindexchanging="DetailsView1_PageIndexChanging1">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="STU_NAME" HeaderText="學生姓名" 
                        SortExpression="STU_NAME" />
                    <asp:BoundField DataField="STU_ACT" HeaderText="學生帳號" 
                        SortExpression="STU_ACT" />
                    <asp:BoundField DataField="STU_PWD" HeaderText="學生密碼" 
                        SortExpression="STU_PWD" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
           
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [STUDENT] WHERE [STU_NUM] = @original_STU_NUM AND (([STU_ACT] = @original_STU_ACT) OR ([STU_ACT] IS NULL AND @original_STU_ACT IS NULL)) AND (([STU_PWD] = @original_STU_PWD) OR ([STU_PWD] IS NULL AND @original_STU_PWD IS NULL)) AND (([STU_NAME] = @original_STU_NAME) OR ([STU_NAME] IS NULL AND @original_STU_NAME IS NULL)) AND (([STU_LEVEL] = @original_STU_LEVEL) OR ([STU_LEVEL] IS NULL AND @original_STU_LEVEL IS NULL))" 
                InsertCommand="INSERT INTO [STUDENT] ([STU_ACT], [STU_PWD], [STU_NAME], [STU_LEVEL]) VALUES (@STU_ACT, @STU_PWD, @STU_NAME, @STU_LEVEL)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [STU_NUM], [STU_ACT], [STU_PWD], [STU_NAME], [STU_LEVEL] FROM [STUDENT]" 
                UpdateCommand="UPDATE [STUDENT] SET [STU_ACT] = @STU_ACT, [STU_PWD] = @STU_PWD, [STU_NAME] = @STU_NAME, [STU_LEVEL] = @STU_LEVEL WHERE [STU_NUM] = @original_STU_NUM AND (([STU_ACT] = @original_STU_ACT) OR ([STU_ACT] IS NULL AND @original_STU_ACT IS NULL)) AND (([STU_PWD] = @original_STU_PWD) OR ([STU_PWD] IS NULL AND @original_STU_PWD IS NULL)) AND (([STU_NAME] = @original_STU_NAME) OR ([STU_NAME] IS NULL AND @original_STU_NAME IS NULL)) AND (([STU_LEVEL] = @original_STU_LEVEL) OR ([STU_LEVEL] IS NULL AND @original_STU_LEVEL IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_STU_NUM" Type="Int32" />
                    <asp:Parameter Name="original_STU_ACT" Type="String" />
                    <asp:Parameter Name="original_STU_PWD" Type="String" />
                    <asp:Parameter Name="original_STU_NAME" Type="String" />
                    <asp:Parameter Name="original_STU_LEVEL" Type="Boolean" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STU_ACT" Type="String" />
                    <asp:Parameter Name="STU_PWD" Type="String" />
                    <asp:Parameter Name="STU_NAME" Type="String" />
                    <asp:Parameter Name="STU_LEVEL" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="STU_ACT" Type="String" />
                    <asp:Parameter Name="STU_PWD" Type="String" />
                    <asp:Parameter Name="STU_NAME" Type="String" />
                    <asp:Parameter Name="STU_LEVEL" Type="Boolean" />
                    <asp:Parameter Name="original_STU_NUM" Type="Int32" />
                    <asp:Parameter Name="original_STU_ACT" Type="String" />
                    <asp:Parameter Name="original_STU_PWD" Type="String" />
                    <asp:Parameter Name="original_STU_NAME" Type="String" />
                    <asp:Parameter Name="original_STU_LEVEL" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
           
        </asp:View>
    </asp:MultiView>
</form>
</div>
</asp:Content>
