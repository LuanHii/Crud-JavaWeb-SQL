<!DOCTYPE html>
<html>
<head>
    <title>Checar Computadores</title>
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
    <h1>Checar computadores</h1>
    <form action="ChecarComputadoresServlet" method="get">

        <label for="idlabs">De qual laboratorio voc� deseja ver os computadores?</label>
        <select id="idlabs" name="idlabs" required>
    		<option value="4">Todos</option>
    		<option value="1">Laborat�rio 1</option>
    		<option value="2">Laborat�rio 2</option>
    		<option value="3">Laborat�rio 3</option>
  </select>

        <input type="submit" value="Ver">
    </form>
    
     <form action="ConsultaSoftwareServlet" method="post">
        <label for="opcaoConsulta">Escolha a op��o de consulta:</label>
        <select name="opcaoConsulta" id="opcaoConsulta">
            <option value="todosSoftware">Todos os softwares</option>
            <option value="problemasLabEspecifico">Softwares de um laborat�rio espec�fico</option>
        </select>

        <div id="labSelect" style="display: none;">
            <label for="labEspecifico">Escolha o laborat�rio:</label>
            <select name="labEspecifico" id="labEspecifico">
                <option value="1">Laborat�rio 1</option>
                <option value="2">Laborat�rio 2</option>
                <option value="3">Laborat�rio 3</option>
                <option value="4">Laborat�rio 4</option>
                <option value="5">Laborat�rio 5</option>
            </select>
        </div>
         <input type="submit" value="Consultar">
        </form>
       

    <script>
        document.getElementById("opcaoConsulta").addEventListener("change", function() {
            var labSelect = document.getElementById("labSelect");

            if (this.value === "problemasLabEspecifico") {
                labSelect.style.display = "block";
            } else {
                labSelect.style.display = "none";
            }
        });
    </script>
    <a href="javascript:history.go(-1)">Voltar</a>
</body>
</html>
