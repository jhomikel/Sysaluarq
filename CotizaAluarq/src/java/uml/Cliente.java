/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uml;

/**
 *
 * @author PCVirtual
 */
public class Cliente {
    private int idCliente;
    private String nombreCliente, atencion, direccion, telefon, movil, correo;

    public Cliente() {
    }
    
    public Cliente(int idCliente){
        this.idCliente = idCliente;
    }

    public Cliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }
    
    
    public Cliente(int idCliente, String nombreCliente, String atencion, String direccion, String telefon, String movil, String correo) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.atencion = atencion;
        this.direccion = direccion;
        this.telefon = telefon;
        this.movil = movil;
        this.correo = correo;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getAtencion() {
        return atencion;
    }

    public void setAtencion(String atencion) {
        this.atencion = atencion;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getMovil() {
        return movil;
    }

    public void setMovil(String movil) {
        this.movil = movil;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
    
    
}
