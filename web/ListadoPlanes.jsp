<%-- 
    Document   : ListadoPlanes
    Created on : 21/10/2013, 02:05:22 PM
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
        <h1>Listado de planes</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Plan</th>
                    <th>Horas totales</th>
                    <th>Horas mensuales</th>
                    <th>Horas menales</th>
                    <th>Horas diarias</th>
                    <th>Hora ingreso</th>
                    <th>Hora salida</th>
                    <th>Fecha inicio</th>
                    <th>Fecha Culminación</th>
                    <th>Descripción</th>
                    <th>$ Hora</th>
                </tr>
            </thead>
            <tbody>
                <%
                Datos misDatos=new Datos();
                ResultSet rs=misDatos.getVistaPlanes();
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("plan")%></td>
                    <td><%=rs.getString("horasLabor")%></td>
                    <td><%=rs.getString("horasMes")%></td>
                    <td><%=rs.getString("horasSemana")%></td>
                    <td><%=rs.getString("horasDiarias")%></td>
                    <td><%=rs.getString("horaEntrada")%></td>
                    <td><%=rs.getString("horaSalida")%></td>
                    <td><%=rs.getString("fechaInicio")%></td>
                    <td><%=rs.getString("fechaCulminacion")%></td>
                    <td><%=rs.getString("descripcion")%></td>
                    <td><%=rs.getString("valorHora")%></td>
                
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
                
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
