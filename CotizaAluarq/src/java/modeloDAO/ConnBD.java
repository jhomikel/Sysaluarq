/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 *
 * @author jhomikel
 * @version 1.0
 * Clase para gestionar la conexión de la base de datos.
 */
public class ConnBD {
    private static final Logger LOG = Logger.getLogger(ConnBD.class.getName());
    private Connection connection;
   
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
                    "jdbc:mysql://localhost:3306/AluarqBD", 
                    "root", 
                    "eg98003");
            LOG.info("Se ha creado exitosamente la conexión a la Base de Datos");
        } catch (SQLException e) {
            LOG.severe(e.toString());
        } catch (ClassNotFoundException e){
            LOG.severe(e.toString());
        } catch (Exception e){
            LOG.severe(e.toString());
        }
    }
    
    public void desconectar(){
        try {
            connection.close();
        } catch (Exception e) {
            LOG.severe(e.toString());
        }
        
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }
}
