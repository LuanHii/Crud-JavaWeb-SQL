<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Problema</title>
 <style>
        body {
            text-align: center;
            background-color:  #ffffe0;
        }
        h1 {
            margin-top: 50px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        
          button:hover {
        	transform: scale(1.1);
        	filter: brightness(90%);
        }
        
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
             transition: transform 0.3s ease-in-out;
        }
        
        input[type="submit"]:hover {
        	transform: scale(1.1);
        	filter: brightness(90%);
        }
    </style>
</head>
<body>
 <h1>Cadastro de problema</h1>
 
 <form action="CadastroProblemaServlet" method="post">
 		
        <label for="descr">Descrição:</label>
        <input type="text" id="descr" name="descr" required><br><br>

        <label for="tipo">Tipo:</label>
        <select id="tipo" name="tipo" required>
    		<option value="software">Software</option>
    		<option value="hardware">Hardware</option>
  		</select><br>
  		<label for="date" >Data:</label>
        <input type="date" id="date" name="date" value="2023-31-12" min="2000-31-12" max="2099-12-31" />
        
        <label for="id_pc">Id do computador:</label>
        <input type="text" id="id_pc" name="id_pc" required><br>
        
        <label for="id_user">Id do usuario:</label>
        <input type="text" id="id_user" name="id_user" required><br>
        
        <label for="escolherLab">Qual laboratório?</label>
        <select name="labEspecifico" id="escolherLab" required>
                <option value="1">Laboratório 1</option>
                <option value="2">Laboratório 2</option>
                <option value="3">Laboratório 3</option>
                <option value="4">Laboratório 4</option>
                <option value="5">Laboratório 5</option>
            </select><br><br>
        

        <input type="submit" value="Cadastrar">
    </form> 
     <a href="javascript:history.go(-1)">Voltar</a>

</body>
</html>