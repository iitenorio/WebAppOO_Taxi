<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
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
                    <th scope="col">Email</th>
                    <th scope="col">Comando 1</th>
                    <th scope="col">Comando 2</th>
                </tr>
                </thead>
                <tbody>
                <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                <tr>
                    <th scope="row"><%= p.getId_passageiro()%></th>
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
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= p.getId_passageiro()%>"/>
                            <input type="submit" name="altPassageiro" value="Alterar"/>
                        </form>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <%}else{%>
                <h2>Você não tem permissão para visualizar a lista de passageiros</h2>
        <%}}%>
    </body>
</html>