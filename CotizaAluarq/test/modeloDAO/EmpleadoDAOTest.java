/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author PCVirtual
 */
public class EmpleadoDAOTest {
    
    public EmpleadoDAOTest() {
    }

    @Test
    public void testSomeMethod() {
        EmpleadoDAO edao = new EmpleadoDAO();
        if(edao.validarUs("jhomikel@gmail.com", "aluarq1234")){
            System.out.println(edao.getEmpleado());
        } else {
            System.out.println("Usuario o contraseña incorrectos");
        }
    }
    
}
