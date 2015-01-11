<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="FinalProject.login" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

   
    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
 
    <div class="container" >

       <div align=center> <img src="images/logo.png" /></div>
       <form id="Form1" class="form-signin" runat=server>
        <h2 class="form-signin-heading">Please sign in</h2>
    
       
      帳號:<asp:TextBox ID="TextBoxAct" class="form-control" runat="server"></asp:TextBox>
      密碼:<asp:TextBox ID="TextBoxPwd" class="form-control" runat="server" TextMode="Password"></asp:TextBox>  
        
      <asp:Button ID="Button1" class="btn btn-lg btn-primary btn-block" runat="server" 
            Text="登入" onclick="Button1_Click" />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <div class="alert alert-danger"  role="alert">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAct" runat="server" 
                    ErrorMessage="帳號忘記填了" ControlToValidate="TextBoxAct" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPwd" runat="server" 
                    ErrorMessage="密碼忘記填了" ControlToValidate="TextBoxPwd" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Literal ID="LiteralError" runat="server"></asp:Literal>
            </div>
        </asp:Panel>
      <br/>
      </form>
        
      

    </div> <!-- /container -->
    

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
