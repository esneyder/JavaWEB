<%-- 
    Document   : RegistroEntrada
    Created on : 6/10/2013, 05:28:59 PM
    Author     : Esneyder
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="clases.Utilidades"%>
<%@page import="clases.Registro"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Usuario"%>
<%@page import="clases.Empleado"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
                 <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                  <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Softcon | Sistema Control de Personal</title>
    </head>
    <body>
       
        
        
         <script>
                $(document).ready(function() {
                    
                    $("#consultar").click(function() {
                        return validarEmpleado();
                    });

                });
                           
            
                 function validarEmpleado() {
                if($("#codEmpleado").val() == "") {
                    $("<div></div>").html("Debe ingresar un ID del empleado").
                        dialog({title:"Error de Validación", modal: true, buttons: [
                            {
                                text:"Ok",
                                click:function(){$(this).dialog("close");}
                            }
                        ]
                    });
                    return false;
                }
                return true;
            }

               
                
            </script>
        
         <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
            
            String mensaje="";
            String cod="";
            String nombre="";
            String foto="";
            Datos misDatos=new Datos();
            ResultSet regi=misDatos.getRegistro();
              
          boolean consultar = false;
         if (request.getParameter("consultar") != null) {
                consultar = true;
            }
         boolean limpiar=false;
         if(request.getParameter("limpiar")!=null){
             limpiar=true;
         }
         String codEmpleado="";
         int idRegistro=0;
         String horaEntrada="";
         String fechaIngreso="";
         String notasIngreso="";
         String horaSalida=""; 
         String fechaSalida="";
         String notaSalida="";
         
          if (request.getParameter("codEmpleado") != null) {
                codEmpleado = request.getParameter("codEmpleado");
            }
          
          //identifico la accion que realizo
          // en este caso seria la de conslatar su codigo para registrar su ingreso
          
          if(limpiar){
              codEmpleado="";
          }
          if(consultar){
            Empleado miEmpleado=misDatos.getEmpleado(codEmpleado);
            
           if(miEmpleado==null){
               codEmpleado="";
               mensaje="Lo sentimos!. Su solicitud no a sido encontrada";
            
              }else{
               ResultSet rs=misDatos.getvistaEmpleados();
               
               while(rs.next()){
               cod=rs.getString("codEmpleado");
                nombre=rs.getString("nombre");
                foto=rs.getString("foto");
               }
               mensaje="Bienvenido! Su su registro fue exitoso";
                 
               Registro miRegistro=new Registro(
                       new Integer(idRegistro),
                       codEmpleado,
                       new Date(),
                       new Date(), 
                       notasIngreso,
                       Utilidades.stringToDate(horaSalida), 
                       Utilidades.stringToDate(fechaSalida),
                       notaSalida);
               misDatos.newRegistro(miRegistro);
               
               }
           misDatos.cerrarConexion();
           
          }
        %>
        <div id="micontenido" style="display:none;">
        <div class="control-group">
        <div id="w">
            <form class="form-horizontal" name="regEntrada" id="regEntrada" action="RegistroEntrada.jsp"
                  method="POST">
               
             <img src="img/softcon.png" alt="" />
             <br>
                     <h1>Registro de entrada</h1>

                    
                     <br>
             <%--campo para solicitar el codigo del empleado --%>
             
             <div class="control-group">
                 <div class="row">
                 <label for="name" class="control-label">Codigo <span class="req"> *</span></label>
                 <div class="controls">
                     <input name="codEmpleado" id="codEmpleado" class="txt" type="text" value="<%=codEmpleado%>" required="">                   
                     
                         
                 </div>
                 </div>
             </div>
             
                 <center>
            <h2><%=mensaje%></h2>
                 </center>
                     
                
            <center>
                <input type="submit" value="Registrar" name="consultar" id="consultar" class="btn-primary" />
                <input name="limpiar" id="limpiar" class="btn-success" value="Limpiar" type="submit"> 
             </center>
            <br>
            <hr>
            <center>
            <a href="javascript:history.back(1)">Regresar a la página anterior</a><br>
        <%
            if (miUsuarioLogueado.getIdPerfil() == 1) {
        %>
        <a href="Principal.jsp">Regresar al menú</a>
        <%        } else {
        %>
        <a href="MenuEmp.jsp">Regresar al menú</a>
        <%            }
        %>
           </center>
         <footer>
         <p>&copy; Softcon 2013</p>
       </footer>
            
    	</form>
          
        </div>
        </div>
        </div>
           <script type="text/javascript">
$(document).ready(function(){
  $(document).ready(function () {
    $('#micontenido').fadeIn(1200);
  });
});
</script>
    </body>
</html>
