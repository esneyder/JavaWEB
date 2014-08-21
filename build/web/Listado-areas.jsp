<%-- 
    Document   : Listado-areas
    Created on : 10/11/2013, 07:54:01 AM
    Author     : Esneyder
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page import="clases.Usuario"%>
<%@page import="clases.Area"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sotfcon | listado areas</title>
       
     
         <link rel="stylesheet" type="text/css" href="style.css">
        
        
        <script>
            $(document).ready(function(){
                   $(".eliminar").click(function () {
                    $("#borrado").val($(this).attr("href"));
                    $("<div></div>").html("Está seguro de querer borrar el area " + $("#borrado").val() + "?").
                        dialog({title:"Confirmacion", modal: true, buttons: [
                            {
                                text: "Si",
                                click: function() {
                                    $(this).dialog("close");
                                    $.post("EliminarArea", {idArea: $("#borrado").val()}, function(data) {
                                        location.reload();
                                    })
                                }
                            },
                            {
                                text: "No",
                                click: function() {
                                    $(this).dialog("close");
                                }
                            }
                        ]
                    });
                    return false;
                });
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
        <h1>Listado area</h1>
    </center>
     
        <table >
            <thead>
                <tr>
                    <th>id Area</th>
                    <th>id Departamento</th>
                    <th>Nombre area</th>
                    <th>Descripcion</th>
                   
                </tr>
            </thead>
            <tbody>
                <%
                Datos misDatos=new Datos();
                ResultSet rs=misDatos.getVerAreas();
                while(rs.next()){
                %>
                <tr>
                    <td><a href="<%=rs.getString("idArea")%>"
                               class="eliminar"><i class="icon-trash"></i> <%="Eliminar: " + 
                                       rs.getString("idArea")%></a></td>
                    <td><%=rs.getString("idDepartamento")%></td>
                    <td align="right"> <%=rs.getString("nombre")%></td>
                    <td align="right"><%=rs.getString("descripcion")%></td>
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
