/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author jhomikel
 * @version 1.0
 * Clase para gestionar la conexión de la base de datos.
 */
public class ConnBD {
    Connection connection;
   
    public ConnBD() {
          connection = null;  
    }
    
    /**
     * @autor Jhomikel
     * @version 1.0
     * @exception SQLExcetion para detectar un error en la conexión a la base de datos
     * @exception ClassNotFoundException para verificar que error en el driver
     * @exception Exception para verificar otro tipo de error.
     */
    public void conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/aluarqbd", 
                    "root", 
                    "eg98003");
        } catch (SQLException e) {
            
        } catch (ClassNotFoundException e){
            
        } catch (Exception e){
            
        }
    }
    
    public void desconectar(){
        connection = null;
    }
}
