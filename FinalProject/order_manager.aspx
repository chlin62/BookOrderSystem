<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="order_manager.aspx.cs" Inherits="FinalProject.order_manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<div align="center">

<asp:Panel ID="PanelBookList" runat=server>
<h1>
    <asp:SqlDataSource ID="SqlDataSourceBookList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT BOOK.B_ID, BOOK.B_NAME, CLASS.CLS_NAME FROM BOOK INNER JOIN CLASS ON BOOK.CLS_NUM = CLASS.CLS_NUM">
    </asp:SqlDataSource>
    訂單管理</h1>
    <asp:Table ID="TableBookList"  class="ui-responsive table-stroke" runat="server" Width="80%">
        <asp:TableHeaderRow HorizontalAlign=Left>
            <asp:TableHeaderCell>課本名稱</asp:TableHeaderCell>
            <asp:TableHeaderCell>使用課程</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
</asp:Panel>
<asp:Panel ID="PanelOrderList" runat=server>
<h1><asp:Literal ID="LiteralClassName" runat="server"></asp:Literal></h1>
    <asp:Table ID="TableOrderList" style="align : left" class="ui-responsive table-stroke" runat="server" Width="80%">
        
        <asp:TableHeaderRow HorizontalAlign=Left>
            
            <asp:TableHeaderCell>金額</asp:TableHeaderCell>
             <asp:TableHeaderCell>購買人</asp:TableHeaderCell>
              <asp:TableHeaderCell>狀態</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <h2><asp:Label ID="LabelSumPrice" runat="server" Text="Label"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT BOOK.B_NAME, BOOK.B_PRICE, STUDENT.STU_NUM ,STUDENT.STU_NAME FROM LINE INNER JOIN STUDENT ON LINE.STU_NUM = STUDENT.STU_NUM INNER JOIN BOOK ON LINE.B_ID = BOOK.B_ID WHERE (LINE.B_ID = @B_ID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="-1" Name="B_ID" 
                    QueryStringField="B_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </h2>
</asp:Panel>

</div>
    </form>
</asp:Content>
