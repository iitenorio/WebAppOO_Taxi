<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <title>Pagina Inicial</title>
        <meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            /*body{
    background:url(Imagens/imgpsh_fullsize.jpg) no-repeat; 
    background-size:100% 100%;
    bottom:0px;
    top:0px;
    margin: 0px;
    position:absolute;
    width: 100%;
}*/
    .main-section{
        background:url(Imagens/imgpsh_fullsize.jpg) no-repeat;
        background-size:100% 100%;
        bottom:0px;
        top:0px;
        margin: 0px;
        position:absolute;
        width: 100%;
    }
    .user-login-header,.login-image-main{
        margin-top: 15px;
    }
    .user-login-header h1{
        font-size: 45px;
        color:#fff;
    }
    .user-login-header p,.last-part p{
        color:#c9c5c7;
    }
    .user-login-header span{
        color:#fff;
        font-weight: 600;
    }
    .login-image-main{
        padding: 30px;
        background-color:#fff;
        border-radius:5px;
        box-shadow: 0 0 5px 0 #fff;
    }
    .user-image-section img{
        background-color: #B56162;
        padding:30px;
        height:150px;
        width:150px;
        border-radius: 50%;
    }
    .user-login-box,.last-part{
        padding:20px;
    }
    .user-login-box a,.user-login-box a:hover{
        background-color: #B56162;
        border:1px solid #B56162;
        width: 100%;
        color:#fff;
        font-weight:600;
    }
    .last-part input{
        text-decoration: none;
        color:#B56162;
}
        </style>
       </head>
    <body>
        <%if(session.getAttribute("user") == null){%>
<div class="container main-section">
	<div class="row">
		<div class="col-md-12 text-center user-login-header">
			<h1>TAON - Autenticação</h1>
			<p>Taxista Online<span> - Sistema para gerenciamento de corridas</span></p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 col-sm-8 col-xs-12 col-md-offset-4 col-sm-offset-2 login-image-main text-center">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12 user-image-section">
                                    <img src="Imagens/businessman.png">
				</div>
				<div class="col-md-12 col-sm-12 col-xs-12 user-login-box">
                                    <form mothod="post" action="home.jsp">
					<div class="form-group">
				  		<input type="text" class="form-control" placeholder="usuario" name="login">
					</div>
					<div class="form-group">
				  		<input type="password" class="form-control" placeholder="senha" name="pass">
					</div>
					<input type="submit" name="formLogin" class="btn btn-defualt" value="Cadastrar"/>
                                    </form>
				</div>
			</div>
		</div>
	</div>
</div>
        <%} else {%>
            <script language="JavaScript"> 
                window.location="home.jsp"; 
            </script>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %> 
    </body>
</html>