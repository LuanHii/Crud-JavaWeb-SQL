<!DOCTYPE html>
<html>
<head>
    <title>Escolha de Consulta</title>
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
    <form action="ConsultaProblemasServlet" method="post">
        <label for="opcoes">Escolha a op��o de consulta:</label>
        <select name="opcaoConsulta" id="opcoes">
        	<option disabled selected value>Selecione uma op��o</option>
        	<option value="todosProblemas">Todos os problemas relatados</option>
        	<option value="problemasUsuario">Problemas relatados por um usu�rio espec�fico</option>
            <option value="problemasComputador">Problemas relatados de um computador espec�fico</option>
            <option value="problemasLaboratorio">Problemas relatados de um laborat�rio espec�fico</option>
            <option value="problemasHardware">Todos os problemas de hardware</option>
            <option value="problemasSoftware">Todos os problemas de software</option>
            <option value="problemasData">Problemas relatados dentro de uma faixa de datas espec�fica</option>
            
        </select>

       
        <div id="datas" style="display: none;">
            <label for="dataInicial">Data Inicial:</label>
            <input type="date" id="dataInicial" name="dataInicial" value="2022-12-31" min="2000-12-31" max="2099-12-31"><br><br>
            <label for="dataFinal">Data Final:</label>
            <input type="date" id="dataFinal" name="dataFinal" value="2022-12-31" min="2000-12-31" max="2099-12-31"><br><br>
        </div>

       
        <div id="labEspecifico" style="display: none;">
            <label for="escolherLab">Escolher Laborat�rio:</label>
            <select name="labEspecifico" id="escolherLab">
             	<option value="" selected disabled hidden>Escolha</option>
                <option value="1">Laborat�rio 1</option>
                <option value="2">Laborat�rio 2</option>
                <option value="3">Laborat�rio 3</option>
                <option value="4">Laborat�rio 4</option>
                <option value="5">Laborat�rio 5</option>
            </select>
        </div>

       
        <div id="usuarioEspecifico" style="display: none;">
            <label for="idUsuario">ID do Usu�rio:</label>
            <input type="number" id="idUsuario" name="idUsuario">
        </div>

       
        <div id="computadorEspecifico" style="display: none;">
            <label for="idPC">ID do Computador:</label>
            <input type="number" id="idPC" name="idPC">
        </div>

        <input type="submit" value="Consultar">
    </form>
    
    
    <form action="CadastroProblema.jsp" method="post">
    	<input type="submit" value="Relatar problema">
    </form>

    <script>
        document.getElementById("opcoes").addEventListener("change", function() {
            var datasDiv = document.getElementById("datas");
            var labDiv = document.getElementById("labEspecifico");
            var usuarioDiv = document.getElementById("usuarioEspecifico");
            var computadorDiv = document.getElementById("computadorEspecifico");

            if (this.value === "problemasData") {
                datasDiv.style.display = "block";
                labDiv.style.display = "none";
                usuarioDiv.style.display = "none";
                computadorDiv.style.display = "none";
            } else if (this.value === "problemasLaboratorio") {
                datasDiv.style.display = "none";
                labDiv.style.display = "block";
                usuarioDiv.style.display = "none";
                computadorDiv.style.display = "none";
            } else if (this.value === "problemasUsuario") {
                datasDiv.style.display = "none";
                labDiv.style.display = "none";
                usuarioDiv.style.display = "block";
                computadorDiv.style.display = "none";
            } else if (this.value === "problemasComputador") {
                datasDiv.style.display = "none";
                labDiv.style.display = "none";
                usuarioDiv.style.display = "none";
                computadorDiv.style.display = "block";
            } else {
                datasDiv.style.display = "none";
                labDiv.style.display = "none";
                usuarioDiv.style.display = "none";
                computadorDiv.style.display = "none";
            }
        });
    </script>
</body>
 <a href="javascript:history.go(-1)">Voltar</a>
</html>
