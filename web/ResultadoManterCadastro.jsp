<%-- 
    Document   : ResultadoManterCadastro
    Created on : 06/06/2021, 22:31:54
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background: black;
            }
            h1{
                color:yellowgreen;
            }
            .voltar button{
                background: #DAA520;
                height: 40px;
                width: 100px;
                font-weight: bold;
                border-radius: 5px;
                border: 1px solid;
                cursor: pointer;
            }
            .voltar button:hover{
                background: #F5DEB3;
            }
        </style>
    </head>
    <body>
        <h1>
        <% 
            String msg = (String) request.getAttribute("mensagem");
            out.print(msg);
        %>
        </h1>
        <br/>
        <p class="voltar">
        <button> 
            <a href="http://localhost:8080/ConsumidoraCadastroFuncionarios/index.html">Voltar</a> 
        </button>
        </p>
    </body>
</html>
