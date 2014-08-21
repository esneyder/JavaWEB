/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Esneyder
 */
public class LaborPlan {
    
    private String plan;
    private String horasLabor;
    private String horasMes;
    private String horasSemana;
    private String horasDiarias;   
    private String horaEntrada;
    private String horaSalida;
    private String fechaInicio;
    private String fechaCulminacion;
    private String descripcion;
    private String valorHora;

    public LaborPlan(String plan, String horasLabor, String horasMes, 
            String horasSemana, String horasDiarias, String horaEntrada, 
            String horaSalida,String fechaInicio, String fechaCulminacion,
            String descripcion,String valorHora) {
        this.plan = plan;
        this.horasLabor = horasLabor;
        this.horasMes = horasMes;
        this.horasSemana = horasSemana;
        this.horasDiarias = horasDiarias;
        this.horaEntrada = horaEntrada;
        this.horaSalida = horaSalida;
        this.fechaInicio=fechaInicio;
        this.fechaCulminacion = fechaCulminacion;
        this.descripcion = descripcion;
        this.valorHora=valorHora;
    }
    
    
    //los get and set
    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getHorasLbor() {
        return horasLabor;
    }

    public void setHorasLbor(String horasLabor) {
        this.horasLabor = horasLabor;
    }

    public String getHoraMes() {
        return horasMes;
    }

    public void setHoraMes(String horasMes) {
        this.horasMes = horasMes;
    }

    public String getHorasSemana() {
        return horasSemana;
    }

    public void setHorasSemana(String horasSemana) {
        this.horasSemana = horasSemana;
    }

    public String getHorasDirias() {
        return horasDiarias;
    }

    public void setHorasDirias(String horasDiarias) {
        this.horasDiarias = horasDiarias;
    }

    public String getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(String horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaCulminacion() {
        return fechaCulminacion;
    }

    public void setFechaCulminacion(String fechaCulminacion) {
        this.fechaCulminacion = fechaCulminacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getValorHora() {
        return valorHora;
    }

    public void setValorHora(String valorHora) {
        this.valorHora = valorHora;
    }
    
    
    
    
    
    
}
