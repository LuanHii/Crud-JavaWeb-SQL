# SIMCO - Sistema de Manutenção de Computadores

Este projeto foi desenvolvido como trabalho acadêmico para a disciplina de Programação Orientada a Objeto na UERJ. O SIMCO é um sistema para gerenciar a manutenção de computadores em laboratórios de uma universidade.

## Funcionalidades

- Cadastro de usuários
- Cadastro de computadores
- Cadastro de problemas observados nos computadores
- Geração de relatórios

## Tecnologias Utilizadas

- Java
- MySQL
- Servlets
- HTML/CSS
- JSP

## Estrutura do Projeto

O projeto está dividido em diferentes componentes:

### Servlets

- `CadastroUsuarioServlet.java`: Servlet para cadastrar usuários.
- `CadastroComputadorServlet.java`: Servlet para cadastrar computadores.
- `ChecarComputadoresServlet.java`: Servlet para consultar informações sobre os computadores em um laboratório.
- `InstalarSoftwareServlet.java`: Servlet para instalar softwares nos computadores.
- `ConsultaProblemasServlet.java`: Servlet para consultar problemas relatados nos computadores.

### Páginas JSP

- `cadastroUsuario.jsp`: Formulário para cadastrar novos usuários.
- `cadastroComputador.jsp`: Formulário para cadastrar informações sobre os computadores.
- `checarComputadores.jsp`: Página para listar informações sobre os computadores em um laboratório.
- `instalarSoftware.jsp`: Formulário para instalar softwares em computadores.
- `consultaProblemas.jsp`: Página para consultar problemas relatados em computadores.

## Como Executar

1. Clone o repositório.
2. Importe o projeto em uma IDE compatível com Java.
3. Configure a conexão com o banco de dados MySQL no arquivo `ConexaoBD.java`.
4. Execute o projeto em um servidor web como Tomcat.

## Contribuições

Sinta-se à vontade para contribuir com melhorias, correções ou adição de novas funcionalidades. Abra um *issue* para discutir mudanças ou envie um *pull request*.

