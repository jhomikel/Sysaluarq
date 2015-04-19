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
import javax.servlet.http.HttpSession;
import modeloDAO.EmpleadoDAO;
import uml.Empleado;

/**
 *
 * @author PCVirtual
 */
public class EmpleadoCTRL extends HttpServlet {

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
            EmpleadoDAO edao = new EmpleadoDAO();
            RequestDispatcher rd = null;
            String url = null;
            HttpSession session = request.getSession(false);
            try {
                if(request.getParameter("btnLogin")!=null){
                    String us = request.getParameter("txtCorreo");
                    String psw = request.getParameter("txtPassword");
                    if(edao.validarUs(us, psw)){
                        session.setAttribute("username", edao.getEmpleado().getCorreo());
                        response.sendRedirect("administrador/gestion_emp.jsp");
                    } else {
                        request.setAttribute("msj", "Usuario o contraseña incorrectos");
                        url = "index.jsp";
                        rd = request.getRequestDispatcher(url);
                    }                    
                }                
                rd.forward(request, response);
            } catch (Exception e) {               
            }
            
            /***
             * @autor Angel vargas 
             * @version 1.0
             */
            try {
                if(request.getParameter("insertar")!= null){
                    Empleado e = new Empleado();
                    String resp = null;
                    e.setIdEmpleado(Integer.parseInt(request.getParameter("id")));
                    e.setNombres(request.getParameter("nombres"));
                    e.setApellidos(request.getParameter("apellidos"));
                    e.setCorreo(request.getParameter("correo"));
                    e.setContrasenya(request.getParameter("contra"));
                    e.setRol(request.getParameter("rol"));
                    resp = edao.insertar(e);
                    response.setHeader("resp", resp);
                    response.sendRedirect("administrador/gestion_emp.jsp");     
                }else if(request.getParameter("modificar")!=null){
                     Empleado em = new Empleado();
                    String resp = null;
                    em.setIdEmpleado(Integer.parseInt(request.getParameter("txtID")));
                    em.setNombres(request.getParameter("nombres"));
                    em.setApellidos(request.getParameter("apellidos"));
                    em.setCorreo(request.getParameter("correo"));
                    em.setContrasenya(request.getParameter("contra"));
                    em.setRol(request.getParameter("rol"));
                    resp = edao.actualizar(em);
                    response.setHeader("resp", resp);
                    response.sendRedirect("administrador/gestion_emp.jsp"); 
                }else if(request.getParameter("eliminar")!= null){
                     Empleado em = new Empleado();
                     String resp = null;
                     em.setIdEmpleado(Integer.parseInt(request.getParameter("txtID")));
                     resp = edao.eliminar(em);
                     response.setHeader("resp", resp);
                     response.sendRedirect("administrador/gestion_emp.jsp"); 
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
