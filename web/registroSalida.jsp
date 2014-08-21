<%-- 
    Document   : registroSalida
    Created on : 22/10/2013, 03:44:12 PM
    Author     : Esneyder
--%>

<%@page import="java.util.Date"%>
<%@page import="clases.Utilidades"%>
<%@page import="clases.Usuario"%>
<%@page import="clases.Registro"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="clases.Empleado"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
                 <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                 <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Softcon | Registro salida</title>
         <script>
            $(document).ready(function() {
                // Para colocar efecto a los botones
                $("input:submit").button();
            });
        </script>
       <script>
                $(document).ready(function() {
                    $("#consultar").click(function() {
                        return validarUsuario();
                    });

                  

                   
                });
            
               
            
                function validarUsuario() {
                    if($("#codEmpleado").val() == "") {
                        $("<div></div>").html("Debe ingresar un ID de usuario").
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
    </head>
    <body>
        
          <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
        %>
        <%
        String codEmpleado="";
         int idRegistro=0;
         String horaEntrada="";
         String fechaIngreso="";
         String notasIngreso="";
         String horaSalida=""; 
         String fechaSalida="";
         String notaSalida="";
        String mensaje="";
        String cod="";
        
        Datos misDatos=new Datos();
            ResultSet regi=misDatos.getRegistro();
              
          boolean consultar = false;
         if (request.getParameter("consultar") != null) {
                consultar = true;
            }
       
          if (request.getParameter("codEmpleado") != null) {
                codEmpleado = request.getParameter("codEmpleado");
            }
          boolean limpiar=false;
          if(request.getParameter("limpiar")!=null)
          {
              limpiar=true;
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
               mensaje="La consulta no fue encontrada!!..";
            
              }else{
               ResultSet rs=misDatos.getvistaEmpleados();
               while(rs.next()){
                  cod=rs.getString("CodEmpleado");
               }
              
               Registro miRegistro=new Registro(
                       idRegistro,
                       codEmpleado, 
                       Utilidades.stringToDate(horaEntrada),
                       Utilidades.stringToDate(fechaIngreso),
                       notasIngreso, 
                       new Date(),
                       new Date(),
                       notaSalida);
               mensaje="Bienvenido!!";
               
               }
           misDatos.cerrarConexion();
           
          }
        %>
        <div id="micontenido" style="display:none;">
        <div class="control-group">
            <div id="w">
                <form class="form-horizontal" action="registroSalida.jsp" name="salida" id="salida" method="POST">
                     <img src="img/softcon.png" alt="" />
             <br>
                    <h1>Registro salida</h1>
                    
                    <br>
             <div class="control-group">
                 <div class="row">
                 <label for="name" class="control-label">Codigo <span class="req"> *</span></label>
                 <div class="controls">
                     <input name="codEmpleado" id="codEmpleado" class="txt" type="text" value="<%=codEmpleado%>" required=""><br>
                    
                 </div>
                 </div>
             </div>
                     <center>
                                   <h2><%=mensaje%></h2>
                     </center>   
            <center>
                <input type="submit" value="Registrar salida" name="consultar" id="consultar"  class="btn btn-primary"/>
                <input type="submit" value="Limpiar" name="limpiar" id="limpiar" class="btn-success">
            </center>
            <br>
                    
                <%--pie de pagina--%>
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
