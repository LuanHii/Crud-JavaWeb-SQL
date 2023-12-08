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

@WebServlet("/ChecarComputadoresServlet")
public class ChecarComputadoresServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        Connection conexao = null;
        PreparedStatement stmtConsulta = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidade_db", "root", "123456");

            
            String idLaboratorioStr = request.getParameter("idlabs");
            int idLaboratorio = Integer.parseInt(idLaboratorioStr);

            if (idLaboratorio == 4) {
                
                String query = "SELECT id_pc, descr FROM pc";
                stmtConsulta = conexao.prepareStatement(query);
            } else {
                
                String query = "SELECT id_pc, descr FROM pc WHERE id_labs = ?";
                stmtConsulta = conexao.prepareStatement(query);
                stmtConsulta.setInt(1, idLaboratorio);
            }


            ResultSet resultSet = stmtConsulta.executeQuery();

            out.println("<html><body>");
            if (idLaboratorio == 4) {
            	out.println("<h2>Lista de Computadores de todos os laboratórios:</h2>");
            } else {
            	out.println("<h2>Lista de Computadores do Laboratório " + idLaboratorio + ":</h2>");
            }
            out.println("<ul>");

            while (resultSet.next()) {
                int id_pc = resultSet.getInt("id_pc");
                String descr = resultSet.getString("descr");
                out.println("<li>ID: " + id_pc + ", Descrição: " + descr + "</li>");
            }

            out.println("</ul>");
            out.println("<form action='index.jsp'>");
            out.println("<input type='submit' value='Voltar para o Index'>");
            out.println("</form>");
            out.println("</body></html>");

            resultSet.close();
            stmtConsulta.close();
            conexao.close();
        } catch (ClassNotFoundException | SQLException | NumberFormatException e) {
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
