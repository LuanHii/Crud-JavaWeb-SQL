package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConsultaSoftwareServlet")
public class ConsultaSoftwareServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
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

        Connection conexao = null;
        PreparedStatement stmtConsulta = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidade_db", "root", "123456");

            String opcaoConsulta = request.getParameter("opcaoConsulta");

            if (opcaoConsulta.equals("todosSoftware")) {
                String query = "SELECT * FROM softwares";
                stmtConsulta = conexao.prepareStatement(query);
            } else if (opcaoConsulta.equals("problemasLabEspecifico")) {
                String labEspecifico = request.getParameter("labEspecifico");
                String query = "SELECT * FROM softwares WHERE id_lab = ?";
                stmtConsulta = conexao.prepareStatement(query);
                stmtConsulta.setString(1, labEspecifico);
            }

            ResultSet resultSet = stmtConsulta.executeQuery();

            out.println("<html><body>");
            out.println("<h2>Resultados da Consulta:</h2>");
            out.println("<ul>");

            while (resultSet.next()) {
               
                String id_soft = resultSet.getString("id_software");
                String nome = resultSet.getString("nome");
                String id_pc = resultSet.getString("id_pc");
                String id_lab = resultSet.getString("id_lab");

                out.println("<li>ID Software: " + id_soft + ", Nome: " + nome + ", ID PC: " + id_pc + ", ID Laboratório: " + id_lab + "</li>");
            }

            out.println("</ul>");
            out.println("<a href='index.jsp'>Retornar ao Index</a>");
            out.println("</body></html>");

            resultSet.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmtConsulta != null) {
                    stmtConsulta.close();
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
