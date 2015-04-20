/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.util.List;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import uml.Cliente;

/**
 *
 * @author Edgardo
 */
public class ClienteDAOTest {
    
    public ClienteDAOTest() {
        
    }
    /**
     * Se crea un objeto que contiene la informacion de cada uno de los clientes
     */
    @Test
    public void testConsulta(){
        try {
          ClienteDAO cdao = new ClienteDAO();
            List<Cliente> lst = cdao.consultar();
            for (Cliente c : lst) {
                System.out.println(c.getIdCliente() +"\t"+ c.getNombreCliente());

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
