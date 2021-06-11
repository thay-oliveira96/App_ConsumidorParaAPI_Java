
<%@page import="Model.Funcionario"%>
<%@page import="Util.Conexao"%>
<%@page import="Controller.ManterCadastros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Cadastro</title>
        <style>
            body{
                background: black; 
                margin: 0;
                padding: 0;
            }
            form{
                font-size: 16px;
                background: #F0FFFF;
                max-width: 550px;
                margin: 0 auto;
                padding: 0 10px 10px 10px;
            }
            h1{
                color: white;
            }
            input{
                width: 500px;
                padding: 10px;
            }
            .cadastra input{
                background: #008000;
                height: 40px;
                width: 550px;
                font-weight: bold;
                border-radius: 5px;
                border: 1px solid;
                cursor: pointer;
            }
            .cadastra input:hover{
                background:#98FB98;
            }
            .consulta input{
                background: red;
                height: 40px;
                width: 530px;
                font-weight: bold;
                border-radius: 5px;
                border: 1px solid;
                cursor: pointer;
            }
            .consulta input:hover{
                background:#f25e5e;
            }
            .voltar button{
                background: #DAA520;
                height: 40px;
                width: 550px;
                font-weight: bold;
                border-radius: 5px;
                border: 1px solid;
                cursor: pointer;
            }
            .voltar button:hover{
                background: #F5DEB3;
            }
            a{
                text-decoration: none;
                color: black;
            }
            .principal{

                text-align: center;
                background: blue;
                padding: 20px;
            }
            .espaco{
                padding: 40px;
            }
        </style>
    </head>
    <body>

        <div class="principal">
            <h1>Alteração de Cadastro</h1> 
        </div>
        <%
            int id = Integer.parseInt(request.getParameter("txtId"));
        %>
        <form action='ManterCadastros' method='post'>
            <h3>Formulario de Alteração</h3>
            <p class="id">
                <input type='text' name='txtId'  placeholder="<%out.print(id);%>" value="<%out.print(id);%>">
            </p>
            <p class="nome">
                <input type='text' name='txtNome' placeholder="Nome">
            </p>
            <p class="rg">
                <input type='text' name='txtRg' placeholder="Rg">
            </p>
            <p class="departamento">
                <input type='text' name='txtEndereco' placeholder="Departamento">
            </p>
            <p class="telefone">
                <input type='text' name='txtTelefone' placeholder="Telefone">
            </p>
            <p class="departamento">
                <input type='text' name='txtDepartamento' placeholder="Departamento">
            </p>
            <p class="cadastra"> 
                <input  type="submit" name='btnOperacao' value="alterar">
            </p>
            <p class="voltar">
                <button><a href="index.html">Voltar</a></button>
            </p>
        </form>
        <form action='ManterCadastros' method='post'>
            <p class="consulta">
                <input type="submit" name='btnOperacao' value="ConsultarTodos">
            </p>
        </form>
    </body>
</html>