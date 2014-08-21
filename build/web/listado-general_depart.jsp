<%-- 
    Document   : listado-general_depart
    Created on : 10/11/2013, 12:06:18 AM
    Author     : Esneyder
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sofcont | datos departamento</title>
          
        <link rel="stylesheet" type="text/css" href="style.css">
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
         
        <h1>Registros departamento</h1>
        <table >
            <thead>
                <tr>
                    <th> id Departamento</th>
                    <th> Plan relacionado</th>
                    <th> Nombre</th>
                    <th> Descripcion</th>
                </tr>
            </thead>
            <tbody>
                <%
                Datos misDatos=new Datos();
                ResultSet rs=misDatos.getVerDepartamento();
                while(rs.next()){
                %>
                <tr>
                    <td><a href="<%=rs.getString("idDepartamento")%>"
                               class="eliminar"><i class="icon-trash"></i> <%= "Eliminar: " +
                                rs.getString("idDepartamento")%></a></td>
                   
                    <td><%=rs.getString("plan")%></td>
                     <td><%=rs.getString("nombre")%></td>
                      <td><%=rs.getString("descripcion")%></td>
                </tr>
                <%
                }
                %>
                
            </tbody>
            
        </table>
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
