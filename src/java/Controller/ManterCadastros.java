/*
Nome:Thaynan Rodrigues de Oliveira      RGM: 11191102746
Nome: Vinicius Gonzales Egidio          RGM: 11191101856
Materia: Sistema da Informação          Turma: 5SIB
Materia: Sistemas Distribuidos e Padrões de Projetos Orientado a Objeto
 */
package Controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import Model.Funcionario;
import Util.Conexao;
import factory.Factory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thaynan
 */
@WebServlet(name = "ManterCadastros", urlPatterns = {"/ManterCadastros"})
public class ManterCadastros extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, Exception {
    response.setContentType("text/html;charset=UTF-8");
        
        String mensagem ="";       
        Funcionario f = new Funcionario();
        try (PrintWriter out = response.getWriter()) {
            
            String operacao = request.getParameter("btnOperacao");
            
            if (operacao.equals("Cadastrar")){
                String nome = request.getParameter("txtNome");
                String rg = request.getParameter("txtRg");
                String endereco = request.getParameter("txtEndereco");
                String telefone = request.getParameter("txtTelefone");
                String departamento = request.getParameter("txtDepartamento");
                
                if(telefone == null) {
                    f = Factory.funcionarioSemTelefone(nome, rg, endereco, departamento);
                }
                else if(telefone == null && endereco == null){
                    f = Factory.funcionarioSemTelefoneEEndereco(nome, rg, departamento);
                }
                else{
                    f.setNome(nome);
                    f.setRg(rg);
                    f.setEndereco(endereco);
                    f.setTelefone(telefone);
                    f.setDepartamento(departamento);
                }
                   
                String url_api = "http://localhost:8080/WSColaborador_v2/webresources/generic/funcionario/cadastrar";
                
                try {
                    Gson g = new Gson();
                    Conexao.sendPost(url_api, g.toJson(f), "POST");
                 } catch (Exception ex) {
                    System.out.println("Erro: " + ex.getMessage());
                    //Se exister a classe Logger pode-se fazer da seguinte maneira 
                    //Logger.getLog().salvarLog(ex.Message());
                }
        
                mensagem = "Cadastro realizado com sucesso";
                request.setAttribute("mensagem", mensagem);
                request.getRequestDispatcher("/ResultadoManterCadastro.jsp").forward(request, response);
            }
            
           
            //remover
            if (operacao.equals("delete")){
                String id = request.getParameter("txtId");
                
                String url_api = "http://localhost:8080/WSColaborador_v2/webresources/generic/funcionario/deletar/" + id;
                
                
                try {
                    Gson g = new Gson();
                    Conexao.sendGet(url_api, "DELETE");
                    mensagem = "Deletado com sucesso";
                    request.setAttribute("mensagem", mensagem);
                    request.getRequestDispatcher("/ResultadoManterCadastro.jsp").forward(request, response);
                }catch(Exception ex) {
                    System.out.println("Erro: " + ex.getMessage());}
                    
                }
                
            //Consultar todos
            if (operacao.equals("ConsultarTodos")){
 
                try {
                    List<Funcionario>listFuncionario = ConsultarTodos();
                    request.setAttribute("ListFuncionario", listFuncionario);
                    request.getRequestDispatcher("/ListarFuncionario.jsp").forward(request, response);

                } catch (Exception ex) {
                    System.out.println("Erro: " + ex.getMessage());}

            }
            
            if (operacao.equals("Alterar")){
                int id = Integer.parseInt(request.getParameter("txtId"));
                request.setAttribute("id", id);
                request.getRequestDispatcher("/AlterarFuncionario.jsp").forward(request, response);
  
            }
            
            if (operacao.equals("alterar")){
                String nome = request.getParameter("txtNome");
                String rg = request.getParameter("txtRg");
                String endereco = request.getParameter("txtEndereco");
                String telefone = request.getParameter("txtTelefone");
                String departamento = request.getParameter("txtDepartamento");
                int id = Integer.parseInt(request.getParameter("txtId"));
                f = new Funcionario();
                f.setNome(nome);
                f.setRg(rg);
                f.setEndereco(endereco);
                f.setTelefone(telefone);
                f.setDepartamento(departamento);
                f.setId(id);
                
                String url_ap = "http://localhost:8080/WSColaborador_v2/webresources/generic/funcionario/alterar";

                try {
                    Gson ge = new Gson();
                    Conexao.sendPost(url_ap, ge.toJson(f), "PUT");
                    
                    List<Funcionario> listFuncionario = ConsultarTodos();
                
                request.setAttribute("ListFuncionario", listFuncionario);
                request.getRequestDispatcher("/ListarFuncionario.jsp").forward(request, response);
                
                
                 } catch (Exception ex) {
                    System.out.println("Erro: " + ex.getMessage());
                    //Se exister a classe Logger pode-se fazer da seguinte maneira 
                    //Logger.getLog().salvarLog(ex.Message());
                }
                
            }    
            
        }
            
    }
        
        
     
// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManterCadastros.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ManterCadastros.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public static List<Funcionario> ConsultarTodos() throws Exception{
        String url_api = "http://localhost:8080/WSColaborador_v2/webresources/generic/funcionario";
        Gson g = new Gson();
        String st = Conexao.sendGet(url_api, "GET");
                
                
                List<Funcionario> listFuncionario = null;
                try {
                    Type ListProdutoType = new TypeToken<ArrayList<Funcionario>>(){}.getType();
                    listFuncionario = g.fromJson(st, ListProdutoType);

                } catch (Exception ex) {
                    System.out.println("Erro: " + ex.getMessage());
                }
                
        return listFuncionario;
    }      
                

}


     


