<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="myOrder_list.aspx.cs" Inherits="FinalProject.myOrder_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM LINE WHERE (STU_NUM = @STU_NUM)" 
        SelectCommand="SELECT BOOK.B_NAME, BOOK.B_PRICE,BOOK.B_ID FROM LINE INNER JOIN BOOK ON LINE.B_ID = BOOK.B_ID WHERE (LINE.STU_NUM = @STU_NUM)">
        <DeleteParameters>
            <asp:Parameter Name="STU_NUM" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="STU_NUM" SessionField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div align ="center">
    <h1>我的訂單</h1>
    <asp:Table ID="Table1" class="ui-responsive table-stroke" runat="server" Width="80%" >
    <asp:TableHeaderRow >
        <asp:TableHeaderCell>書籍名稱</asp:TableHeaderCell>
        <asp:TableHeaderCell >書籍價格</asp:TableHeaderCell>
         <asp:TableHeaderCell >狀態</asp:TableHeaderCell>
    </asp:TableHeaderRow>
    </asp:Table>
        <br />
        <asp:Label ID="LabelPrice" runat="server"></asp:Label>
    </div>

    <br />
    </form>

</asp:Content>
