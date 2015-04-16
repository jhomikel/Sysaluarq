/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlador;

import java.io.IOException;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PCVirtual
 * @see AuthFilter Clase que es implementada para autenticar y autorizar via requestdispatcher una sesiòn
 */

@WebFilter(filterName = "AuthFilter", urlPatterns = {"*.jsp"})
public class AuthFilter implements Filter {
    private static final Logger LOG = Logger.getLogger(AuthFilter.class.getName());
    
    public AuthFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    /**
     * 
     * @param request solicitud del servlet
     * @param response respuesta del servlet
     * @param chain autorización
     * @throws IOException Solicita el manejo de una Excepción de EntradaSalida IO.
     * @throws ServletException  Solicita el manejo de una Excepción del Servlet
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession ses = req.getSession(false);
            String reqUri = req.getRequestURI();
            if(reqUri.indexOf("/index.jsp") >= 0 || 
                    (ses != null && ses.getAttribute("username") != null) || 
                    reqUri.indexOf("/vendedores/") == 0)
                chain.doFilter(request, response);
            else
                res.sendRedirect(req.getContextPath()+"/index.jsp");
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
