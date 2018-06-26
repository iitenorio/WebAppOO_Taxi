<%@page import="br.com.fatecpg.parking.Crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - ParkingWebApp</title>
    </head>
    <body>
</div>
        <h1>Usuários</h1>
        <%if (session.getAttribute("user") == null) {%>
            <h2>É preciso estar autenticado para acessar esse recurso.</h2>
        <%}else {%>
            <% User user = (User) session.getAttribute("user"); %>
            <%if (!user.getRole().equals("ADMIN")) {%>
                <h2>Você não tem permissão para acessar esse recurso</h2>
            <%}else {%>
            <%if (error != null) {%>
            <h3><%= error %></h3>
            <%}%>
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
            <fieldset>
                <legend>Motorista</legend>
                <form>
                    Nome: <input type="text" name="nm_passageiro"/> 
                    CPF: <input type="number" name="nr_cpf"/>
                    Sexo:
                    <select name="tp_sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                    Modelo Carro: <input type="text" name="mdl_carro"/>
                    Email: <input type="text" name="email_motorista"/>
                    Senha: <input type="password" name="passwordDriver"/>
                    <input type="submit" name="cadMotorista" value="Cadastrar"/>
                </form>
            </fieldset>
            <fieldset>
                <legend>Corrida</legend>
                <form>
                    Passageiro: <select name="nm_passageiro">
                        
                        <option value="M">Masculino</option>
                    </select>
                    CPF: <input type="number" name="nr_cpf"/>
                    Sexo:
                    <select name="tp_sexo">
                        <option value="M">Masculino</option>
                        <option value="F">Feminino</option>
                    </select>
                    Modelo Carro: <input type="text" name="mdl_carro"/>
                    Email: <input type="text" name="email_motorista"/>
                    Senha: <input type="password" name="passwordDriver"/>
                    <input type="submit" name="cadMotorista" value="Cadastrar"/>
                </form>
            </fieldset>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Papel</th>
                    <th>Nome</th>
                    <th>Login</th>
                    <th>Comando</th>
                </tr>
                
                <%for(User u: User.getUsers()){%>
                <tr>
                    <td><%= u.getId()%></td>
                    <td><%= u.getRole()%></td>
                    <td><%= u.getName()%></td>
                    <td><%= u.getLogin()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="id" value="<%= u.getId()%>"/>
                            <input type="submit" name="formDeleteUser" value="Remover"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
                <h2>TODO: Tabela de Usuários</h2>
                
            <%}%>
        <%}%>
    </body>
</html>
