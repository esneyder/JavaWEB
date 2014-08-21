<%-- 
    Document   : ListadoRegistro-Ingreso
    Created on : 7/11/2013, 09:00:06 PM
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
       
         <link rel="stylesheet" type="text/css" href="style.css">
        <title>Softcon | Listado registro ingreso</title>
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
    
        <h1>Listado registro ingreso</h1>
    
        <table>
            <thead>
                <tr>
                    <th>ID Registro</th>
                    <th>Codigo Empleado</th>
                    <th>Hora Ingreso</th>
                    <th>Fecha Ingreso</th>
                    <th>Notas Ingreso</th>
                    <th>hora salida</th>
                    <th>Fecha salida</th>
                    <th>Nota salida</th>
                   
                    
                    
                </tr>
            </thead>
            <%
                    Datos misDatos = new Datos();
                    ResultSet rs = misDatos.getregistrosLabor();
                    while (rs.next()) {
                                       
                %>
                <tr>                    
                     <td><%=rs.getString("idRegistro")%></td>
                      <td><%=rs.getString("codEmpleado")%></td>
                      <td><%=rs.getString("horaEntrada")%></td>
                      <td><%=rs.getString("fechaEntrada")%></td>
                      <td><%=rs.getString("notasEntrada")%></td>
                      <td><%=rs.getString("horaSalida")%></td>
                      <td><%=rs.getString("fechaSalida")%></td>
                      <td><%=rs.getString("notaSalida")%></td>
                      
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
        
    </body>
</html>
