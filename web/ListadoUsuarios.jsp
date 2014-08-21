<%-- 
    Document   : ListadoUsuarios
    Created on : 

--%>

<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
         <link rel="stylesheet" type="text/css" href="style.css">
        <title>Sistema Control de Personal</title>
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
        <h1>Listado usuarios</h1>
    </center>
        <div class="control-group  ">
          <center>
            <table >
                <fieldset>
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Perfil</th>
                    <th>Foto</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Datos misDatos = new Datos();
                    ResultSet rs = misDatos.getUsuarios();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("idUsuario")%></td>
                    <td><%=rs.getString("nombres")%></td>
                    <td><%=rs.getString("apellidos")%></td>
                    <td><%=(rs.getString("idPerfil").equals("1") ? "Administrador" : "Empleado")%></td>
                    <td><img src="<%="img/" + rs.getString("foto")%>" width="80" height="100"/></td>
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
            </tbody>
                </fieldset>
        </table>
            
        </div>
            <br>
            <br>
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
