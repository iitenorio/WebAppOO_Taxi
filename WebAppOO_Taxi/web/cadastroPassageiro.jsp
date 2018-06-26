<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    
    if(request.getParameter("formDelPassageiro") != null){
        
        try{
            long id_passageiro = Long.parseLong(request.getParameter("id"));
            AdicionarPassageiro.removePass(id_passageiro);
            response.sendRedirect(request.getRequestURI());
            
        }catch(Exception e){
        error = e.getMessage();
        }
    }
    
    if(request.getParameter("cadPassageiro") != null) {
        String nm_passageiro = request.getParameter("nm_passageiro");
        String nr_cpf = request.getParameter("nr_cpf");
        String tp_sexo = request.getParameter("tp_sexo");
        String email_passageiro = request.getParameter("email_passageiro");
        try{
            AdicionarPassageiro.addPass(nm_passageiro, nr_cpf, tp_sexo, email_passageiro);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception e){
            error = e.getMessage();
        }
    }
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - ParkingWebApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Cadastro de passageiros</h1>
        <%if (session.getAttribute("user") == null) {%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (!user.getRole().equals("ADMIN") || !user.getRole().equals("OPERADOR")){%>
            <fieldset>
                <legend>Passageiro</legend>
                <form>
                    Nome: <input type="text" name="nm_passageiro"/> 
                    CPF: <input type="number" name="nr_cpf"/>
                    Sexo:
                    <select name="tp_sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                    Email: <input type="text" name="email_passageiro"/>
                    <input type="submit" name="cadPassageiro" value="Cadastrar"/>
                </form>
            </fieldset>  
            <%} else{%>
                <h2>Você não tem permissão para visualizar esse cadastro</h2>
        <%}}%>
    </body>
</html>