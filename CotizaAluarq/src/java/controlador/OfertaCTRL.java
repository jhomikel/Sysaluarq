/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.OfertaDAO;
import uml.Cliente;
import uml.Empleado;
import uml.Oferta;

/**
 *
 * @author Edgardo
 */
public class OfertaCTRL extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            OfertaDAO odao = new OfertaDAO();
            RequestDispatcher rd = null;
            String url = "vendedores/v_principal.jsp";
            Cliente c = new Cliente(Integer.parseInt(String.valueOf(request.getParameter("cliente"))));
            Empleado e = new Empleado(Integer.parseInt(String.valueOf(request.getParameter("emp"))));
            DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Date fecha = formatter.parse(String.valueOf(request.getParameter("fecha")));
            Oferta o = new Oferta(String.valueOf(request.getParameter("num")), 
                    c, 
                    e, 
                    fecha, 
                    String.valueOf(request.getParameter("proyecto")), 
                    String.valueOf(request.getParameter("condicion")), 
                    String.valueOf(request.getParameter("validez")),
                    Double.parseDouble(request.getParameter("factor")),
                    1,
                    0,
                    0,
                    0);
            String res = odao.insertar(o);
            if (res.equals(null)) {
                request.setAttribute("msj", "Ha habido un error al ingresar los datos");
            }else{
                request.setAttribute("msj", res);
                
            }
            rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
