<!DOCTYPE html>
<html>
<head>
    <title>Sistema</title>
     <style>
        body {
            text-align: center;
            background-color:  #ffffe0;
        }
        h1 {
            margin-top: 50px;
        }
        button {
            margin: 20px 20px;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            
        }
        
        button:hover {
        	transform: scale(1.1);
        	filter: brightness(90%);
        }
        
        
        
        
        	
        
    </style>
</head>
<body>
    <h1>SIMCO - Sistema de Manutenção de Computadores</h1>
    <form>
        <button type="submit" formaction="cadastroUsuario.jsp">Cadastrar Usuario</button>
        <button type="submit" formaction="cadastroComputador.jsp">Cadastrar Computador</button>
        <button type="submit" formaction="checarComputadores.jsp">Checar computadores</button>
        <button type="submit" formaction="instalarSoftware.jsp">Instalar softwares</button>
        <button type="submit" formaction="checarProblemas.jsp">Problemas</button>
        
        
    </form>
</body>
</html>
