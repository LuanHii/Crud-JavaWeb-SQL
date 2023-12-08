<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Instalar Software</title>
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
 <h1>Instalar Software</h1>
 
 <form action="InstalarSoftwareServlet" method="post">
 		
        
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>
        
       
        <label for="id_pc">ID do PC:</label>
        <input type="text" id="id_pc" name="id_pc" required><br><br>
		
		<label for="id_pc">ID do LAB:</label>
        <input type="text" id="id_lab" name="id_lab" required><br><br>        
        
  		

        <input type="submit" value="Instalar">
    </form> 
     <a href="javascript:history.go(-1)">Voltar</a>

</body>
</html>