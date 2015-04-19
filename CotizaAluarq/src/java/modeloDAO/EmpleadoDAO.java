/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import uml.Empleado;

/**
 *
 * @author PCVirtual
 */
public class EmpleadoDAO implements OperacionesBD{
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
            sql = "select * from Empleado where correo = ? and contrasenya = ?";
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
    /**
     * @autor Angel Vargas
     * @version 1.0
     */
    @Override
    public String insertar(Object obj) {
        String sql;
        String resp = null;
        Empleado emp = (Empleado) obj;
        try {
            conn.conectar();
            sql = "insert into Empleado values(?, ?, ?, ?, ?, ?)";
            pst = conn.getConnection().prepareStatement(sql);
            pst.setInt(1, emp.getIdEmpleado());
            pst.setString(2, emp.getNombres());
            pst.setString(3, emp.getApellidos());
            pst.setString(4, emp.getCorreo());
            pst.setString(5, emp.getContrasenya());
            pst.setString(6, emp.getRol());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron ingresados con éxito";
            pst.close();
            conn.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
    }

    @Override
    public String actualizar(Object obj) {
        String sql;
        String resp = null;
        Empleado emp = (Empleado) obj;
        try {
            conn.conectar();
            sql = "update Empleado set nombres = ?, apellidos = ?, correo = ?, contrasenya = ?, rol = ? where idEmpleado = ?";
            pst = conn.getConnection().prepareStatement(sql);
            pst.setString(1, emp.getNombres());
            pst.setString(2, emp.getApellidos());
            pst.setString(3, emp.getCorreo());
            pst.setString(4, emp.getContrasenya());
            pst.setString(5, emp.getRol());
            pst.setInt(6, emp.getIdEmpleado());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron actualizados con éxito";
            pst.close();
            conn.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
    }

    @Override
    public String eliminar(Object obj) {
        String sql;
        String resp = null;
        Empleado emp = (Empleado) obj;
        try {
            conn.conectar();
            sql = "delete from empleado where idEmpleado = ?";
            pst = conn.getConnection().prepareStatement(sql);
            pst.setInt(1, emp.getIdEmpleado());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron actualizados con éxito";
            pst.close();
            conn.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
    }

    @Override
    public List<Empleado> consultar() {
        String sql;
        List<Empleado> lst = new ArrayList();
        try {
            conn.conectar();
            sql = "select * from Empleado";
            pst = conn.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                lst.add(new Empleado(
                        rs.getInt("idEmpleado"), 
                        rs.getString("nombres"), 
                        rs.getString("apellidos"), 
                        rs.getString("correo"), 
                        rs.getString("contrasenya"), 
                        rs.getString("rol")));
            }
            pst.close();
            rs.close();
            conn.desconectar();
        } catch (Exception e) {
           LOG.severe(e.toString());
        }
        return lst;
    }
    
    
}
