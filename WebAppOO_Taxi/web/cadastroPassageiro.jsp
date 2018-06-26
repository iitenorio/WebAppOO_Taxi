<%@page import="br.com.fatecpg.parking.AdicionarPassageiro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
<%
    String error = null;

    if(request.getParameter("cadPassageiro") != null) {
        String nm_passageiro = request.getParameter("nm_passageiro");
        String nr_cpf = request.getParameter("nr_cpf");
        String tp_sexo = request.getParameter("tp_sexo");
        String email_passageiro = request.getParameter("email_passageiro");
        try{
            AdicionarPassageiro.addPass(nm_passageiro, nr_cpf, tp_sexo, email_passageiro);
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
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <center>
            <div class="jumbotron">
                <div class="container">
                    <h2>Seja bem vindo ao cadastro de novos passageiros</h2>
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

                    <form>
                        <div class="form-group row">
                            <label for="nome" class="col-sm-2 col-form-label">Nome completo</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Digite o seu nome completo" name="nm_passageiro" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="cpf" class="col-sm-2 col-form-label">Número do CPF</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Digite o seu CPF" name="nr_cpf" required/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="sexo" class="col-sm-2 col-form-label">Sexo</label>
                            <div class="col-sm-10">
                                <select class="custom-select my-1 mr-sm-2" name="tp_sexo">
                                    <option>Selecione</option>
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-2 col-form-label">Email para contato</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="Digite o seu email" name="email_passageiro" required/>
                            </div>
                        </div>
                        <input type="submit" name="cadPassageiro" class="btn btn-primary my-1" value="Cadastrar"/>
                    </form> 
                <%} else{%>
                    <h2>Você não tem permissão para visualizar esse cadastro</h2>
            <%}}%>
        </div>
    </body>
</html>