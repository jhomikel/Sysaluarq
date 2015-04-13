/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modeloDAO;

/**
 *
 * @author jhomikel
 * @version 1.0
 * Clase para gestionar la conexión de la base de datos.
 */
public class ConnBD {
    private String url;
    private String driver;
    private String us;
    private String psw;

    /**
     * @autor edgardo
     * @
     */
    public ConnBD() {
        this.url = "jdbc://localhost:3306/AluarqBD";
        this.driver = "com.mysql.Jdbc.driver";
        this.us = "root";
        this.psw = "eg98003";
    }
    
    public void prueba() throws Exception{
        
    }

    public String getUrl() {
        return url;
    }

    public String getDriver() {
        return driver;
    }

    public String getUs() {
        return us;
    }

    public String getPsw() {
        return psw;
    }
    
}
