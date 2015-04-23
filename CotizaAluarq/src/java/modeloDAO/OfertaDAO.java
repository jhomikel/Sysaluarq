/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import uml.Cliente;
import uml.Empleado;
import uml.Oferta;

/**
 *
 * @author Edgardo
 */
public class OfertaDAO implements OperacionesBD{
    ConnBD bd = new ConnBD();
    PreparedStatement pst;
    ResultSet rs;
    private static final Logger LOG = Logger.getLogger(OfertaDAO.class.getName());
    @Override
    public String insertar(Object obj) {
        String resp = "";
        String sql = "INSERT INTO Oferta VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Oferta o = (Oferta) obj;
        try {
            bd.conectar();
            pst = bd.getConnection().prepareCall(sql);
            pst.setString(1, o.getNumCotizacion());
            pst.setInt(2, o.getIdCliente().getIdCliente());
            pst.setInt(3, o.getIdEmpleado().getIdEmpleado());
            pst.setDate(4, new java.sql.Date(o.getFecha().getTime()));
            pst.setString(5, o.getProyecto());
            pst.setString(6, o.getCondicionPago());
            pst.setString(7, o.getValidez());
            pst.setDouble(8, o.getFactorGanancia());
            pst.setInt(9, o.getEnProceso());
            pst.setInt(10, o.getTerminada());
            pst.setInt(11, o.getAprobada());
            pst.setInt(12, o.getEnviada());
            resp = String.valueOf(pst.executeUpdate())+ " registro insertado";
            pst.close();
            bd.desconectar();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        return resp;
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
