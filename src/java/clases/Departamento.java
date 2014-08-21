/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Esneyder
 */
public class Departamento {
    private String codDepartamento;
    private String plan;
    private String nombre;
    private String descripcion;

    public Departamento(String codDepartamento, String plan, String nombre, String descripcion) {
        this.codDepartamento = codDepartamento;
        this.plan = plan;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public String getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(String codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
