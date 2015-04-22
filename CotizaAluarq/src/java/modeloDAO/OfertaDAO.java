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
import uml.Empleado;
import uml.Oferta;

/**
 *
 * @author Edgardo
 */
public class OfertaDAO implements OperacionesBD{
    ConnBD bd = new ConnBD();
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
    public List<Oferta> consultar() {
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM Oferta";
        List<Oferta> lst = new ArrayList();
        try {
            bd.conectar();
            pst = bd.getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado(rs.getInt("idEmpleado"));
                Cliente c = new Cliente(rs.getInt("idCliente"));
                lst.add(new Oferta(
                        rs.getString("numCotizacion"),
                        c,
                        e,
                        rs.getDate("fecha"),
                        rs.getString("proyecto"),
                        rs.getString("condicionPago"),
                        rs.getString("validez"),
                        rs.getDouble("factorGanancia"),
                        rs.getInt("enProceso"),
                        rs.getInt("terminada"),
                        rs.getInt("aprobada"),
                        rs.getInt("enviada")
                ));
            pst.close();
            rs.close();
            bd.desconectar();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }
    
}
