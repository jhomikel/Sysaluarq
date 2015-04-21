/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import uml.Cliente;

/**
 *
 * @author Edgardo
 */
public class ClienteDAO implements OperacionesBD{
            /***
             * @autor Luis Melendez 
             * @version 1.0
             */
    private static final Logger LOG = Logger.getLogger(EmpleadoDAO.class.getName());
    ConnBD bd = new ConnBD();
    PreparedStatement pst;
    ResultSet rs;
    @Override
    public String insertar(Object obj) {
        String sql;
        String resp = null;
        Cliente clie = (Cliente) obj;
        try {
            bd.conectar();
            sql = "insert into Cliente values(?, ?, ?, ?, ?, ?, ?)";
            pst = bd.getConnection().prepareStatement(sql);
            pst.setInt(1, clie.getIdCliente());
            pst.setString(2, clie.getNombreCliente());
            pst.setString(3, clie.getAtencion());
            pst.setString(4, clie.getDireccion());
            pst.setString(5, clie.getTelefon());
            pst.setString(6, clie.getMovil());
            pst.setString(7, clie.getCorreo());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron ingresados con éxito";
            pst.close();
            bd.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
        
    }

    @Override
    public String actualizar(Object obj) {
        String sql;
        String resp = null;
        Cliente clie = (Cliente) obj;
        try {
            bd.conectar();
            sql = "update Cliente set nombreCliente = ?, atencion = ?, direccion = ?, telefono = ?, movil = ?, correo = ? where idCliente = ?";
            pst = bd.getConnection().prepareStatement(sql);
            pst.setString(1, clie.getNombreCliente());
            pst.setString(2, clie.getAtencion());
            pst.setString(3, clie.getDireccion());
            pst.setString(4, clie.getTelefon());
            pst.setString(5, clie.getMovil());
            pst.setString(6, clie.getCorreo());
            pst.setInt(7, clie.getIdCliente());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron actualizados con éxito";
            pst.close();
            bd.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
    }

    @Override
    public String eliminar(Object obj) {
        String sql;
        String resp = null;
        Cliente clie = (Cliente) obj;
        try {
            bd.conectar();
            sql = "delete from Cliente where idCliente = ?";
            pst = bd.getConnection().prepareStatement(sql);
            pst.setInt(1, clie.getIdCliente());
            int fila = pst.executeUpdate();
            resp = fila + " Registros fueron actualizados con éxito";
            pst.close();
            bd.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
    }
    /**
    *
    * @author Edgardo
    */
    @Override
    public List<Cliente> consultar() {
        List<Cliente> lst = new ArrayList();
        String sql = "SELECT * FROM Cliente";
        try {
            bd.conectar();
            pst = bd.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                lst.add(new Cliente(
                   rs.getInt("idCliente"),
                   rs.getString("nombreCliente"),
                   rs.getString("atencion"),
                   rs.getString("direccion"),
                   rs.getString("telefono"),
                   rs.getString("movil"),
                   rs.getString("correo")
                ));
            }
            pst.close();
            rs.close();
            bd.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return lst;
    }
    
}
