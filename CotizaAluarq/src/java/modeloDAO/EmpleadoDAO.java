/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;
import uml.Empleado;

/**
 *
 * @author PCVirtual
 */
public class EmpleadoDAO {
    private static final Logger LOG = Logger.getLogger(EmpleadoDAO.class.getName());
    ConnBD conn;
    PreparedStatement pst;
    ResultSet rs;
    private Empleado empleado;

    public EmpleadoDAO() {
        conn = new ConnBD();  
    }
    
    public boolean validarUs(String us, String psw) {
        boolean bandera = false;
        String sql;
        try {
            conn.conectar();
            sql = "select * from empleado where correo = ? and contrasenya = ?";
            pst = conn.getConnection().prepareStatement(sql);
            pst.setString(1, us);
            pst.setString(2, psw);
            rs = pst.executeQuery();
            while (rs.next()) {
                empleado = new Empleado(
                        rs.getInt("idEmpleado"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("correo"),
                        rs.getString("contrasenya"),
                        rs.getString("rol"));
            }
            LOG.info(empleado.toString());
            bandera = true;
            rs.close();
            pst.close();
            conn.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return bandera;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }
    
    
}
