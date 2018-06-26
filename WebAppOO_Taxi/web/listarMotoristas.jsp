<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
<%
    String error = null;
    if(request.getParameter("formDelMotorista") != null){
        
        try{
            long id_motorista = Long.parseLong(request.getParameter("id"));
            AdicionarMotorista.removeDriver(id_motorista);
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
        <h1>Lista de Corridas</h1>
        <%if (session.getAttribute("user") == null) {%>
            <h2>É preciso estar autenticado para acessar este recurso</h2>
        <%}else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (user.getRole().equals("ADMIN")){%>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">CPF</th>
                    <th scope="col">Sexo</th>
                    <th scope="col">Carro</th>
                    <th scope="col">Email</th>
                    <th scope="col">Comando 1</th>
                    <th scope="col">Comando 2</th>
                </tr>
                </thead>
                <tbody>
                <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                <tr>
                    <th scope="row"><%= d.getId_motorista()%></tH>
                    <td><%= d.getNm_motorista()%></td>
                    <td><%= d.getNr_cpf()%></td>
                    <td><%= d.getTp_sexo()%></td>
                    <td><%= d.getMdl_carro()%></td>
                    <td><%= d.getEmail_motorista()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= d.getId_motorista()%>"/>
                            <input type="submit" name="formDelMotorista" value="Remover"/>
                        </form>
                    </td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= d.getId_motorista()%>"/>
                            <input type="submit" name="altMotorista" value="Alterar"/>
                        </form>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de motoristas</h2>
        <%}}%>
    </body>
</html>