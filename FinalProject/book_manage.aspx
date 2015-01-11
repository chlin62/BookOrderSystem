<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="book_manage.aspx.cs" Inherits="FinalProject.book_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
    <form runat="server">
        
        <h1>課程管理<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [B_NAME], [CLS_NUM], [B_PRICE], [B_ID] FROM [book]">
            </asp:SqlDataSource>
        </h1>
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" Width="80%" runat="server" 
    CellPadding="4" ForeColor="#333333" 
                GridLines="None" 
    AutoGenerateColumns="False" DataKeyNames="B_ID" DataSourceID="SqlDataSource3">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="B_ID,CLS_NUM" 
                        DataNavigateUrlFormatString="book_update_manage.aspx?book={0}&amp;class={1}" 
                        DataTextField="B_NAME" HeaderText="書籍名稱" Target="_self" />
                    <asp:BoundField DataField="B_PRICE" HeaderText="書籍價格" 
                        SortExpression="B_PRICE" />
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
            <div data-content-theme="b" data-role="collapsible" data-theme="b" 
                style=" Width: 80% ;">
                <h3>
                    新增課程</h3>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataKeyNames="B_ID" DataSourceID="SqlDataSource2" 
                    DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" 
                    Width="80%">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="B_NAME" HeaderText="書本名稱" SortExpression="B_NAME" />
                        <asp:BoundField DataField="B_AUTHOR" HeaderText="作者" 
                            SortExpression="B_AUTHOR" />
                        <asp:BoundField DataField="B_ISBN" HeaderText="ISBN" SortExpression="B_ISBN" />
                        <asp:BoundField DataField="B_PRICE" HeaderText="價格" SortExpression="B_PRICE" />
                        <asp:TemplateField HeaderText="課程名稱" SortExpression="CLS_NUM">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CLS_NUM") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSourceSelClass" DataTextField="CLS_NAME" 
                                    DataValueField="CLS_NUM" SelectedValue='<%# Bind("CLS_NUM") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CLS_NUM") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="B_CONTENT" HeaderText="課本簡介" 
                            SortExpression="B_CONTENT" />
                        <asp:BoundField DataField="B_IMG" HeaderText="課本相片" SortExpression="B_IMG" />
                        <asp:CheckBoxField DataField="B_STATE" HeaderText="書本狀態" 
                            SortExpression="B_STATE" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    DeleteCommand="DELETE FROM [BOOK] WHERE [B_ID] = @B_ID" 
                    InsertCommand="INSERT INTO [BOOK] ([B_NAME], [B_AUTHOR], [B_ISBN], [B_PRICE], [CLS_NUM], [B_CONTENT], [B_IMG], [B_STATE]) VALUES (@B_NAME, @B_AUTHOR, @B_ISBN, @B_PRICE, @CLS_NUM, @B_CONTENT, @B_IMG, @B_STATE)" 
                    SelectCommand="SELECT [B_ID], [B_NAME], [B_AUTHOR], [B_ISBN], [B_PRICE], [CLS_NUM], [B_CONTENT], [B_IMG], [B_STATE] FROM [BOOK]" 

                    ConflictDetection="CompareAllValues">
                    <DeleteParameters>
                        <asp:Parameter Name="B_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="B_NAME" Type="String" />
                        <asp:Parameter Name="B_AUTHOR" Type="String" />
                        <asp:Parameter Name="B_ISBN" Type="String" />
                        <asp:Parameter Name="B_PRICE" Type="Int32" />
                        <asp:Parameter Name="CLS_NUM" Type="Int32" />
                        <asp:Parameter Name="B_CONTENT" Type="String" />
                        <asp:Parameter Name="B_IMG" Type="String" />
                        <asp:Parameter Name="B_STATE" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="B_NAME" Type="String" />
                        <asp:Parameter Name="B_AUTHOR" Type="String" />
                        <asp:Parameter Name="B_ISBN" Type="String" />
                        <asp:Parameter Name="B_PRICE" Type="Int32" />
                        <asp:Parameter Name="CLS_NUM" Type="Int32" />
                        <asp:Parameter Name="B_CONTENT" Type="String" />
                        <asp:Parameter Name="B_IMG" Type="String" />
                        <asp:Parameter Name="B_STATE" Type="Boolean" />
                        <asp:Parameter Name="B_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSelClass" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [CLS_NUM], [CLS_NAME], [CLS_TEACHER] FROM [CLASS]">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="1" Name="CLS_NUM" 
                            QueryStringField="class" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </asp:Panel>
        
        <br />

    </form>
    
    </div>
</asp:Content>
