<%-- 
    Document   : ManterFuncionarios
    Created on : 06/06/2021, 22:11:41
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Funcionario</title>
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
        <div class="principal"><h1>Cadastrar Funcionario</h1></div>
        

        <form action='ManterCadastros' method='post'>
            <h3>Formulario do Funcionario</h3>
            
            <p class="nome">
                <input type="text" name="txtNome" placeholder="Nome"> <br>
            </p>
            <p class="rg">
                <input type="text" name="txtRg" placeholder="RG"> <br>
            </p>
            <p class="endereco">
             <input type="text" name="txtEndereco" placeholder="Endereço"> <br>
            </p>
            <p class="telefone">
                <input type="text" name="txtTelefone" placeholder="Telefone"> <br>
            </p>
            <p class="departamento">
                 <input type="text" name="txtDepartamento" placeholder="Departamento"> <br>
            </p>
            <br><br>
            <p class="cadastra">
                <input type="submit" name='btnOperacao' value="Cadastrar">
            </p>
            <p class="voltar">
                <button><a href="index.html">Voltar</button>
            </p>
        </form>
        <form action='ManterCadastros' method='post'>
            <div class="in">
                <p class="consulta">
                <input type="submit" name='btnOperacao' value="ConsultarTodos">
                </p>
            </div>
        </form>
    </body>
</html>

<!--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    input[type=text], select {
  width: 20%;
  padding: 12px 20px;
  margin: 8px 11px;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  
  
  background-color: #4CAF50;
  color: white;
  padding: 14px 35px;
  margin: 10px ;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

label{
  font-size: 25;
  padding: 12px 04px;
  margin: 8px 11px;
}

input[type=submit]:hover {
  background-color: #45a049;
   
}



.cabeca {
  border-radius: 8px;
  background-color: #f2f2f2;
  padding: 10px;
  margin-bottom:  20px;

}

.pesquisar{
    
    
}


    
</style>
    </head>
    <body>
        
        <div class="cabeca">
            <h1>Cadastrar funcionarios</h1>
        <form action='ManterCadastros' method='post'>
            <div class="in">
                <input type="submit" name='btnOperacao' value="ConsultarTodos">
            </div>
        </form>
        </div>
        <form action='ManterCadastros' method='post'>
            <label for="name">ID:</label><br>
            <input type='text' name='txtId'> <br>
            <label for="Nome">Nome:</label><br>
            <input type='text' name='txtNome' required> <br>
            <label for="RG">RG:</label><br>
            <input type='text' name='txtRg' required> <br>
            <label for="Modelo">Endereco:</label><br>
            <input type='text' name="txtEndereco" required> <br>
            <label for="Modelo">Telefone:</label><br>
            <input type='text' name="txtTelefone" required> <br>
            <label for="Modelo">Departamento:</label><br>
            <input type='text' name="txtDepartamento" required> <br>
            <br><br>
            <input type="submit" name='btnOperacao' value="Cadastrar">
        </form>

    </body>
</html>
-->