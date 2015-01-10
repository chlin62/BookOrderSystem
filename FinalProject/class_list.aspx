<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="class_list.aspx.cs" Inherits="FinalProject.class_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.alert{padding:15px;margin-bottom:20px;border:1px solid transparent;border-radius:4px}.alert h4{margin-top:0;color:inherit}.alert .alert-link{font-weight:700}.alert>p,.alert>ul{margin-bottom:0}.alert>p+p{margin-top:5px}.alert-dismissable,.alert-dismissible{padding-right:35px}.alert-dismissable .close,.alert-dismissible .close{position:relative;top:-2px;right:-21px;color:inherit}.alert-success{color:#3c763d;background-color:#dff0d8;border-color:#d6e9c6}.alert-success hr{border-top-color:#c9e2b3}.alert-success .alert-link{color:#2b542c}.alert-info{color:#31708f;background-color:#d9edf7;border-color:#bce8f1}.alert-info hr{border-top-color:#a6e1ec}.alert-info .alert-link{color:#245269}.alert-warning{color:#8a6d3b;background-color:#fcf8e3;border-color:#faebcc}.alert-warning hr{border-top-color:#f7e1b5}.alert-warning .alert-link{color:#66512c}.alert-danger{color:#a94442;background-color:#f2dede;border-color:#ebccd1}.alert-danger hr{border-top-color:#e4b9c0}.alert-danger .alert-link{color:#843534}
</style>
    <asp:Literal ID="LiteralScript" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server"> 
     <asp:Panel ID="Panel1" runat="server">
         <div align ="center">
         <h1>課程清單</h1>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                 SelectCommand="SELECT [CLS_NUM], [CLS_NAME], [CLS_TEACHER] FROM [CLASS]">
             </asp:SqlDataSource>
             <br />
             <table class="ui-responsive table-stroke" width="80%">
                 
                     
                        <thead>
                             <tr>
                                 <th class="style1">
                                     課程名稱 
                                 </th>
                                 <th>
                                     授課老師 
                                 </th>
                             </tr>
                         </thead>
                    

                     <tbody>
                         <asp:Literal ID="LiteralClassList" runat="server"></asp:Literal>
                     </tbody>
                 
             </table>
         </div>
     </asp:Panel >
    <asp:Panel ID="Panel2"  runat="server">
        <div align="center">
        <table class="style2" class="ui-responsive table-stroke" width="80%">
            <tr>
                <td width ="30%">
                    <asp:Image ID="Image1" Width="277px" Height="375 px" runat="server"  />
                </td>
                <td width="70%">
                   <h2>課程名稱:<asp:Literal ID="LiteralClassName" runat="server"></asp:Literal>
                    </h2>
                   <h2>授課老師:<asp:Literal ID="LiteralClassTeacher" runat="server"></asp:Literal>
                    </h2>
                    <asp:Panel ID="PanelButton" runat="server">
                    
                        <asp:Button ID="ButtonBuy" class="ui-btn ui-btn-inline" runat="server" onclick="Button1_Click" Text="我要訂購" />

                    </asp:Panel>
                    <asp:Panel ID="PanelBuyed" runat="server" Visible="false">
                        <div class="alert alert-success" role="alert">您已成功購買! 如須放棄可至我的訂單取消</div>
                    </asp:Panel>
                    <asp:Panel ID="PanelTimeOut" runat="server" Visible="false">
                        <div class="alert alert-danger" role="alert">抱歉已結單!</div>
                    </asp:Panel>
                    <h4>
                        教科書詳細資訊:
                    </h4>
                    <p>
                        <asp:Literal ID="LiteralBookContent" runat="server"></asp:Literal>
                    </p>
                   </td>
            </tr>
          
        </table>
    </div>    
    </asp:Panel>
    
    </form>
</asp:Content>
