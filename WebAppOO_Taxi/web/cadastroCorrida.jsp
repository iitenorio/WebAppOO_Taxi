<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page import="br.com.fatecpg.parking.AdicionarCorrida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    if(request.getParameter("cadCorrida") != null) {
        double qtd_km = Double.parseDouble(request.getParameter("qtd_km")); 
        double vl_corrida = 0.0;
        long tb_mot = Long.parseLong(request.getParameter("driver_selecionado"));
        long tb_pass = Long.parseLong(request.getParameter("pass_selecionado"));

        if (qtd_km < 26) {
            vl_corrida = qtd_km * 3;
        } else if (qtd_km >= 26 && qtd_km < 76) {
            vl_corrida = qtd_km * 3.54;
        } else {
            vl_corrida = qtd_km * 5.30;
        }
        try{
            AdicionarCorrida.addRunning(qtd_km, vl_corrida, tb_mot, tb_pass);
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
            <%if (!user.getRole().equals("ADMIN") || !user.getRole().equals("OPERADOR")){%>
            <fieldset>
                <legend>Solicitar Corrida</legend>
                <form name="solicita">
                    Quantidade de KM: <input type="text" name="qtd_km"/>
                    Selecione o Motorista:
                    <select name="driver_selecionado">
                        <option>Selecione</option>
                        <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                            <option value="<%= d.getId_motorista()%>"><%= d.getNm_motorista()%></option>
                        <%}%>
                    </select>
                    Selecione o Cliente:
                    <select name="pass_selecionado">
                        <option>Selecione</option>
                        <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                            <option value="<%= p.getId_passageiro()%>"><%= p.getNm_passageiro()%></option>
                        <%}%>
                    </select>
                    <input type="submit" name="cadCorrida" value="Cadastrar"/>
                </form>
            </fieldset>  
            <%}%>
        <%}%>
    </body>
</html>