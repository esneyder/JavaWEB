<%-- 
    Document   : ListarRegistrosdeIngreso
    Created on : 7/11/2013, 10:20:18 PM
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
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
      
            <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
             <!--Scripts-->
          <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
          <script src="js/bootstrap.js" type="text/javascript"></script>
      <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
        <jsp:include page="encabezado.jsp"></jsp:include>
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
        
    <img src="img/logo.png" alt="" />
    <br>
    <br>
        <h1>Listado registro ingreso</h1>
        <%--
        <table class="table table-hover table-bordered ">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Plan</th>
                    <th>Hora entradas</th>
                    <th>Fecha entradas</th>
                    
                    
                </tr>
            </thead>
            <%
                    Datos misDatos = new Datos();
                    ResultSet rs = misDatos.getVerRegistroEmpleado();
                    while (rs.next()) {
                                       
                %>
                <tr>  
                   
                     <td><%=rs.getString("codEmpleado")%></td>
                      <td><%=rs.getString("nombre")%></td>
                      <td><%=rs.getString("apellidos")%></td>
                      <td><%=rs.getString("idPlan")%></td>
                      <td><%=rs.getString("horaEntrada")%></td>
                      <td><%=rs.getString("fechaEntrada")%></td>
                    
                </tr>
                <%
                    }
                    misDatos.cerrarConexion();
                %>
            <tbody>
                
            </tbody>
        </table>
        --%>
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
