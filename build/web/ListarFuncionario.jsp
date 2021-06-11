<%-- 
    Document   : ListarFuncionario
    Created on : 06/06/2021, 22:49:20
    Author     : User
--%>

<%@page import="Model.Funcionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Funcionarios</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body{
                background: black;
            }
            table{
                width: 1000px;
                border-collapse: separate;/*collapse*/;
            }
            th, td{
                    padding: 7px;
                  }
            th{
                text-transform: uppercase; /* Deixar a letra de um local especifico maiuscula*/
                border-top:1px solid #999;
                border-bottom: 1px solid #111;
                text-align: left;
                font-size: 90%;
                letter-spacing: 0.1em; /*espaçamento entre letras*/
                }
            tr.alternado{
                      background-color: #F0FFFF;
                   }
            tr:hover{
                        background-color: #c3e6e5;
                }
                .busca input{
                    background: blue;
                    border-radius: 5px;
                    border:none;
                    cursor:pointer;
                }
                .busca input:hover{
                    color: white;
                }
                .remover input{
                    background: red;
                    border-radius: 5px;
                    border:none;
                    cursor:pointer;
                }
                .remover input:hover{
                    color:white;
                }
                button{
                    width: 100px;
                    height: 50px;
                    background: gold;
                }
                button:hover{
                    background:#FAFAD2;
                }
                a{
                    text-decoration: none;
                    color: black;
                }
                a:hover{
                    color:white;
                }
        </style>
    </head>
    <body>
        <div>
            <h1 style="color:white">Listar Produtos</h1>
        <table style="background-color:aqua">
            <thead>
                <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>RG</th>
                <th>Endereco</th>
                <th>Telefone</th>
                <th>Departamento</th>
                <th>Deletar</th>
                <th>Alterar</th>
  </tr>
</thead
        <% 
           List<Funcionario> lfuncionario = (List<Funcionario>)request.getAttribute("ListFuncionario");
           
           for(Funcionario f : lfuncionario){
               %><tr class="alternado"><% 
               %><td><%out.print(f.getId());%></td><%
               %><td><%out.print(f.getNome());%></td><%
               %><td><%out.print(f.getRg());%></td><%
               %><td><%out.print(f.getEndereco());%></td><%
               %><td><%out.print(f.getTelefone());%></td><%
               %><td><%out.print(f.getDepartamento());%></td><%
               %><td><form action='ManterCadastros' method='post'>
                      <input type="hidden" value="<%= f.getId()%>" name='txtId'> 
                      <input style="background:red" class="remover" type="submit" name='btnOperacao' value="delete" class="alterar" >
                     </form></td><%
               %><td><form action='ManterCadastros' method='post'>    
                       <input  type="hidden" value="<%= f.getId()%>" name='txtId'>
                       <input style="background:blue" type="submit" name='btnOperacao' value="Alterar" class="alterar" >
                   </form></td>
               </tr><%
                
                   
           }

        %>
        </table>
        </div>
        
        <button> <a href="http://localhost:8080/ConsumidoraCadastroFuncionarios/index.html">Voltar ao inicio</a> </button>
    </body>
</html>