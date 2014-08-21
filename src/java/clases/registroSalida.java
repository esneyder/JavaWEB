/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.Date;


public class registroSalida {
    private int idRegistro;
    private String codEmpleado;
    private Date horaSalida;
    private Date fechaSalida;
    private String notasSalida;

    public registroSalida(int idRegistro, String codEmpleado, Date horaSalida, Date fechaSalida, String notasSalida) {
        this.idRegistro = idRegistro;
        this.codEmpleado = codEmpleado;
        this.horaSalida = horaSalida;
        this.fechaSalida = fechaSalida;
        this.notasSalida = notasSalida;
    }

    public int getIdRegistro() {
        return idRegistro;
    }

    public void setIdRegistro(int idRegistro) {
        this.idRegistro = idRegistro;
    }

    public String getCodEmpleado() {
        return codEmpleado;
    }

    public void setCodEmpleado(String codEmpleado) {
        this.codEmpleado = codEmpleado;
    }

    public Date getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Date horaSalida) {
        this.horaSalida = horaSalida;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getNotasSalida() {
        return notasSalida;
    }

    public void setNotasSalida(String notasSalida) {
        this.notasSalida = notasSalida;
    }
    
    
    
}
