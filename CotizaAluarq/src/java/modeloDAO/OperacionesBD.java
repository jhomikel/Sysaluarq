/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import java.util.List;

/**
 *
 * @autor Angel
 * @version 1.0
 * Interface para ser implementada en las clases, define los metodos que las clases deben tener
 */
public interface OperacionesBD {
    public String insertar(Object obj);
    public String actualizar(Object obj);
    public String eliminar(Object obj);
    public List<?>consultar();
}
