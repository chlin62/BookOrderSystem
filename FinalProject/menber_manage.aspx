<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="menber_manage.aspx.cs" Inherits="FinalProject.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div align="center">
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [STUDENT] WHERE [STU_NUM] = @original_STU_NUM AND (([STU_ACT] = @original_STU_ACT) OR ([STU_ACT] IS NULL AND @original_STU_ACT IS NULL)) AND (([STU_PWD] = @original_STU_PWD) OR ([STU_PWD] IS NULL AND @original_STU_PWD IS NULL)) AND (([STU_NAME] = @original_STU_NAME) OR ([STU_NAME] IS NULL AND @original_STU_NAME IS NULL)) AND (([STR_LEVEL] = @original_STR_LEVEL) OR ([STR_LEVEL] IS NULL AND @original_STR_LEVEL IS NULL))" 
        InsertCommand="INSERT INTO [STUDENT] ([STU_NUM], [STU_ACT], [STU_PWD], [STU_NAME], [STR_LEVEL]) VALUES (@STU_NUM, @STU_ACT, @STU_PWD, @STU_NAME, @STR_LEVEL)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [STUDENT]" 
        UpdateCommand="UPDATE [STUDENT] SET [STU_ACT] = @STU_ACT, [STU_PWD] = @STU_PWD, [STU_NAME] = @STU_NAME, [STR_LEVEL] = @STR_LEVEL WHERE [STU_NUM] = @original_STU_NUM AND (([STU_ACT] = @original_STU_ACT) OR ([STU_ACT] IS NULL AND @original_STU_ACT IS NULL)) AND (([STU_PWD] = @original_STU_PWD) OR ([STU_PWD] IS NULL AND @original_STU_PWD IS NULL)) AND (([STU_NAME] = @original_STU_NAME) OR ([STU_NAME] IS NULL AND @original_STU_NAME IS NULL)) AND (([STR_LEVEL] = @original_STR_LEVEL) OR ([STR_LEVEL] IS NULL AND @original_STR_LEVEL IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_STU_NUM" Type="Int32" />
            <asp:Parameter Name="original_STU_ACT" Type="String" />
            <asp:Parameter Name="original_STU_PWD" Type="String" />
            <asp:Parameter Name="original_STU_NAME" Type="String" />
            <asp:Parameter Name="original_STR_LEVEL" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STU_NUM" Type="Int32" />
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
            <asp:Parameter Name="STU_NAME" Type="String" />
            <asp:Parameter Name="STR_LEVEL" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
            <asp:Parameter Name="STU_NAME" Type="String" />
            <asp:Parameter Name="STR_LEVEL" Type="Boolean" />
            <asp:Parameter Name="original_STU_NUM" Type="Int32" />
            <asp:Parameter Name="original_STU_ACT" Type="String" />
            <asp:Parameter Name="original_STU_PWD" Type="String" />
            <asp:Parameter Name="original_STU_NAME" Type="String" />
            <asp:Parameter Name="original_STR_LEVEL" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="STU_NUM" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="STU_NUM" HeaderText="STU_NUM" ReadOnly="True" 
                SortExpression="STU_NUM" />
            <asp:BoundField DataField="STU_ACT" HeaderText="STU_ACT" 
                SortExpression="STU_ACT" />
            <asp:BoundField DataField="STU_PWD" HeaderText="STU_PWD" 
                SortExpression="STU_PWD" />
            <asp:BoundField DataField="STU_NAME" HeaderText="STU_NAME" 
                SortExpression="STU_NAME" />
            <asp:CheckBoxField DataField="STR_LEVEL" HeaderText="STR_LEVEL" 
                SortExpression="STR_LEVEL" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
</form>
</div>
</asp:Content>
