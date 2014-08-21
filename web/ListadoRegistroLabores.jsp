<%-- 
    Document   : ListadoRegistroLabores
    Created on : 23/10/2013, 06:26:23 PM
    Author     : Esneyder
--%>

<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
         <link rel="stylesheet" type="text/css" href="style.css">
        <title>Softcon | Listado registro salida</title>
    </head>
    <body>
        <div id="micontenido" style="display:none;">
         <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
            %>
        
    <img src="img/logo.png" alt="" />
    <br>
    <br
        <h1>Listado registro salida</h1>
    
        <table class="table table-hover table-bordered ">
            <thead>
                <tr>
                    <th>ID Registro</th>
                    <th>Codigo Empleado</th>
                    <th>Hora Ingreso</th>
                    <th>Fecha Ingreso</th>
                    <th>Notas Ingreso</th>
                    
                </tr>
            </thead>
            <%
                    Datos misDatos = new Datos();
                    ResultSet rs = misDatos.getHoras();
                    while (rs.next()) {
                                       
                %>
                <tr>                    
                     <td><%=rs.getString("idRegistro")%></td>
                      <td><%=rs.getString("codEmpleado")%></td>
                      <td><%=rs.getString("horaSalida")%></td>
                      <td><%=rs.getString("fechaSalida")%></td>
                      <td><%=rs.getString("notasSalida")%></td>
                      
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
            <tbody>
                
            </tbody>
        </table>
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
