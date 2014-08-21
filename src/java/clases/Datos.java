package clases;

import com.sun.xml.ws.rx.rm.protocol.wsrm200502.CreateSequenceElement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.kohsuke.rngom.digested.DEmptyPattern;

public class Datos {

    private Connection cnn;

    public Datos() {
        try {
            Class.forName("com.mysql.jdbc.Driver");//conxión 
            String db = "jdbc:mysql://localhost/softcon";
            cnn = DriverManager.getConnection(db, "root", "");
        } catch (Exception ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void cerrarConexion() {
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String validarUsuario(String usuario, String clave) {
        try {
            String sql = "select idPerfil from usuarios where "
                    + "idUsuario = '" + usuario + "' and "
                    + "clave = '" + clave + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getString("idPerfil");
            } else {
                return "nok";
            }
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return "nok";
        }
    }
    
    //consultar y validar usuario

    public Usuario getUsuario(String idUsuario) {
        try {
            Usuario miUsuario = null;
            String sql = "select * from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miUsuario = new Usuario(
                        rs.getString("idUsuario"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("clave"),
                        rs.getInt("idPerfil"),
                        rs.getString("foto"));
            }
            return miUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
   
    //consulta empleados para realizaer el regitro 
    
    
     public Registro getRegistros(String codEmpleado) {
        try {
            Registro miRegistro=null;
            
            String sql = "select * from usuarios where "
                    + "codEmpleado = '" + codEmpleado + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miRegistro = new Registro(
                        rs.getInt("idRegistro"),
                        rs.getString("codEmpleado"),
                        rs.getDate("horaEntrada"),
                        rs.getDate("fechaIngreso"),
                        rs.getString("notasIngreso"),   
                        rs.getDate("horaSalida"),
                        rs.getDate("fechaSalida"),
                        rs.getString("notaSalida")
                        );
            }
            return miRegistro;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    //consultar usuarios
    public Empleado getEmpleado(String codEmpleado){
    try{
    Empleado miEmpleado=null;
    String sql = "select * from empleado where "
                    + "codEmpleado = '" + codEmpleado + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
    if(rs.next()){       
        miEmpleado=new Empleado(
                rs.getString("codEmpleado"),
                rs.getString("nombre"),
                rs.getString("apellidos"),
                rs.getString("idDocumento"),
                rs.getString("documento"),
                rs.getString("idnacionalidad"),
                rs.getString("idCiudad"),
                rs.getDate("fechaNacimiento"),
                rs.getString("edad"),
                rs.getString("genero"),
                rs.getString("idFacultad"),
                rs.getString("idSemestre"),
                rs.getString("idPrograma"),
                rs.getString("idPlan"),
                rs.getString("email"),
                rs.getString("descripcion"),
                rs.getString("foto"),
                rs.getString("telefono"),                 
                rs.getString("direccion"));              
               
    }
    return miEmpleado;
        
    }catch(SQLException ex){
         Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        return null;
    }
    
    }
    //crear un nuevo usuario
    
        public void newUsuario(Usuario miUsuario) {
        try {
            String sql = "insert into usuarios values('"
                    + miUsuario.getIdUsuario() + "', '"
                    + miUsuario.getNombres() + "', '"
                    + miUsuario.getApellidos() + "', '"
                    + miUsuario.getClave() + "', "
                    + miUsuario.getIdPerfil() + ", '"
                    + miUsuario.getFoto() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
        ///registrar nuevo empleado
   public void newEmpleado(Empleado miEmpleado) {
        try {
            String sql;            
            sql = "insert into empleado values('"
             + miEmpleado.getCodEpleado()+ "', '"
             + miEmpleado.getNombres() + "', '"
             + miEmpleado.getApellidos() +"', '"
             + miEmpleado.getIdDocumento()+ "', '"
             + miEmpleado.getDocumento()   + "', '"
             + miEmpleado.getIdnacionalidad() + "', '"   
             + miEmpleado.getIdCiudad()+"', '"      
             + Utilidades.formatDate(miEmpleado.getFechaNacimiento()) + "', '"
             + miEmpleado.getEdad() + "', '"
             + miEmpleado.getGenero() + "', '"
             + miEmpleado.getIdFacultad()+"', '"
             + miEmpleado.getIdSemestre()+ "', '"
             + miEmpleado.getIdPrograma()+ "', '"
             + miEmpleado.getIdPlan()+", '"
             + miEmpleado.getEmail()+ "', '"
             + miEmpleado.getDescripcion()+ "', '"
             + miEmpleado.getFoto()+ "', '"                   
             + miEmpleado.getTelefono()+  "', '"                   
             +miEmpleado.getDireccion()+ "')";
            
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
   //actualizar datos de los empleados
   
    public void updateEmpleado(Empleado miEmpleado) {
        try {
            String sql = "update empleado set "
                        + "codEmpleado = '" + miEmpleado.getCodEpleado() + ", "
                        + "nombre = '" + miEmpleado.getNombres() + "', "
                        + "apellidos = '" + miEmpleado.getApellidos() + "', "
                        + "idDocumento = '" + miEmpleado.getIdDocumento() + "', "
                        + "documento= '" + miEmpleado.getDocumento() + "', "
                        + "idnacionalida = " + miEmpleado.getIdnacionalidad() + ", "
                        + "idCiudad = " + miEmpleado.getIdCiudad() + ", "
                        + "fechaNacimiento = '" + Utilidades.formatDate(miEmpleado.getFechaNacimiento()) + "', "
                        + "edad = '" + miEmpleado.getEdad() + "' "
                        + "genero = '" + miEmpleado.getGenero() + "' "
                        + "idFacultad = '" + miEmpleado.getIdFacultad() + "' "
                        + "idSemestre = '" + miEmpleado.getIdSemestre() + "' "
                        + "idPrograma = '" + miEmpleado.getIdPrograma() + "' "
                        + "idPlan = '" + miEmpleado.getIdPlan() + "' "
                        + "email = '" + miEmpleado.getEmail() + "' "
                        + "descripcion = '" + miEmpleado.getDescripcion() + "' "
                        + "foto = '" + miEmpleado.getFoto() + "' "
                        + "telefono = '" + miEmpleado.getTelefono() + "' "   
                        + "direccion = '" + miEmpleado.getDireccion() + "' "
                       + "where codEmpleado = '" + miEmpleado.getCodEpleado() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //elimianr empleados
     public void deleteEmpleados(String codEmpleado) {
        try {
            String sql = "delete from empleado where "
                    + "codEmpleado = '" + codEmpleado + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
     
     public Empleado getRegistroEmpleado(String codEmpleado){
         try {
            String sql = "select  codEmpleado, nombres,apellido, foto from empleado where "
                    + "codEmpleado = '" + codEmpleado + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
     }
    
   public ResultSet getEmpleados() {
        try {
            String sql = "select * from empleado";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
   }
    
        //datos generales de los empleados
        
          public ResultSet getvistaEmpleados() {
                try {
                            String sql = "select codEmpleado,nombre,apellidos,idDocumento,documento,"
                                    + "idFacultad,idPrograma,idPlan,descripcion,foto from empleado";
                            Statement st = cnn.createStatement();
                            return st.executeQuery(sql);
                        } catch (SQLException ex) {
                            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                            return null;
                            
        }
    }
          
          //consultar empleado para registrarle el ingreso
          
          //datos de contacto de los empleados
           public ResultSet getVistaContEmpleado(){
                try{
                    String sql="select codEmpleado,nombre,apellidos,idPrograma,idPlan,"
                            + "email,telefono,direccion,descripcion,foto from empleado";
                    Statement st=cnn.createStatement();
                    return st.executeQuery(sql);

                }catch(SQLException ex){
                   Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                             return null;
                }}
           
           //mostrar empleado consultado
           public ResultSet getRegistro(){
               try {
                        String sql = "select * from empleado";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
           }
  
          
          
   //metodo para crear un nuevo plan de trabajo
           
          public void newLabor(LaborPlan miLabor){
              try{
              String sql=" insert into labor values('"
                      + miLabor.getPlan() +"','"
                      + miLabor.getHorasLbor() + "','"
                      + miLabor.getHoraMes() +"','"
                      + miLabor.getHorasSemana() + "','"
                      + miLabor.getHorasDirias() + "','"
                      + miLabor.getHoraEntrada() + "','"
                      + miLabor.getHoraSalida() + "','"
                      + miLabor.getFechaInicio() + "','"
                      + miLabor.getFechaCulminacion() + "','"
                      + miLabor.getDescripcion()+"','"
                      + miLabor.getValorHora() + "')";
              
                        Statement st = cnn.createStatement();
                        st.executeUpdate(sql);
              }catch(SQLException ex){
              
              }
          }
          
          //consulta validar planes
          
           public LaborPlan getLabor(String plan) {
           try {
            LaborPlan miLabor = null;
            String sql = "select * from labor where "
                    + "plan ='" + plan + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miLabor = new LaborPlan(
                        rs.getString("plan"),
                        rs.getString("horasLabor"),
                        rs.getString("horasMes"),
                        rs.getString("horasSemana"),
                        rs.getString("horasDiarias"),
                        rs.getString("horaEntrada"),
                        rs.getString("horaSalida"),
                        rs.getString("fechaInicio"),
                        rs.getString("fechaCulminacion"),
                        rs.getString("descripcion"),
                        rs.getString("valorHora"));
                        }
            return miLabor;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
           //consulta par mostrar el en formulario del empleado
           //se consulta los planes para luego mostrar enun menu desplea¿gable...
           public ResultSet getPlan() {
                    try {
                        String sql = "select * from labor";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
    }
           //consulata para el tipo de documento
           public ResultSet getDocumento() {
                    try {
                        String sql = "select * from combo";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
                }
           
           ///registro de entrada
           public void newRegistro(Registro miRegistro){               
               try{
                   String sql="insert into registro values('"
                           +miRegistro.getIdRegistro() + ", '"
                           +miRegistro.getCodEmpleado()+"', '"
                           +miRegistro.getHoraEntrada()+"', '"
                           +miRegistro.getFechaIngreso()+"', '"
                           +miRegistro.getNotasIngreso()+"', '" 
                           +miRegistro.getHoraSalida()+ "', '"
                           +miRegistro.getFechaSalida()+"', '"
                           +miRegistro.getNotaSalida()+ "')"
                           ;
               
              Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
           }
           
           
           
           //consultar nacionalidad
           
            public ResultSet getNacionalidad() {
                    try {
                        String sql = "select * from combo";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
                }
            
            //consulta ciudad
               public ResultSet getCiudad() {
                    try {
                        String sql = "select * from combo";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
                }
               
               public ResultSet getGenero() {
                    try {
                        String sql = "select * from combo";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
                }
               
              //consulta programas academicos
                  
                  public ResultSet getPrograma() {
                    try {
                        String sql = "select * from combo";
                        Statement st = cnn.createStatement();
                        return st.executeQuery(sql);
                    } catch (SQLException ex) {
                        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                        return null;
                    }
                }
                  
                  
            
           
           
           
           //eliminar labor planes
                    public void deleteLabor(String plan){
                        try {
                           String sql = "delete from labor where "
                                   + "plan = '" + plan + "'";
                           Statement st = cnn.createStatement();
                           st.executeUpdate(sql);
                       } catch (SQLException ex) {
                           Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                }
    }
           
           
           //consulta de planes
           public ResultSet getVistaPlanes(){
               
                try{
                    String sql="select * from labor";
                    Statement st=cnn.createStatement();
                    return st.executeQuery(sql);
                }catch(SQLException ex){
                   Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
                    return null;
                }
           }
           
           //actualizar plan
    public void updatePlan(LaborPlan plan){
        try{
            String sql="update labor set"
                    +"plan='" + plan.getPlan() + "',"
                    +"horasLabor='" + plan.getHorasLbor() + "',"
                    +"horasMes='" + plan.getHoraMes() + "',"
                    +"horasSemana='" + plan.getHorasDirias() + "',"
                    +"horasDiarias='" + plan.getHorasDirias()+"',"
                    +"horaEntrada='"+plan.getHoraEntrada()+ "',"
                    +"horaSalida='"+plan.getHoraSalida()+"',"
                    +"fechaInicio='"+plan.getFechaInicio()+"',"
                    +"fechaCulminacion='"+plan.getFechaCulminacion()+"',"
                    +"descripcion='"+plan.getDescripcion()+"',"
                    +"valorHora='"+plan.getValorHora()+"'"
                    +"where plan='"+plan.getPlan()+"'";
         Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        }catch(SQLException ex){
          Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);}
        
    }
   
    //actilizar el la tabla registro con el registro de salida
    public void updateRegistroSalida(Registro miRegistro){
        try{
        String sql="update registro se"
                + "horaSalida='"+miRegistro.getHoraSalida()
                +"fechaSalida='"+miRegistro.getFechaSalida()
                +"where codEmpleado="+miRegistro.getCodEmpleado();
        Statement st=cnn.createStatement();
        st.executeUpdate(sql);
        }catch(SQLException ex){
        Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);}    
        
    }
          
    
    public ResultSet getregistrosLabor(){
         try {
            String sql = "SELECT idRegistro,codEmpleado,horaEntrada,fechaEntrada,"
                    + "notasEntrada,horaSalida,fechaSalida,notaSalida"
                
                    + " FROM registro";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    //mostrar los registro de salida de todos los empleados
     public ResultSet getHoras(){
         try {
            String sql = "SELECT idRegistro, codEmpleado, "
                    + "horaSalida, fechaSalida,"
                    + " notasSalida"
                    + " FROM registrosalida";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     
     
    
    
    
     public ResultSet getregistroEmpleados(){
         try {
            String sql = "select codEmpleado,nombre,apellidos,"
                    + "idPlan,horaEntrada,fechaIngreso,"
                    + "horaSalida,fechaSalida,foto from empleado,registro"
                    ;
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    //ver el registro de entrada del los empleados con los datos de cada uno
     
      public ResultSet getVerRegistroEmpleado(){
         try {
            String sql = "select codEmpleado,nombre,apellidos,"
                    + "idPlan,horaEntrada,fechaEntrada,"
                    +"from empleado e,registro r where"
                    + "e.codEmpleado=r.codEmpleado";
                    
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     
       //consultar departamentos
    public Departamento getDeoartamento(String codDeparatamento){
        try{
             Departamento miDepartamento=null;
            String sql = "select * from departamento where "
                    + "idDepartamento = '" + codDeparatamento + "'";
           
          Statement st=cnn.createStatement();
          ResultSet rs=st.executeQuery(sql);
          if(rs.next()){
              miDepartamento=new Departamento(
                      rs.getString("idDepartamento"),
                      rs.getString("plan"),
                      rs.getString("nombre"),
                      rs.getString("descripcion"));
          }
          return miDepartamento;
        }catch(SQLException ex){
          Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    //nuevo departamento
    public void newDepartamento(Departamento miDepartamento){
        try{
            String sql="insert into departamento values('"
                    + miDepartamento.getCodDepartamento() + ",'"
                    + miDepartamento.getPlan()+"', '"
                    +miDepartamento.getNombre()+"', '"
                    +miDepartamento.getDescripcion()+"')";
            Statement st=cnn.createStatement();
            st.executeUpdate(sql);
        }catch(SQLException ex){
              Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
   //eliminar registros departamento
     public void deleteDepartamento(String idDepartamento) {
        try {
            String sql = "delete from departamento where "
                    + "idDepartamento = '" + idDepartamento + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     //actualizar departamento
      public void updateDepartamento(Departamento miDepartamento) {
        try {
            String sql = "update departamento set "
                    + "plan = '" + miDepartamento.getCodDepartamento() + "', "
                    + "nombre= '" + miDepartamento.getNombre()+ "', "
                    + "descripcion = '" + miDepartamento.getDescripcion() + "', "
                    + "where idDepartamento = '" + miDepartamento.getCodDepartamento() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      ///listado general datos depaetamento
       public ResultSet getVerDepartamento() {
        try {
            String sql = "select * from departamento";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
       
       //mostra regstros de departamento
       
       public ResultSet getDeparta() {
        try {
            String sql = "select * from departamento";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
       //consulta validacion de area
    public Area getAreacon(String idArea){
        try{
        
        Area miArea=null;
        String sql="select * from area where"
                + "idArea='"+idArea+"'";
         Statement st=cnn.createStatement();
          ResultSet rs=st.executeQuery(sql);
          if(rs.next()){
              miArea=new Area(
                      rs.getString("idArea"),
                      rs.getString("idDepartamento"),
                      rs.getString("nombre"),
                      rs.getString("descripcion"));
          }
                  
                  
          return miArea;
        }catch(SQLException ex){
          Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
         
    }
     //nueva area
    public void newArea(Area miArea){
        try
        {
            String sql="insert into area values('"
                    + miArea.getIdArea()+"','"
                    +miArea.getIdDepartamento()+"','"
                    +miArea.getNombre()+"','"
                    +miArea.getDescripcion()+"')";            
          Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        }catch(SQLException ex){
         Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);}
    }
    
    //eliminar area
    public void deletearea(String idArea) {
        try {
            String sql = "delete from area where "
                    + "idArea = '" + idArea + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //ver regitros area
    public ResultSet getVerAreas() {
        try {
            String sql = "select * from area";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    
    //actualizar areas
     public void updateArea(Area miArea) {
        try {
            String sql = "update area set "
                    + "idDepartamento = '" + miArea.getIdDepartamento()+ "', "
                    + "nombre= '" + miArea.getNombre()+ "', "
                    + "descripcion = '" + miArea.getDescripcion() + "', "
                    + "where idArea = '" + miArea.getIdArea() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public void newCliente(Cliente miCliente) {
        try {
            String sql = "insert into clientes values('"
                    + miCliente.getIdCliente() + "', "
                    + miCliente.getIdTipo() + ", '"
                    + miCliente.getNombres() + "', '"
                    + miCliente.getApellidos() + "', '"
                    + miCliente.getDireccion() + "', '"
                    + miCliente.getTelefono() + "', "
                    + miCliente.getIdCiudad() + ", '"
                    + Utilidades.formatDate(miCliente.getFechaNacimiento()) + "', '"
                    + Utilidades.formatDate(miCliente.getFechaIngreso()) + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   
   

    public Cliente getCliente(String idCliente) {
        try {
            Cliente miCliente = null;
            String sql = "select * from clientes where "
                    + "idCliente = '" + idCliente + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miCliente = new Cliente(
                        rs.getString("idCliente"),
                        rs.getInt("idTipo"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getString("direccion"),
                        rs.getString("telefono"),
                        rs.getInt("idCiudad"),
                        rs.getDate("fechaNacimiento"),
                        rs.getDate("fechaIngreso"));
            }
            return miCliente;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    

    public ResultSet getUsuarios() {
        try {
            String sql = "select * from usuarios";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getResultSet(String sql) {
        try {
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getProductos() {
        try {
            String sql = "select * from productos";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    

    public ResultSet getDetalleFacturaTmp() {
        try {
            String sql = "select * from detalleFacturaTmp";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ResultSet getClientes() {
        try {
            String sql = "select * from clientes";
            Statement st = cnn.createStatement();
            return st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }



    public void newProducto(Producto miProducto) {
        try {
            String sql = "insert into productos values('"
                    + miProducto.getIdProducto() + "', '"
                    + miProducto.getDescripcion() + "', "
                    + miProducto.getPrecio() + ", "
                    + miProducto.getIdIva() + ", '"
                    + miProducto.getNotas() + "', '"
                    + miProducto.getFoto() + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  

    public void updateUsuario(Usuario miUsuario) {
        try {
            String sql = "update usuarios set "
                    + "nombres = '" + miUsuario.getNombres() + "', "
                    + "apellidos = '" + miUsuario.getApellidos() + "', "
                    + "clave = '" + miUsuario.getClave() + "', "
                    + "idPerfil = " + miUsuario.getIdPerfil() + ", "
                    + "foto = '" + miUsuario.getFoto() + "' "
                    + "where idUsuario = '" + miUsuario.getIdUsuario() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProducto(Producto miProducto) {
        try {
            String sql = "update productos set "
                    + "descripcion = '" + miProducto.getDescripcion() + "', "
                    + "precio = " + miProducto.getPrecio() + ", "
                    + "idIva = " + miProducto.getIdIva() + ", "
                    + "notas = '" + miProducto.getNotas() + "', "
                    + "foto = '" + miProducto.getFoto() + "' "
                    + "where idProducto = '" + miProducto.getIdProducto() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCliente(Cliente miCliente) {
        try {
            String sql = "update clientes set "
                    + "idTipo = " + miCliente.getIdTipo() + ", "
                    + "nombres = '" + miCliente.getNombres() + "', "
                    + "apellidos = '" + miCliente.getApellidos() + "', "
                    + "direccion = '" + miCliente.getDireccion() + "', "
                    + "telefono = '" + miCliente.getTelefono() + "', "
                    + "idCiudad = " + miCliente.getIdCiudad() + ", "
                    + "fechaNacimiento = '" + Utilidades.formatDate(miCliente.getFechaNacimiento()) + "', "
                    + "fechaIngreso = '" + Utilidades.formatDate(miCliente.getFechaIngreso()) + "' "
                    + "where idCliente = '" + miCliente.getIdCliente() + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUsuario(String idUsuario) {
        try {
            String sql = "delete from usuarios where "
                    + "idUsuario = '" + idUsuario + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProducto(String idProducto) {
        try {
            String sql = "delete from productos where "
                    + "idProducto = '" + idProducto + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
   
    
    public void deleteDetalleFacturaTmp(String idProducto) {
        try {
            String sql = "delete from detalleFacturaTmp where "
                    + "idProducto = '" + idProducto + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteDetalleFacturaTmp() {
        try {
            String sql = "delete from detalleFacturaTmp";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteCliente(String idCliente) {
        try {
            String sql = "delete from clientes where "
                    + "idCliente = '" + idCliente + "'";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalCantidad() {
        try {
            int total = 0;
            String sql = "select sum(cantidad) as suma from detalleFacturaTmp";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("suma");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public int getTotalValor() {
        try {
            int total = 0;
            String sql = "select sum(cantidad * precio) as suma "
                    + "from detalleFacturaTmp";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("suma");
            }
            return total;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }

    public void newDetalleFacturaTmp(DetalleFacturaTmp miDetalle) {
        try {
            // Identificamo si el producto ya hace parte del detalle
            String sql = "select (1) from detalleFacturaTmp "
                    + "where idProducto = '" + miDetalle.getIdProducto() + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                // Si hay detalle, se actualiza la cantidad
                sql = "update detalleFacturaTmp set "
                        + "cantidad = cantidad + " + miDetalle.getCantidad() + " "
                        + "where idProducto = '" + miDetalle.getIdProducto() + "'";
            } else {
                // No existia en el detalle, se ingresa nuevo
                sql = "insert into detalleFacturaTmp values('"
                        + miDetalle.getIdProducto() + "', '"
                        + miDetalle.getDescripcion() + "', "
                        + miDetalle.getPrecio() + ", "
                        + miDetalle.getCantidad() + ")";
            }
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int siguienteFactura() {
        try {
            int aux = 1;
            String sql = "select max(idFactura) as num from factura";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                aux = rs.getInt("num") + 1;
            }
            return aux;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }
 public Producto getProducto(String idProducto) {
        try {
            Producto miProducto = null;
            String sql = "select * from productos where "
                    + "idProducto = '" + idProducto + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miProducto = new Producto(
                        rs.getString("idProducto"),
                        rs.getString("descripcion"),
                        rs.getInt("precio"),
                        rs.getInt("idIva"),
                        rs.getString("notas"),
                        rs.getString("foto"));
            }
            return miProducto;
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public void newFactura(int idFactura, String idCliente, Date fecha) {
        try {
            String sql = "insert into factura values("
                    + idFactura + ", '"
                    + idCliente + "', '"
                    + Utilidades.formatDate(fecha) + "')";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void newDetalleFactura(int idFactura, int idLinea, String idProducto,
            String descripcion, int precio, int cantidad) {
        try {
            String sql = "insert into detalleFactura values("
                    + idFactura + ", "
                    + idLinea + ", '"
                    + idProducto + "', '"
                    + descripcion + "', "
                    + precio + ", "
                    + cantidad + ")";
            Statement st = cnn.createStatement();
            st.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
