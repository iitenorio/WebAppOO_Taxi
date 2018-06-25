<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page import="br.com.fatecpg.parking.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String error = null;
    if(request.getParameter("cadPassageiro") != null) {
        String nm_passageiro = request.getParameter("nm_passageiro");
        String nr_cpf = request.getParameter("nr_cpf");
        String tp_sexo = request.getParameter("tp_sexo");
        String email_passageiro = request.getParameter("email_passageiro");
        long passwordHash = request.getParameter("passwordHash").hashCode();
        try{
            AdicionarPassageiro.addPass(nm_passageiro, nr_cpf, tp_sexo, email_passageiro, passwordHash);
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
        <h1>Página Inicial</h1>
            <fieldset>
                <legend>Passageiro</legend>
                <form>
                    Nome: <input type="text" name="nm_passageiro"/> 
                    CPF: <input type="number" name="nr_cpf"/>
                    Sexo:
                    <select name="tp_sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                    Email: <input type="text" name="email_passageiro"/>
                    Senha: <input type="password" name="passwordHash"/>
                    <input type="submit" name="cadPassageiro" value="Cadastrar"/>
                </form>
            </fieldset>
   
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Sexo</th>
                    <th>Email</th>
                </tr>
                
                <%for(AdicionarPassageiro p: AdicionarPassageiro.getPassa()){%>
                <tr>
                    <td><%= p.getId_passageiro()%></td>
                    <td><%= p.getNm_passageiro()%></td>
                    <td><%= p.getNr_cpf()%></td>
                    <td><%= p.getTp_sexo()%></td>
                    <td><%= p.getEmail_passageiro()%></td>
                </tr>
                <%}%>
            </table>
    </body>
</html>