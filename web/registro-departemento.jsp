<%-- 
    Document   : registro-departemento
    Created on : 9/11/2013, 08:41:04 PM
    Author     : Esneyder
--%>

<%@page import="clases.Usuario"%>
<%@page import="clases.Departamento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Softcon | Registro  departamento</title>
        <link rel="stylesheet" type="text/css" href="ui-lightness/jquery-ui-1.8.21.custom.css">
            <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
            <script type="text/javascript" src="jquery-ui-1.8.21.custom.min.js"></script>
             <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
                 <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                  <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
                 <style>
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
                 </style>
  <script>
    $(document).ready(function() {
        // Para colocar efecto a los botones
      
        
        
          $("#consultar").click(function() {
                        return validarUsuario();
           });
           
            $("#nuevo").click(function() {
                        return validarTodo();
                    });
            
                    $("#modificar").click(function() {
                        return validarTodo();
                    });
                    
                     $("#borrar").click(function() {
                        if(validarUsuario()) {
                            $("<div></div>").html("Esta seguro de borrar el departamento?").
                                dialog({title:"Confirmación",modal:true,buttons:[
                                    {
                                        text: "Si",
                                        click: function() {
                                            $(this).dialog("close");
                                            $.post("EliminarDepartamento", {idUsuario: $("#codDepartamento").val()}, function(data) {
                                                $("#codDepartamento").val("");
                                                $("#plan").val("");
                                                $("#nombre").val("");
                                                $("#descripcion").val("");
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
                        }
                        return false;
                    }); 
    });
    
     
                
   
    
    function validarUsuario() {
                    if($("#codDepartamento").val() == "") {
                        $("<div></div>").html("Debe ingresar el codigo del departamento").
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
                
                
                function validarPlan() {
                    if($("#plan").val() == "0") {
                        $("<div></div>").html("Debe ingresar el plan que le pertenece al departamento").
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
                
                function validarNombre() {
                    if($("#nombre").val() == "") {
                        $("<div></div>").html("Debe ingresar el nombre del departamento").
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
                
                function validarDescripcion() {
                    if($("#descripcion").val() == "") {
                        $("<div></div>").html("Debe ingresar una descripcion  del departamento").
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
                
                function validarTodo(){
                if(validarUsuario()){                    
                        if(validarNombre()){
                            if(validarDescripcion()){
                                
                                    return validarPlan();
                                
                        }
                        }
                }
                }
    
</script>
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
        
            
            // Identificamos el botón que el usuario presiono
            boolean consultar = false;
            boolean nuevo = false;
            boolean modificar = false;
            boolean borrar = false;
            boolean limpiar = false;
            boolean listar = false;

            if (request.getParameter("consultar") != null) {
                consultar = true;
            }
            if (request.getParameter("nuevo") != null) {
                nuevo = true;
            }
            if (request.getParameter("modificar") != null) {
                modificar = true;
            }
            if (request.getParameter("borrar") != null) {
                borrar = true;
            }
            if (request.getParameter("limpiar") != null) {
                limpiar = true;
            }
            if (request.getParameter("listar") != null) {
                listar = true;
            }
              //variable para mostrar mensaje
        String mensaje="";
        
              
            
             
             //variables a utilizar
             String codDepartamento="";
             String plan="";
             String nombre="";
             String descripcion="";
             
             
             if(consultar){
                  Datos misDatos=new Datos();
                 Departamento miDepartamento=misDatos.getDeoartamento(codDepartamento);
                 if(miDepartamento==null){
                     codDepartamento="";
                     plan="";
                     nombre="";
                     descripcion="";
                     mensaje="Departamento no existe";
                 }else{                   
                             codDepartamento=miDepartamento.getCodDepartamento();
                             plan=miDepartamento.getPlan();
                             nombre=miDepartamento.getNombre();
                             descripcion=miDepartamento.getDescripcion();
                     mensaje="consulta generada correctamante";
                 }
                   misDatos.cerrarConexion();
             }
             //si preciona limpiar
             if(limpiar){
                 codDepartamento="";
                 plan="";
                 nombre="";
                 descripcion="";
             }
             //
             if(nuevo){
                  Datos misDatos=new Datos();
                 Departamento miDepartamento=misDatos.getDeoartamento(codDepartamento);
                 if(miDepartamento!=null){
                     mensaje="El departamento ya existe!!!";
                 }else{
                     miDepartamento=new Departamento(
                             codDepartamento,
                             plan,
                             nombre,
                             descripcion);
                     misDatos.newDepartamento(miDepartamento);
                    mensaje="departamento creado correctamente!!!";
                 }
                  misDatos.cerrarConexion();
             }
             
             //si preciona actualizar
             if(modificar){
                Datos misDatos= new Datos();
                Departamento MiDep=misDatos.getDeoartamento(codDepartamento);
             if(MiDep==null){
                 mensaje="Departamento no existe!!";
             }else{
                 MiDep= new Departamento(
                         codDepartamento,
                         plan,
                         nombre,
                         descripcion);
                 misDatos.updateDepartamento(MiDep);
                 mensaje="Departamento actualizado correctamente!!!";
             }
             misDatos.cerrarConexion();
             }
              Datos misDatos=new Datos();
              ResultSet planes=misDatos.getPlan();
             
        %>
           <div class="control-group">
                
            <div id="w">
                <form class="form-horizontal" name="departamento" id="departamento"
                      method="POST" action="registro-departemento.jsp">
          
                   <img src="img/logo.png" alt="" />
                <hr>
                  <p class="note"><span class="req">*</span>Todos los asteriscos con requeridos</p>
                 
                      
                          <div class="row">
                              <label class="control-label" for="codDepartamento">Codigo departamento<span class="req">*</span></label>
                              <div class="controls">
                                  <input class="txt" name="codDepartamento" id="codDepartamento" >                                      
                              </div>
                          </div>
                     
                     <div class="control-group">
                                <div class="row">
                             <label class="control-label" for="plan">Plan<span class="req">*</span></label>
                             <div class="controls">
                            <select name="idPlan" id="idPlan" class="txt">
                                <option value="0">Planes</option>
                                <%
                                    while (planes.next()) {
                                %>
                                <option value="<%=planes.getString("plan")%>"
                                        <%=(planes.getString("plan").equals(planes) ? "selected" : "")%>
                                        ><%=planes.getString("plan") %>
                                </option>
                                <%         
                                    }
                                %>
                            </select>
                             </div>
                             </div>
                                </div>
                            
                            <div class="control-group">
                                <div class="row">
                                    <label class="control-label" for="nombre">Nombre departamento<span class="req">*</span></label>
                                    <div class="controls">
                                    <input class="txt" name="nombre" id="nombre" type="text">
                                    </div>
                                </div>
                            </div>
                                                             
                            <div class="control-group">
                                <div class="row">
                                    
                                    <label class="control-label" for="descripcion">Descripcion</label>
                                    <div class="controls">
                                    <textarea class="txtarea" name="descripcion" id="descripcion" type="text"tabindex="8"></textarea>
                                    </div>
                                </div>
                            </div>
                            
                            
                                <%--
                                mas  opciones del formulario
                                --%>
                                <center>
                                <div class="control-group">
                                    <div class="row">
                                            <input type="submit" value="Consultar" name="consultar" id="consultar" class="btn btn-primary" />
                                            <input type="submit" value="Nuevo" name="nuevo" id="nuevo" class="btn btn-primary"  /> 
                                            <input type="submit" value="Modificar" name="modificar" id="modificar" class="btn btn-primary"   />
                                            <input type="submit" value="Borrar" name="borrar" id="borrar"  class="btn btn-danger"/>
                                            <input type="submit" value="Limpiar" name="limpiar" id="limpiar" class="btn btn-primary" />
                                    </div>
                                </div
                                </center>
                                <br>
                                 <center><h1><%=mensaje%></h1></center>
         
               <hr>
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
