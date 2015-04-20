/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import uml.Cliente;

/**
 *
 * @author Edgardo
 */
public class ClienteDAO implements OperacionesBD{
    ConnBD bd = new ConnBD();
    PreparedStatement pst;
    ResultSet rs;
    @Override
    public String insertar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String actualizar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String eliminar(Object obj) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

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
            e.printStackTrace();
        }
        return lst;
    }
    
}
