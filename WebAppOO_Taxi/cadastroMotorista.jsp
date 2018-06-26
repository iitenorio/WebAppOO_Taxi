<%@page import="br.com.fatecpg.parking.AdicionarCorrida"%>
<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page import="br.com.fatecpg.parking.AdicionarMotorista"%>
<%@page import="br.com.fatecpg.parking.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    if(request.getParameter("cadCorrida") != null) {
        double qtd_km = Double.parseDouble(request.getParameter("qtd_km")); 
        double vl_corrida = Double.parseDouble(request.getParameter("vl_corrida"));
        long tb_mot = Long.parseLong(request.getParameter("driver_selecionado"));
        long tb_pass = Long.parseLong(request.getParameter("pass_selecionado")); 
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
        <title>Home - ParkingWebApp</title>
<script> 
function soma() 
{
solicita.campo4.value = (solicita.qtd_km.value*1) * (solicita.vl_corrida.value*1);
}
</script>
    </head>
    
        <h1>Página Inicial</h1>
            <fieldset>
                <legend>Solicitar Corrida</legend>
                <form name="solicita">
                    Quantidade de KM: <input type="text" name="qtd_km"/>
                    Valor por KM: <input type="text" name="vl_corrida"/>
                    Selecione o Motorista:
                    <select name="driver_selecionado">
                        <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                            <option value="<%= d.getId_motorista()%>"><%= d.getNm_motorista()%></option>
                        <%}%>
                    </select>
                    Selecione o Cliente:
                    <select name="pass_selecionado">
                        <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                            <option value="<%= p.getId_passageiro()%>"><%= p.getNm_passageiro()%></option>
                        <%}%>
                    </select> 
                    Valor total da corrida: <input name="campo4" readonly/>
                    <input type="button" onclick="soma()" value="Soma os Valores">
                    <input type="submit" name="cadCorrida" value="Cadastrar"/>
                </form>
            </fieldset>
        
            <table border="1">
                <tr>
                    <th>Nome passageiro</th>
                    <th>Nome motorista</th>
                    <th>KM</th>
                    <th>Valor por km</th>
                    <th>ID MOT</th>
                    <th>ID PASS</th>
                </tr>
                
                <%for(AdicionarMotorista d: AdicionarMotorista.getDrivers()){%>
                <tr>
                    <td><%= d.getId_motorista()%></td>
                    <td><%= d.getNm_motorista()%></td>
                    <td><%= d.getNr_cpf()%></td>
                    <td><%= d.getTp_sexo()%></td>
                    <td><%= d.getMdl_carro()%></td>
                    <td><%= d.getEmail_motorista()%></td>
                </tr>
                <%}%>
            </table>    
</html>