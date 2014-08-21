<%-- 
    Document   : DatosContEmpleado
    Created on : 20/10/2013, 07:53:11 PM
    Author     : Esneyder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Utilidades"%>
<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                   
                  
                   <link rel="stylesheet" type="text/css" href="style.css">
                   
          <script>
                $(document).ready(function() {
                    // Para colocar efecto a los botones
                    $("input:submit").button();
                });
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
      
      
       
    <center>
        <h1>Contacto empleados</h1>
        <div>
        <table>
            <thead>
                <tr>
                    <th>Codigo </th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Programa Academico</th>
                    <th>Plan</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Dirección</th>
                    <th>Descripción</th>
                    <th>Foto</th>
                </tr>
                 </thead>
            <tbody>
                <%
                Datos misDatos=new Datos();
                ResultSet rs=misDatos.getVistaContEmpleado();
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("codEmpleado")%></td>
                    <td><%=rs.getString("nombre")%></td>
                    <td><%=rs.getString("apellidos")%></td> 
                    <td><%=rs.getString("idPrograma")%></td>
                    <td><%=rs.getString("idPlan")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("telefono")%></td>
                    <td><%=rs.getString("direccion")%></td>
                    <td><%=rs.getString("descripcion")%></td>
                    <td><img src="<%="img/" + rs.getString("foto")%>" 
                             width="90" height="90"/></td>
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
                
            </tbody>    
        </table>
        </div>
    </center>
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
      
    </body>
</html>
