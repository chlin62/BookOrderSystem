<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="book_update_manage.aspx.cs" Inherits="FinalProject.book_update_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat=server action="~/book_update_manage.aspx" target="_self">
<div align = "center">
<h1>編輯書籍</h1>
<asp:Panel ID="Panel2" runat="server">
            <asp:DetailsView ID="DetailsView2"   runat="server" 
    Height="50px" Width="80%" AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="B_ID" DataSourceID="SqlDataSource4" ForeColor="#333333" 
                GridLines="None" DefaultMode="Edit" 
                onpageindexchanging="DetailsView2_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="B_NAME" HeaderText="書籍名稱" 
                        SortExpression="B_NAME" />
                    <asp:BoundField DataField="B_AUTHOR" HeaderText="書籍作者" 
                        SortExpression="B_AUTHOR" />
                    <asp:BoundField DataField="B_ISBN" HeaderText="ISBN" 
                        SortExpression="B_ISBN" />
                    <asp:BoundField DataField="B_PRICE" HeaderText="書籍價格" 
                        SortExpression="B_PRICE" />
                    <asp:TemplateField HeaderText="課程名稱" SortExpression="CLS_NUM">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSourceSelClass" DataTextField="CLS_NAME" 
                                DataValueField="CLS_NUM" SelectedValue='<%# Bind("CLS_NUM", "{0}") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CLS_NUM") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CLS_NUM") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="B_CONTENT" HeaderText="書本內容" 
                        SortExpression="B_CONTENT" />
                    <asp:BoundField DataField="B_IMG" HeaderText="相片編號" SortExpression="B_IMG" />
                    <asp:CheckBoxField DataField="B_STATE" HeaderText="書籍狀態" 
                        SortExpression="B_STATE" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [BOOK] WHERE [B_ID] = @B_ID" 
                InsertCommand="INSERT INTO [BOOK] ([B_NAME], [B_AUTHOR], [B_ISBN], [B_PRICE], [CLS_NUM], [B_CONTENT], [B_IMG], [B_STATE]) VALUES (@B_NAME, @B_AUTHOR, @B_ISBN, @B_PRICE, @CLS_NUM, @B_CONTENT, @B_IMG, @B_STATE)" 
                SelectCommand="SELECT [B_ID], [B_NAME], [B_AUTHOR], [B_ISBN], [B_PRICE], [CLS_NUM], [B_CONTENT], [B_IMG], [B_STATE] FROM [BOOK] WHERE ([B_ID] = @B_ID)" 
                
                
                UpdateCommand="UPDATE [BOOK] SET [B_NAME] = @B_NAME, [B_AUTHOR] = @B_AUTHOR, [B_ISBN] = @B_ISBN, [B_PRICE] = @B_PRICE, [CLS_NUM] = @CLS_NUM, [B_CONTENT] = @B_CONTENT, [B_IMG] = @B_IMG, [B_STATE] = @B_STATE WHERE [B_ID] = @B_ID">
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
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="B_ID" QueryStringField="book" 
                        Type="Int32" />
                </SelectParameters>
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
               
        </asp:Panel>
        </div>
         </form>
         
</asp:Content>
