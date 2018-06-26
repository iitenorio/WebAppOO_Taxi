<%@page import="br.com.fatecpg.parking.AdicionarCorrida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <th scope="col">KM</th>
                    <th scope="col">VALOR TOTAL</th>
                    <th scope="col">ID DO MOTORISTA</th>
                    <th scope="col">ID DO PASSAGEIRO</th>
                    <th scope="col">COMANDO 1</th>
                </tr>
                </thead>
                <tbody>
                <%for(AdicionarCorrida run: AdicionarCorrida.getRun()){%>
                <tr>
                    <th scope="row"><%= run.getId_corrida()%></th>
                    <td><%= run.getQtd_km()%></td>
                    <td>R$ <%= run.getVl_corrida()%></td>
                    <td><%= run.getTb_mot()%></td>
                    <td><%= run.getTb_pass()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= run.getId_corrida()%>"/>
                            <input type="submit" name="formDelCorrida" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de corridas</h2>
        <%}}%>
    </body>
</html>