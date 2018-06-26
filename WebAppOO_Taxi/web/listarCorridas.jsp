<%@page import="br.com.fatecpg.parking.AdicionarCorrida"%>
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
                    <th>KM</th>
                    <th>VALOR TOTAL</th>
                    <th>ID DO MOTORISTA</th>
                    <th>ID DO PASSAGEIRO</th>
                </tr>
                
                <%for(AdicionarCorrida run: AdicionarCorrida.getRun()){%>
                <tr>
                    <td><%= run.getId_corrida()%></td>
                    <td><%= run.getQtd_km()%></td>
                    <td>R$ <%= run.getVl_corrida()%></td>
                    <td><%= run.getTb_mot()%></td>
                    <td><%= run.getTb_pass()%></td>
                </tr>
                <%}%>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de corridas</h2>
        <%}}%>
    </body>
</html>