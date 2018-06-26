<%@page import="br.com.fatecpg.parking.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
<%
    String error = null;
    
    if(request.getParameter("cadUsuario") != null) {
        String nome = request.getParameter("nome");
        String role = request.getParameter("role");
        String login = request.getParameter("login");
        long passwordhash = request.getParameter("passwordhash").hashCode();
        String email_motorista = request.getParameter("email_motorista");
        try{
            User.addUser(nome, role, login, passwordhash);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicita a Corrida</title>
    </head>
    <body>
    <%@include file="WEB-INF/jspf/header.jspf" %>
        <center>
            <div class="jumbotron">
                <div class="container">
                    <h2>Seja bem vindo ao cadastro de novos usuarios</h2>
                    <h3>Insira abaixo os seus dados</h3>
                </div>
            </div>
        </center>
        
        <div class="container">
            <%if (session.getAttribute("user") == null) {%>
                <h2>É preciso estar autenticado para acessar este recurso</h2>
            <%}else {%>
                <% User user = (User) session.getAttribute("user"); %>
                <%if (user.getRole().equals("ADMIN")){%>
                    <form>
                        <div class="form-group row">
                            <label for="nome" class="col-sm-2 col-form-label">Nome completo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Digite o seu nome completo" name="nome" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="role" class="col-sm-2 col-form-label">Função</label>
                            <div class="col-sm-10">
                                <select class="custom-select my-1 mr-sm-2" name="role">
                                    <option>Selecione</option>
                                    <option value="ADMIN">Administrador</option>
                                    <option value="OPERADOR">Operador</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="login" class="col-sm-2 col-form-label">Nome de usuario</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Digite um nome de usuario" name="login" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="pass" class="col-sm-2 col-form-label">Senha</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" placeholder="Digite uma senha" name="passwordhash" required/>
                            </div>
                        </div>
                        <input type="submit" name="cadMotorista" class="btn btn-primary my-1" value="Cadastrar"/>
                    </form> 
                <%} else{%>
                    <h2>Você não tem permissão para visualizar esse cadastro</h2>
            <%}}%>
        </div>
    </body>
</html>