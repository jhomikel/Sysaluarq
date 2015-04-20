/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uml;

import java.util.Date;

/**
 *
 * @author PCVirtual
 */
public class Oferta {
    private String numCotizacion;
    private Cliente idCliente;
    private Empleado idEmpleado;
    private Date fecha;
    private String proyecto;
    private String condicionPago;
    private String validez;
    private double factorGanancia;
    private int enProceso;
    private int terminada;
    private int aprobada;
    private int enviada;

    public Oferta() {
    }

    public Oferta(String numCotizacion, Cliente idCliente, Empleado idEmpleado, Date fecha, String proyecto, String condicionPago, String validez, double factorGanancia, int enProceso, int terminada, int aprobada, int enviada) {
        this.numCotizacion = numCotizacion;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.fecha = fecha;
        this.proyecto = proyecto;
        this.condicionPago = condicionPago;
        this.validez = validez;
        this.factorGanancia = factorGanancia;
        this.enProceso = enProceso;
        this.terminada = terminada;
        this.aprobada = aprobada;
        this.enviada = enviada;
    }

    public int getEnviada() {
        return enviada;
    }

    public void setEnviada(int enviada) {
        this.enviada = enviada;
    }

    public String getNumCotizacion() {
        return numCotizacion;
    }

    public void setNumCotizacion(String numCotizacion) {
        this.numCotizacion = numCotizacion;
    }

    public Cliente getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Cliente idCliente) {
        this.idCliente = idCliente;
    }

    public Empleado getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(Empleado idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getProyecto() {
        return proyecto;
    }

    public void setProyecto(String proyecto) {
        this.proyecto = proyecto;
    }

    public String getCondicionPago() {
        return condicionPago;
    }

    public void setCondicionPago(String condicionPago) {
        this.condicionPago = condicionPago;
    }

    public String getValidez() {
        return validez;
    }

    public void setValidez(String validez) {
        this.validez = validez;
    }

    public double getFactorGanancia() {
        return factorGanancia;
    }

    public void setFactorGanancia(double factorGanancia) {
        this.factorGanancia = factorGanancia;
    }

    public int getEnProceso() {
        return enProceso;
    }

    public void setEnProceso(int enProceso) {
        this.enProceso = enProceso;
    }

    public int getTerminada() {
        return terminada;
    }

    public void setTerminada(int terminada) {
        this.terminada = terminada;
    }

    public int getAprobada() {
        return aprobada;
    }

    public void setAprobada(int aprobada) {
        this.aprobada = aprobada;
    }
    
    
    
}
