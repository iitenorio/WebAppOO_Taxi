<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page import="br.com.fatecpg.parking.AdicionarCorrida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
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
        <center>
            <div class="jumbotron">
                <div class="container">
                    <h2>Seja bem vindo ao a solicitação de coriddas</h2>
                    <h3>Insira abaixo os seus dados</h3>
                </div>
            </div>
        </center>
        
        <div class="container">
            <%if (session.getAttribute("user") == null) {%>
                <h2>É preciso estar autenticado para acessar este recurso</h2>
            <%}else {%>
                <% User user = (User) session.getAttribute("user"); %>
                <%if (!user.getRole().equals("ADMIN") || !user.getRole().equals("OPERADOR")){%>
                    <form name="solicita">
                        <div class="form-group row">
                            <label for="qtd" class="col-sm-2 col-form-label">Quantidade de KM</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" placeholder="Digite a quantida de KM" name="qtd_km" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="driver_selecionado" class="col-sm-2 col-form-label">Selecione o Motorista</label>
                            <div class="col-sm-10">
                                <select class="custom-select my-1 mr-sm-2" name="driver_selecionado">
                                    <option>Selecione</option>
                                    <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                                        <option value="<%= d.getId_motorista()%>"><%= d.getNm_motorista()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="pass_selecionado" class="col-sm-2 col-form-label">Selecione o Passageiro</label>
                            <div class="col-sm-10">
                                <select class="custom-select my-1 mr-sm-2" name="pass_selecionado">
                                    <option>Selecione</option>
                                    <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                                        <option value="<%= p.getId_passageiro()%>"><%= p.getNm_passageiro()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <input type="submit" name="cadMotorista" class="btn btn-primary my-1" value="Cadastrar"/>
                    </form> 
                <%}%>
            <%}%>
        </div>
    </body>
</html>