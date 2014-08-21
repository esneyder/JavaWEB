/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.Date;

/**
 *
 * @author Esneyder
 */
public class Empleado {
    private String codEpleado;
    private String nombres;
    private String apellidos;
    private String idDocumento;
    private String documento;
    private String idnacionalidad;
    private String idCiudad;
    private Date fechaNacimiento;
    private String edad;
    private String genero;
    private String idFacultad;
    private String idSemestre;
    private String idPrograma;
    private String idPlan;
    private String email;
    private String descripcion;
    private String foto;
    private String telefono;
    private String direccion;

    public Empleado(String codEpleado, String nombres, String
            apellidos, String idDocumento,
            String documento, String idnacionalidad, String idCiudad, Date  
                    fechaNacimiento, String edad, String genero, String idFacultad,
                    String idSemestre, String idPrograma, String idPlan,
                    String email, String descripcion,String foto,String telefono,String direccion) {
        
        
        
                        this.codEpleado = codEpleado;
                        this.nombres = nombres;
                        this.apellidos = apellidos;
                        this.idDocumento = idDocumento;
                        this.documento = documento;
                        this.idnacionalidad = idnacionalidad;
                        this.idCiudad = idCiudad;
                        this.fechaNacimiento = fechaNacimiento;
                        this.edad = edad;
                        this.genero = genero;
                        this.idFacultad = idFacultad;
                        this.idSemestre = idSemestre;
                        this.idPrograma = idPrograma;
                        this.idPlan = idPlan;
                        this.email = email;
                        this.descripcion = descripcion;
                        this.foto = foto;
                        this.telefono=telefono;
                        this.direccion=direccion;
    }

   
  
    public String getCodEpleado() {
        return codEpleado;
    }

    public void setCodEpleado(String codEpleado) {
        this.codEpleado = codEpleado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(String idDocumento) {
        this.idDocumento = idDocumento;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getIdnacionalidad() {
        return idnacionalidad;
    }

    public void setIdnacionalidad(String idnacionalidad) {
        this.idnacionalidad = idnacionalidad;
    }

    public String getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(String idCiudad) {
        this.idCiudad = idCiudad;
    }

    public Date  getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date  fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getIdFacultad() {
        return idFacultad;
    }

    public void setIdFacultad(String idFacultad) {
        this.idFacultad = idFacultad;
    }

    public String getIdSemestre() {
        return idSemestre;
    }

    public void setIdSemestre(String idSemestre) {
        this.idSemestre = idSemestre;
    }

    public String getIdPrograma() {
        return idPrograma;
    }

    public void setIdPrograma(String idPrograma) {
        this.idPrograma = idPrograma;
    }

    public String getIdPlan() {
        return idPlan;
    }

    public void setIdPlan(String idPlan) {
        this.idPlan = idPlan;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
}
