<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    
    if(request.getParameter("formDelMotorista") != null){
        
        try{
            long id_motorista = Long.parseLong(request.getParameter("id"));
            AdicionarMotorista.removePass(id_motorista);
            response.sendRedirect(request.getRequestURI());
            
        }catch(Exception e){
        error = e.getMessage();
        }
    }
    
    if(request.getParameter("cadMotorista") != null) {
        String nm_motorista = request.getParameter("nm_passageiro");
        String nr_cpf = request.getParameter("nr_cpf");
        String tp_sexo = request.getParameter("tp_sexo");
        String mdl_carro = request.getParameter("mdl_carro");
        String email_motorista = request.getParameter("email_motorista");
        try{
            AdicionarMotorista.addDriver(nm_motorista, nr_cpf, tp_sexo, mdl_carro, email_motorista);
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
        <h1>Cadastro de Motorista</h1>

        <%if (session.getAttribute("user") == null) {%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (!user.getRole().equals("ADMIN") || !user.getRole().equals("OPERADOR")){%>
            <fieldset>
                <legend>Motorista</legend>
                <form>
                    Nome: <input type="text" name="nm_passageiro"/> 
                    CPF: <input type="number" name="nr_cpf"/>
                    Sexo:
                    <select name="tp_sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                    Modelo Carro: <input type="text" name="mdl_carro"/>
                    Email: <input type="text" name="email_motorista"/>
                    <input type="submit" name="cadMotorista" value="Cadastrar"/>
                </form>
            </fieldset>  
            <%} else{%>
                <h2>Você não tem permissão para visualizar esse cadastro</h2>
        <%}}%>
    </body>
</html>