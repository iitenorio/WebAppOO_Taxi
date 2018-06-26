<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
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
                    <th>Email</th>
                    <th>Comando</th>
                </tr>
                <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                <tr>
                    <td><%= p.getId_passageiro()%></td>
                    <td><%= p.getNm_passageiro()%></td>
                    <td><%= p.getNr_cpf()%></td>
                    <td><%= p.getTp_sexo()%></td>
                    <td><%= p.getEmail_passageiro()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= p.getId_passageiro()%>"/>
                            <input type="submit" name="formDelPassageiro" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de passageiros</h2>
        <%}}%>
    </body>
</html>