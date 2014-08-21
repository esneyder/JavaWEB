<%-- 
    Document   : new-areaDetrabajo
    Created on : 10/11/2013, 12:27:39 AM
    Author     : Esneyder
--%>

<%@page import="clases.Area"%>
<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Softcon | nueva area de trabajo</title>
          <link rel="stylesheet" type="text/css" href="ui-lightness/jquery-ui-1.8.21.custom.css">
            <script type="text/javascript" src="jquery-1.7.2.min.js"></script>
            <script type="text/javascript" src="jquery-ui-1.8.21.custom.min.js"></script>
             <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
                 <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                  <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
                  
                  
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
                                            $.post("EliminarArea", {idUsuario: $("#idArea").val()}, function(data) {
                                                $("#idArea").val("");
                                                $("#idDepratamento").val("");
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
                    if($("#idArea").val() == "") {
                        $("<div></div>").html("Debe ingresar el del area").
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
                
                
                function validarDepartamento() {
                    if($("#idDepartamento").val() == "0") {
                        $("<div></div>").html("Debe seleccionar el departamento que le asigna el area").
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
        
        <%
            // Validaciones de seguridad
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            }
            if (miUsuarioLogueado.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        
        <%
            }
            %>
        
        <%
       
        
        String mensaje="";
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
            //defino las variables a utilizar
            String idArea="";
            String idDepartamento="";
             String nombre="";
             String descripcion="";
            
            //si preciona el boton  cosulta
            if(consultar){
                Datos misDatos=new Datos();
                Area miArea=misDatos.getAreacon(idArea);
                if(miArea==null)
                {
                idArea="";
                nombre="";
                descripcion="";
                idDepartamento="";
                mensaje="el area consultado no existe!!!!";
                }else{
                    idArea="" + miArea.getIdArea();
                    idDepartamento=miArea.getIdDepartamento();
                    nombre=miArea.getNombre();
                    descripcion=miArea.getDescripcion();
                 mensaje="area consualtada corretamente!!";
                
                }
                misDatos.cerrarConexion();
                        
                        
            }
            
            //si preciona el boton limpirar
            
            if(limpiar){
               idArea="";
               nombre="";
               idDepartamento="";
               descripcion="";
                
            }
           
            //si precina el boton unuevo
            if(nuevo){
                Datos misDatos=new Datos();
                Area miArea=misDatos.getAreacon(nombre);
                if(miArea!=null){
                    mensaje="El area ya existe..";
                }else{
                    miArea=new Area(
                            idArea,
                            idDepartamento,
                            nombre,
                            descripcion);
                   
                    mensaje="Area creada correctamente.:!!!";
                }
                misDatos.cerrarConexion();
            }
            
            
            //si preciona el boton modificar
            if(modificar){
                Datos misDatos=new Datos();
                Area miArea=misDatos.getAreacon(idArea);
                if(miArea==null){
                    mensaje="el area solicitada no existe....!!!";
                 }else{
                    miArea=new Area(
                            idArea,
                            idDepartamento, 
                            nombre, 
                            descripcion);
                    misDatos.updateArea(miArea);
                    mensaje="area modificada correctamente...!!!";
                }
                misDatos.cerrarConexion();
                
            }
            Datos misDatos=new Datos();
            ResultSet miDepartamento=misDatos.getDeparta();
        %>
        
        <div id="micontenido" style="display:none;">
         <div class="control-group">
        <div id="w">
                <img src="img/logo.png" alt="" />
                <hr>
                <br>
                <form name="area" id="area" action="new-areaDetrabajo.jsp" method="POST" class="form-horizontal">
           
                
                 <p class="note"><span class="req">*</span>Todos los asteriscos con requeridos</p>
                 
                 <div class="control-group">
                     <div class="row">
                         <label class="control-label" for="idArea">IdArea<span class="req"></span></label>
                         <div class="controls">
                             <input class="txt" name="idArea" id="idArea" type="text">
                         </div>
                     </div>
                 </div>
                 
                
                 <div class="control-group">
                     <div class="row">
                         <label class="control-label" for="nombre">Nombre area<span class="req">*</span></label>
                         <div class="controls">
                         <input name="nombre" id="nombre" type="text" class="txt">
                         </div> 
                     </div>
                 </div>
                 
                 
                 <div class="control-group">                     
                 <div class="row">
                     <label class="control-label" for="departamento">Departamento<span class="req">*</span></label>
                            <div class="controls">
                                <select name="departamento" id="departamento" class="txt">
                                <option value="0">Seleccione un departamento</option>
                                 <%
                                    while (miDepartamento.next()) {
                                %>
                                <option value="<%=miDepartamento.getString("idDepartamento")%>"
                                        <%=(miDepartamento.getString("idDepartamento").equals(miDepartamento) ? "selected" : "")%>
                                        ><%=miDepartamento.getString("idDepartamento") %>
                                </option>
                                <%  
                                    }
                                %>
                            </select>   
                            </div>
                         </div>
                            
                 </div>
                            <br>
                 
                
                                <div class="row">
                                    
                                    <label class="control-label" for="descripcion">Descripcion<span class="req">*</span></label>
                                    <div class="controls">
                                    <textarea class="txtarea" name="descripcion" id="descripcion" type="text"tabindex="8"></textarea>
                                    </div>
                                </div>
                 
                          
            
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
         
               
                <center>
                    <h2>
                       
                  <a href="javascript:history.back(1)">Regresar a la página anterior</a><br>
                       <a href="Principal.jsp">Regresar al menú</a>
                    </h2>
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
