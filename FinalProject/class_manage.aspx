<%@ Page Title="" Language="C#"  EnableEventValidation="false" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="class_manage.aspx.cs" Inherits="FinalProject.class_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language=javascript>    $('#popupLogin').dialog('open');</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div align = "center">
<h1>課程管理表單</h1>
<form runat=server>
    <asp:SqlDataSource  ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [CLASS] WHERE [CLS_NUM] = @original_CLS_NUM" 
        InsertCommand="INSERT INTO [CLASS] ([CLS_NAME], [CLS_TEACHER]) VALUES (@CLS_NAME, @CLS_TEACHER)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [CLS_NUM], [CLS_NAME], [CLS_TEACHER] FROM [CLASS]" 
        
        UpdateCommand="UPDATE [CLASS] SET [CLS_NAME] = @CLS_NAME, [CLS_TEACHER] = @CLS_TEACHER WHERE [CLS_NUM] = @original_CLS_NUM">
        <DeleteParameters>
            <asp:Parameter Name="original_CLS_NUM" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CLS_NAME" Type="String" />
            <asp:Parameter Name="CLS_TEACHER" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CLS_NAME" Type="String" />
            <asp:Parameter Name="CLS_TEACHER" Type="String" />
            <asp:Parameter Name="original_CLS_NUM" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView width="80%" ID="GridView1"  AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CLS_NUM" 
        DataSourceID="SqlDataSource1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CLS_NAME" HeaderText="課程名稱" 
                SortExpression="CLS_NAME" />
            <asp:BoundField DataField="CLS_TEACHER" HeaderText="授課老師" 
                SortExpression="CLS_TEACHER" />
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
   <div data-role="collapsible" style=" Width: 80% ;" data-theme="b" data-content-theme="b">
    
        
            <h3>新增課程</h3>
             <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="80%" 
                AutoGenerateRows="False" DataSourceID="SqlDataSource1" 
           DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="CLS_NAME" HeaderText="課程名稱" 
                        SortExpression="CLS_NAME" />
                    <asp:BoundField DataField="CLS_TEACHER" HeaderText="授課老師" 
                        SortExpression="CLS_TEACHER" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        
    </div>
    </form>
    
    </div>
   
    </asp:Content>
