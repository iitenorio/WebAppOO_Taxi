<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Sexo</th>
                    <th>Carro</th>
                    <th>Email</th>
                    <th>Comando</th>
                </tr>
                
                <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                <tr>
                    <td><%= d.getId_motorista()%></td>
                    <td><%= d.getNm_motorista()%></td>
                    <td><%= d.getNr_cpf()%></td>
                    <td><%= d.getTp_sexo()%></td>
                    <td><%= d.getMdl_carro()%></td>
                    <td><%= d.getEmail_motorista()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= d.getId_motorista()%>"/>
                            <input type="submit" name="formDelPassageiro" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de motoristas</h2>
        <%}}%>
    </body>
</html>