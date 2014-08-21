<%-- 
    Document   : ListarEmpleados
    Created on : 12/10/2013, 10:28:42 PM
    Author     : Esneyder
--%>

<%@page import="clases.Utilidades"%>
<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
       
         <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
      
    <div class="control-group">
    <div class="row">
       
   
   
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
        <h1>Datos empleados</h1>
        
        <table  class=" table-hover table-bordered table-condensed ">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Tipo Documento</th>
                    <th>Documento</th>                    
                    <th>Facultad</th>                   
                    <th>Programa</th>
                    <th>Plan</th>                   
                    <th>Descripción</th>
                    <th>foto</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    Datos misDatos = new Datos();
                    ResultSet rs = misDatos.getvistaEmpleados();
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("codEmpleado")%></td>
                    <td><%=rs.getString("nombre")%></td>
                    <td><%=rs.getString("apellidos")%></td>                   
                    <td><%=rs.getString("idDocumento")%></td>
                    <td><%=rs.getString("documento")%></td>  
                    <td><%=rs.getString("idFacultad")%></td>
                    <td><%=rs.getString("idPrograma")%></td>
                    <td><%=rs.getString("idPlan")%></td>
                    
                    <td><%=rs.getString("descripcion")%></td>
                   <td><img src="<%="img/" + rs.getString("foto")%>" width="50" height="80"/></td>
                   
                
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
            </tbody>
           
        </table>
        </center>
    </div>
             </div>
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
