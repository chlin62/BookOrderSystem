<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="myAct_manage.aspx.cs" Inherits="FinalProject.myAct_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [STUDENT] WHERE [STU_NUM] = @STU_NUM" 
        InsertCommand="INSERT INTO [STUDENT] ([STU_ACT], [STU_PWD]) VALUES (@STU_ACT, @STU_PWD)" 
        SelectCommand="SELECT * FROM [STUDENT] WHERE ([STU_NUM] = @STU_NUM)" 
        UpdateCommand="UPDATE [STUDENT] SET [STU_ACT] = @STU_ACT, [STU_PWD] = @STU_PWD WHERE [STU_NUM] = @STU_NUM">
        <DeleteParameters>
            <asp:Parameter Name="STU_NUM" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="STU_NUM" SessionField="user" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="STU_ACT" Type="String" />
            <asp:Parameter Name="STU_PWD" Type="String" />
            <asp:Parameter Name="STU_NUM" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <div align="center">
    <h1>我的帳號管理</h1>
    <div align="left" style="width:40%">
        用戶名:<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        帳號:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        輸入舊密碼:<asp:TextBox ID="TextBoxOldPwd" runat="server"></asp:TextBox>
        <br />
        輸入新密碼:<asp:TextBox ID="TextBoxNewPwd" runat="server"></asp:TextBox>
        <br />
        再輸入一次新密碼:<asp:TextBox ID="TextBoxNewPwdAgain" runat="server"></asp:TextBox>
        <br />
        <div align="center">
        <asp:Button ID="Button1" class="ui-btn" runat="server" Text="送出" 
                onclick="Button1_Click" />
         <asp:Panel ID="PanelError" runat="server">
                        <div class="alert alert-danger" role="alert">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ErrorMessage="密碼不相同喔" ControlToCompare="TextBoxNewPwd" 
                                ControlToValidate="TextBoxNewPwdAgain" Display="Dynamic"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="有東西忘記填囉" ControlToValidate="TextBoxNewPwd" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:Label ID="LabelError" runat="server" Text="更改密碼"></asp:Label>
                        </div>
          </asp:Panel>
        </div>
        <br />
    </div>
    </div>
    </form>

</asp:Content>
