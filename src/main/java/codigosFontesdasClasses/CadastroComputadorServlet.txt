package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

@WebServlet("/CadastroComputadorServlet")
public class CadastroComputadorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<style>");
        out.println("body {");
        out.println("    text-align: center;");
        out.println("    background-color: #ffffe0;");
        out.println("}");
        out.println("h1 {");
        out.println("    margin-top: 50px;");
        out.println("}");
        out.println("button {");
        out.println("    margin-top: 20px;");
        out.println("    padding: 10px 20px;");
        out.println("    border-radius: 5px;");
        out.println("    border: none;");
        out.println("    cursor: pointer;");
        out.println("}");
        out.println("button:hover {");
        out.println("    transform: scale(1.1);");
        out.println("    filter: brightness(90%);");
        out.println("}");
        out.println("input[type='submit'] {");
        out.println("    margin-top: 20px;");
        out.println("    padding: 10px 20px;");
        out.println("    border-radius: 5px;");
        out.println("    border: none;");
        out.println("    cursor: pointer;");
        out.println("    transition: transform 0.3s ease-in-out;");
        out.println("}");
        out.println("input[type='submit']:hover {");
        out.println("    transform: scale(1.1);");
        out.println("    filter: brightness(90%);");
        out.println("}");
        out.println("</style>");

       
        String descr = request.getParameter("descr");
        int idlabs = Integer.parseInt(request.getParameter("idlabs"));

        Connection conexao = null;
        PreparedStatement stmtConsulta = null;
        PreparedStatement stmtInsercao = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidade_db", "root", "123456");
            
            String query = "SELECT MAX(id_pc) FROM pc";
            stmtConsulta = conexao.prepareStatement(query); 
            ResultSet resultSet = stmtConsulta.executeQuery();
            
            int maiorID = 0;
            if (resultSet.next()) {
                maiorID = resultSet.getInt(1);
            }

            int novoID = maiorID + 1; 
            
            
            String insertQuery = "INSERT INTO pc (id_pc, descr, id_labs) VALUES (?, ?, ?)";
            stmtInsercao = conexao.prepareStatement(insertQuery);
            stmtInsercao.setInt(1, novoID);
            stmtInsercao.setString(2, descr);
            stmtInsercao.setInt(3, idlabs);

            
            stmtInsercao.executeUpdate();
            
            resultSet.close();
            stmtConsulta.close();
            stmtInsercao.close();
            conexao.close();
            
            

            response.setContentType("text/html");
            out.println("<html><body>");
            out.println("<h2>Computador Cadastrado com Sucesso!</h2>");
            out.println("<form action='index.jsp'>");
            out.println("<input type='submit' value='Voltar para o inicio'>");
            out.println("</form>");
            out.println("</body></html>");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmtConsulta  != null) {
                	stmtConsulta.close();
                }
                if (stmtInsercao  != null) {
                	stmtInsercao.close();
                } 
                if (conexao != null) {
                    conexao.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
