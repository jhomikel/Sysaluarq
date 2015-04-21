/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.ClienteDAO;
import uml.Cliente;

/**
 *
 * @author Luis Melendez
 */
public class ClienteCTRL extends HttpServlet {

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
            /***
             * @autor Luis Melendez 
             * @version 1.0
             */
            ClienteDAO cdao = new ClienteDAO();
            RequestDispatcher rd = null;
        try {
            if (request.getParameter("insertar") != null) {
                Cliente cl = new Cliente();
                String resp = null;
                cl.setIdCliente(Integer.parseInt(request.getParameter("id")));
                cl.setNombreCliente(request.getParameter("nombre"));
                cl.setAtencion(request.getParameter("aten"));
                cl.setDireccion(request.getParameter("dire"));
                cl.setTelefon(request.getParameter("tel"));
                cl.setMovil(request.getParameter("movil"));
                cl.setCorreo(request.getParameter("correo"));
                resp = cdao.insertar(cl);
                response.setHeader("resp", resp);
                response.sendRedirect("empleado/gestion_clie.jsp");
            }else if (request.getParameter("modificar") != null) {
                Cliente cl = new Cliente();
                String resp = null;
                cl.setIdCliente(Integer.parseInt(request.getParameter("txtID")));
                cl.setNombreCliente(request.getParameter("txtnombre"));
                cl.setAtencion(request.getParameter("txtaten"));
                cl.setDireccion(request.getParameter("txtdire"));
                cl.setTelefon(request.getParameter("txttel"));
                cl.setMovil(request.getParameter("txtmovil"));
                cl.setCorreo(request.getParameter("txtcorreo"));
                resp = cdao.actualizar(cl);
                response.setHeader("resp", resp);
                response.sendRedirect("empleado/gestion_clie.jsp");
            }else if (request.getParameter("eliminar") != null) {
                Cliente cl = new Cliente();
                String resp = null;
                cl.setIdCliente(Integer.parseInt(request.getParameter("txtID")));
                resp = cdao.eliminar(cl);
                response.setHeader("resp", resp);
                response.sendRedirect("empleado/gestion_clie.jsp");
            }
        } catch (Exception e) {
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
