
package clases;

import java.util.Date;


public class Registro {
    private int idRegistro;
    private String codEmpleado;
    private Date horaEntrada;
    private Date fechaIngreso;
    private String notasIngreso;
    private Date horaSalida;
    private Date fechaSalida;
    private String notaSalida;
   

    public Registro(int idRegistro, String codEmpleado, Date horaEntrada, 
            Date fechaIngreso, String notasIngreso,Date horaSalida,Date 
                    fechaSalida,String notaSalida
            ) {
        this.idRegistro = idRegistro;
        this.codEmpleado = codEmpleado;
        this.horaEntrada = horaEntrada;
        this.fechaIngreso = fechaIngreso;
        this.notasIngreso = notasIngreso;
        this.horaSalida=horaSalida;
        this.fechaSalida=fechaSalida;
        this.notaSalida=notaSalida;
       
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

    public Date getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(Date horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getNotasIngreso() {
        return notasIngreso;
    }

    public void setNotasIngreso(String notasIngreso) {
        this.notasIngreso = notasIngreso;
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

    public String getNotaSalida() {
        return notaSalida;
    }

    public void setNotaSalida(String notaSalida) {
        this.notaSalida = notaSalida;
    }
    
    
}
