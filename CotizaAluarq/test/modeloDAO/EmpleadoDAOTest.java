/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import org.junit.Test;
import static org.junit.Assert.*;
import uml.Empleado;

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
    /***
     * @autor Angel Vargas
     */
    @Test
    public void testInsert() {
        EmpleadoDAO edao = new EmpleadoDAO();
        Empleado em = new Empleado();
        try {
            em.setIdEmpleado(4);
            em.setNombres("Angel Vargas");
            em.setApellidos("Vargas Hernandez");
            em.setCorreo("vargas080994@gmail.com");
            em.setContrasenya("aluarq123");
            em.setRol("vendedor");
            String msj = edao.insertar(em);
            System.out.println(msj);
        } catch (Exception e) {
        }
    }
}
