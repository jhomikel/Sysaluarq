/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import org.junit.Test;
import static org.junit.Assert.*;
import uml.Cliente;
import uml.Empleado;
import uml.Oferta;

/**
 *
 * @author Edgardo
 */
public class OfertaDAOTest {
    
    public OfertaDAOTest() {
    }
    OfertaDAO odao = new OfertaDAO();
    private static final Logger LOG = Logger.getLogger(OfertaDAO.class.getName());
    
    @Test
    public void testInsertar() throws ParseException{
        Cliente c = new Cliente(1);
        Empleado e = new Empleado(1);
        DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date fecha = formatter.parse("12-12-2012");
        try {
            Oferta o = new Oferta("AMX-12", c, e, fecha, "Construccion", "50 porciento", "10 meses", 2.1, 1, 0, 0, 0);
            System.out.println(odao.insertar(o));
        } catch (Exception ex) {
            LOG.severe(ex.toString());
        }
        
    }
    
    @Test
    public void testConsultar() {
        try{
            List<Oferta> lst = odao.consultarTipo("enProceso");
            for (Oferta o : lst) {
                System.out.println(o.getNumCotizacion());
            }
            System.out.println(lst.size());
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
