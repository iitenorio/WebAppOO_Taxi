<%@page import="br.com.fatecpg.parking.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    
    if(request.getParameter("formDelUsuario") != null){
        
        try{
            long id_usuario = Long.parseLong(request.getParameter("id"));
            User.removeUser(id_usuario);
            response.sendRedirect(request.getRequestURI());
            
        }catch(Exception e){
        error = e.getMessage();
        }
    }
    
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
        <h1>Solicitar Corrida</h1>
        <%if (session.getAttribute("user") == null) {%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (user.getRole().equals("ADMIN")){%>
            <fieldset>
                <legend>Usuario</legend>
                <form>
                    Nome: <input type="text" name="nome"/> 
                    Função:
                    <select name="role">
                        <option value="ADMIN">Administrador</option>
                        <option value="OPERADOR">Operador</option>
                    </select>
                    Login: <input type="text" name="login"/>
                    Senha: <input type="text" name="passwordhash"/>
                    <input type="submit" name="cadUsuario" value="Cadastrar"/>
                </form>
            </fieldset>  
            <%} else{%>
                <h2>Você não tem permissão para visualizar esse cadastro</h2>
        <%}}%>
    </body>
</html>