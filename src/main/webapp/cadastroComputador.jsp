<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Computador</title>
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
    <h1>Cadastro de Computador</h1>
    <form action="CadastroComputadorServlet" method="post">
        <label for="descr">Descrição do computador:</label>
        <input type="text" id="descr" name="descr" required><br><br>

        <label for="idlabs">Qual laboratorio?</label>
        <select id="idlabs" name="idlabs" required>
    		<option value="1">Laboratório 1</option>
    		<option value="2">Laboratório 2</option>
    		<option value="3">Laboratório 3</option>
  </select>

        <input type="submit" value="Cadastrar">
    </form>
     <a href="javascript:history.go(-1)">Voltar</a>
</body>
</html>
