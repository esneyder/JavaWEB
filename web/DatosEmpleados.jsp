<%-- 
    Document   : DatosEmpleados
    Created on : 6/10/2013, 05:23:08 PM
    Author     : Esneyder
--%>
<%@page import="java.util.Date"%>
<%@page import="clases.Utilidades"%>
<%@page import="clases.Empleado"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="clases.Usuario"%>
<%@page import="clases.Datos"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
                 <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                   <jsp:include page="encabezado.jsp"></jsp:include>
        <title>Empleado |Sistema Control de Personal</title>
        
        <script type="text/javascript">
$(document).ready(function(){
  $(document).ready(function () {
    $('#micontenido').fadeIn(1200);
  });
});
</script>
        <script>
          $(document).ready(function() {
                $("#fechaNacimiento").datepicker({dateFormat: "yy/mm/dd", changeYear: true});
               
            });
        </script>

     
         <script>
            $(document).ready(function() {
               
                
                $("#consultar").click(function() {
                    return validarEmpleado();
                });

                $("#nuevo").click(function() {
                    return ValidarTodo();
                });
            
                $("#modificar").click(function() {
                    return validarEmpleado();
                });

                $("#borrar").click(function() {
                    if(validarCliente()) {
                        $("<div></div>").html("Esta seguro de borrar el el empleado?").
                            dialog({title:"Confirmación",modal:true,buttons:[
                                {
                                    text: "Si",
                                    click: function() {
                                        $(this).dialog("close");
                                        $.post("EliminarCliente", {idEmpleado: $("#codEpleado").val()}, 
                                        function(data) {
                                            $("#codEpleado").val("");
                                            $("#idTipo").val("0");
                                            $("#nombres").val("");
                                            $("#apellidos").val("");
                                            $("#direccion").val("");
                                            $("#telefono").val("");
                                            $("#idCiudad").val("0");
                                            $("#fechaNacimiento").val("");
                                            $("#fechaIngreso").val("");
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
             
            function validarTodo() {
            /*
                if(validarCliente()) {
                    if (validarNombres()) {
                        if(validarApellidos()){
                            if(validarTipo()){
                                if(validarDocumento()){
                                    if(validarNacionalidad()){
                                        if(validarCiudad()){
                                            if(validarFechanacimineto()){
                                                if(validarEdad()){
                                                    if (validarGenero()) {
                                                        if(validarFacultad()){
                                                            if(validarSemestre()){
                                                                if(validarPrograma()){
                                                                    if(validarPlan()){
                                                                        if(validarEmail()){
                                                                           return validarEmpleado();
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }

                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                }*/
            return false;
            }
            
            function validarEmpleado() {
                if($("#codEmpleado").val() == "") {
                    $("<div></div>").html("Debe ingresar un ID del empleado").
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


             function validarFechanacimineto() {
                if($("#fechaNacimiento").val() == "") {
                    $("<div></div>").html("Debe ingresar un ID del empleado").
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


            function validarTipo() {
                if($("#idDocumento").val() == "0") {
                    $("<div></div>").html("Debe seleccionar el tipo de documento del empleado").
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

            function validarNombres() {
                if($("#nombres").val() == "") {
                    $("<div></div>").html("Debe un nombre(s) del empleado").
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

            function validarApellidos() {
                if($("#apellidos").val() == "") {
                    $("<div></div>").html("Debe un apellido(s) del empleado").
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

            function validarDireccion() {
                if($("#Direccion").val() == "") {
                    $("<div></div>").html(" debe la direccion del empleado el empleado").
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

            function validarDocumento() {
                if($("#Documento").val() == "") {
                    $("<div></div>").html("debe el # documento  del empleado").
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

            function validarNacionalidad() {
                if($("#idnacionalidad").val() == "0") {
                    $("<div></div>").html("Debe seleccionar la Nacionalidad del empleado").
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

            function validarCiudad() {
                if($("#idCiudad").val() == "") {
                    $("<div></div>").html("Debe selectcionar la ciudad del empleado").
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

          function validarApellidos() {
                if($("#fechaNacimiento").val() == "") {
                    $("<div></div>").html("Debe la fecha de Nacionalidad del empleado").
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

            function validarEdad() {
                if($("#edad").val() == "") {
                    $("<div></div>").html("Debe una edad del empleado").
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

            function validarGenero() {
                if($("#edad").val() == "0") {
                    $("<div></div>").html("Debe una genero del empleado").
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

            function validarFacultad() {
                if($("#edad").val() == "") {
                    $("<div></div>").html("Debe seleccionar una facultad para el empleado").
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

            function validarSemestre() {
                if($("#edad").val() == "") {
                    $("<div></div>").html("Debe seleccionar el semestre actual del empleado").
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

            function validarPrograma() {
                if($("#edad").val() == "") {
                    $("<div></div>").html("Debe una Programa para el empleado").
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
                if($("#edad").val() == "") {
                    $("<div></div>").html("Debe seleccionar un plan de trabajo para el empleado ").
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

            function validarEmail () {
            
            if ($("#email").val()=="") {
                $("<div></div>").html("Debe ingresar un email de contacto!!").
                    dialog({title:"Error de validacion", modal:true,buttons:[
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

            // Variable que muestra los mensajes del sistema
            String mensaje = "";
            //cargo un objeto de la clase Datos
             Datos misDatos=new Datos();
             ResultSet planes=misDatos.getPlan();
             ResultSet docu=misDatos.getDocumento();
             ResultSet naci=misDatos.getNacionalidad();                     
             ResultSet prog=misDatos.getPrograma();
             ResultSet ciu=misDatos.getCiudad();
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

            // Obtenemos el valor como fue llamado el formulario
            String codEmpleado = "";           
            String nombres = "";
            String apellidos = "";
            String idDocumento = "";
            String direccion = "";
            String documento="";
            String idnacionalidad="";
            String telefono = "";
            String idCiudad = "";
            String fechaNacimiento = "";
            String fechaIngreso = "";
            String edad="";
            String genero="";
            String idFacultad="";
            String idSemestre="";
            String idPrograma="";
            String idPlan="";
            String descripcion="";
            String foto="";
            String email="";
            if (request.getParameter("codEpleado") != null) {
                codEmpleado = request.getParameter("codEpleado");
            }
            if (request.getParameter("idDocumento") != null) {
                idDocumento = request.getParameter("idDocumento");
            }
            if (request.getParameter("nombres") != null) {
                nombres = request.getParameter("nombres");
            }
            if (request.getParameter("apellidos") != null) {
                apellidos = request.getParameter("apellidos");
            }
            if (request.getParameter("direccion") != null) {
                direccion = request.getParameter("direccion");
            }
            if (request.getParameter("telefono") != null) {
                telefono = request.getParameter("telefono");
            }
            if (request.getParameter("idCiudad") != null) {
                idCiudad = request.getParameter("idCiudad");
            }
            if (request.getParameter("fechaNacimiento") != null) {
                fechaNacimiento = request.getParameter("fechaNacimiento");
            }
            if (request.getParameter("fechaIngreso") != null) {
                fechaIngreso = request.getParameter("fechaIngreso");
            }
            if(request.getParameter("documento")!=null){
                documento=request.getParameter("documento");
            }
            if(request.getParameter("idnacionalidad")!=null){
               idnacionalidad=request.getParameter("idnacionalidad");
            }
            if(request.getParameter("edad")!=null){
                edad=request.getParameter("edad");
            }
            if(request.getParameter("genero")!=null){
                genero=request.getParameter("genero");
            }
            if(request.getParameter("idFacultad")!=null){
                idFacultad=request.getParameter("idFacultad");
            }
            if(request.getParameter("idPrograma")!=null){
                idPrograma=request.getParameter("idPrograma");
            }
            if(request.getParameter("idSemestre")!=null){
                idSemestre=request.getParameter("idSemestre");
            }
            if(request.getParameter("idPlan")!=null){
                idPlan=request.getParameter("idPlan");
            }
            if(request.getParameter("foto")!=null){
               foto=request.getParameter("foto");
            }
            if (request.getParameter("email")!=null) {
            email=request.getParameter("email");
                
            }
           if(nuevo){
              
                Empleado miEmpleado = misDatos.getEmpleado(codEmpleado);
                if(miEmpleado!=null){
                    mensaje ="El empleado ya existe";
                }else{
                    miEmpleado = new Empleado(
                            codEmpleado,
                            nombres,
                            apellidos,
                            idDocumento,
                            documento,
                            idnacionalidad,
                            idCiudad,
                            Utilidades.stringToDate(fechaNacimiento),
                            edad,
                            genero,
                            idFacultad,
                            idSemestre,
                            idPrograma,
                            idPlan,
                            email,
                            descripcion,
                            foto,
                            telefono,
                            direccion);
                            misDatos.newEmpleado(miEmpleado);
                         mensaje ="Empleado registraso correctamente";
                }
              misDatos.cerrarConexion();
           }
           
           //si preciona el boton consultar
           if(consultar){
              
              
           Empleado miEmpleado=misDatos.getEmpleado(codEmpleado);
              
               if(miEmpleado==null){
                            codEmpleado="";
                            nombres=""; 
                            apellidos="";                             
                            idDocumento="";
                            documento="";
                            idnacionalidad=""; 
                            idCiudad="";
                            fechaNacimiento="";
                            edad=""; 
                            genero=""; 
                            idFacultad="";
                            idSemestre="";
                            idPrograma="";
                            idPlan="";
                            email="";
                            descripcion="";
                            foto="";
                            telefono="";
                            direccion="";
                            
                            
                           mensaje="El empleado no existe";
                      
         
           }else{
           codEmpleado=miEmpleado.getCodEpleado();
           nombres=miEmpleado.getNombres();
           apellidos=miEmpleado.getApellidos();
           idDocumento= "" +miEmpleado.getIdDocumento();
           documento=miEmpleado.getDocumento();
           idnacionalidad="" + miEmpleado.getIdnacionalidad();
           idCiudad=""+ miEmpleado.getIdCiudad();
           fechaNacimiento=Utilidades.formatDate(miEmpleado.getFechaNacimiento());
           edad=miEmpleado.getEdad();
           genero=miEmpleado.getGenero();
           idFacultad=""+ miEmpleado.getIdFacultad();
           idSemestre= "" +miEmpleado.getIdSemestre();
           idPrograma=""+ miEmpleado.getIdPrograma();
           idPlan=""+ miEmpleado.getIdPlan();
           email=miEmpleado.getEmail();
           descripcion=miEmpleado.getDescripcion();
           foto=miEmpleado.getFoto();
           telefono=miEmpleado.getTelefono();
           direccion=miEmpleado.getDireccion();
           
           mensaje="empleado consultado correctamente";

       }
               misDatos.cerrarConexion();

           }
           if(limpiar){
                            codEmpleado="";                            
                            nombres=""; 
                            apellidos=""; 
                            direccion="";
                            idDocumento="";
                            documento="";                            
                            idnacionalidad=""; 
                            idCiudad="";
                            fechaNacimiento="";
                            edad=""; 
                            genero=""; 
                            idFacultad="";
                            idSemestre="";
                            idPrograma="";
                            idPlan="";
                            email="";
                            descripcion="";
                            telefono="";
                            foto="";
           }
           
           //si preciona modificar registro
             
           
           if(modificar){
              
               Empleado miEmpleado=misDatos.getEmpleado(codEmpleado);
               if(miEmpleado ==null){
                   mensaje="Empleado no existe!!";
               }else{
                   miEmpleado=new Empleado(codEmpleado,
                           nombres,
                           apellidos,
                           idDocumento,
                           documento,
                           idnacionalidad,
                           idCiudad,
                           Utilidades.stringToDate( fechaNacimiento),
                           edad,
                           genero,
                           idFacultad,
                            idSemestre,
                            idPrograma,
                            idPlan,
                           email, 
                           descripcion,
                           foto,
                           telefono, 
                           direccion);
                   misDatos.updateEmpleado(miEmpleado);
                   mensaje="Empleado Modificado correctamente";
               }
               misDatos.cerrarConexion();
           }
           
           
           //si preciona listra los registros
           
           if(listar){
              %>
        <jsp:forward page="ListarEmpleados.jsp"></jsp:forward>
        <%   
           }
           if(borrar){
               
               Empleado miEmpleado=misDatos.getEmpleado(codEmpleado);
               if(miEmpleado ==null){
                   mensaje="Empleado no existe!!";
               }else{
                   misDatos.deleteEmpleados(codEmpleado);
                    mensaje="Empleado eliminado correctamente!!";
               }
               misDatos.cerrarConexion();
               }
           
           
               
            

            
        %>
          <div id="micontenido" style="display:none;">
        <div class="control-group">
            <div id="w">
              
                    <form  class="form-horizontal" action="DatosEmpleados.jsp" method="POST" 
                           name="empleado" id="empleado">
               <fieldset>
                 <img src="img/logo.png" alt="JankoAtWrpSpeed demos" />
                    <hr>
                    <br>
               <!-- Form Name -->
                    

               <!-- Text input-->
               <div class="control-group">
                     <div class="row">
                 <label class="control-label" for="Codigo Estudiantil">Codigo Estudiantil <span class="req">*</span></label>
                 <div class="controls">
                   <input id="codEmpleado" name="codEmpleado" type="text"
                          value="<%=codEmpleado%>" class="txt"  >   
                 </div>
                     </div>
               </div>

               <!--  nombre-->
               <div class="control-group">
                     <div class="row">
                   <label class="control-label" for="Nombres">Nombres <span class="req">*</span></label>
                  <div class="controls">
                      <input id="nombres" name="nombres" type="text"  
                            value="<%=nombres%>" class="txt" >
               </div>
                     </div>
               </div>

               <!--
               Apellidos
               -->
               <div class="control-group">
                      <div class="row">
                   <label class="control-label" for="Apellidos">Apellidos <span class="req">*</span></label>
                   <div class="controls">
                       <input id="apellidos" name="apellidos" type="text"  class="txt"
                           value="<%=apellidos%>" >
                      </div>
                      </div>
               </div>

               <!--tipo docuemento-->

               <div class="control-group">
                   <div class="row">
                 <label class="control-label" for="idDocumento" >Tipo Documento <span class="req">*</span></label>
                 <div class="controls">
                     <select name="idPlan" id="idPlan" class="txt">
                                <option value="0">Documento</option>
                                <%
                                    while (docu.next()) {
                                %>
                                <option value="<%=docu.getString("tipoDocumento")%>"
                                        <%=(docu.getString("tipoDocumento").equals(docu) ? "selected" : "")%>
                                        ><%=docu.getString("tipoDocumento") %>
                                </option>
                                <%           
                                    }
                                %>
                            </select>                    
                 </div>
                   </div>
               </div>




               <!-- Nacionalidad-->
               <div class="control-group">
                      <div class="row">
                   <label class="control-label" for="idnacionalidad"> <span class="req">*</span></label>
                   <div class="controls">
                         <select name="idnacionalidad" id="idnacionalidad" class="txt" type="text">
                                <option value="0">Nacionalidad</option>
                                <%
                                    while (naci.next()) {
                                %>
                                <option value="<%=naci.getString("nacionalidad")%>"
                                        <%=(naci.getString("nacionalidad").equals(naci) ? "selected" : "")%>
                                        ><%=naci.getString("nacionalidad") %>
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
               <label class="control-label" for="idCiudad">Ciudad <span class="req">*</span></label>
               <div class="controls">
              <select name="idCiudad" id="idCiudad" class="txt" type="text">
                                <option value="0">Ciudad</option>
                                <%
                                    while (ciu.next()) {
                                %>
                                <option value="<%=ciu.getString("ciudad")%>"
                                        <%=(ciu.getString("ciudad").equals(ciu) ? "selected" : "")%>
                                        ><%=ciu.getString("ciudad") %>
                                </option>
                                <%  
                                    }
                                %>
                            </select>  
               </div>
                      </div>
               </div>

               <!--fecha nacimiento-->
             
           

               <div class="control-group">
                      <div class="row">
                            <label class="control-label" for="Fecha Nacimiento">Fecha Nacimiento <span class="req">*</span></label>
                            <div class="controls">
                                <input  type="text" placeholder="click aqui" value="<%=fechaNacimiento%>"  class="txt" name="fechaNacimiento" id="fechaNacimiento">                 
                             </div>
                      </div>
               </div>
               <!--edad empleado-->

               <div class="control-group">
                      <div class="row">
               <label class="control-label" for="Edad">Edad <span class="req">*</span></label>
               <div class="controls">
               <input id="edad" name="edad" type="text"  value="<%=edad%>" class="txt">
               </div>
                      </div>
               </div>

               
              
               <!--genero-->
       
             
       <div class="control-group">
                      <div class="row">
               <label class="control-label" for="Genero">Genero <span class="req">*</span></label>
               <div class="controls">
                   <select name="genero" id="genero" class="txt">                              
                                <option value="1">Masculino</option>
                                <option value="2">Femenino</option>
                            </select>    

               </div>
                      </div>
               </div>
            
            
                <!--facultad-->
                              <div class="control-group">
                                     <div class="row">
                                        <label class="control-label" for="idFacultad">Facultad <span class="req">*</span></label>
                                        <div class=controls>
                                                <select name="idFacultad" id="idFacultad" class="txt" type="text">
                                                    <option value="0">Facultad</option>
                                                    <option value="1">Facultad Teologia</option>
                                                    <option value="2">Facultad Salud</option>
                                                    <option vlaue="3">facultad Administracion</option>
                                                    <option value="4">facultad Educacion</option>
                                              
                                    </select>   
                                      </div>
                                     </div>
                          </div>
             
                          <!--semestre-->
                          <div class="control-group">
                               <div class="row">
                                    <label class="control-label" for="idPlan">Semestre <span class="req">*</span></label>
                                    <div class="controls">
                                        <input name="idPlan" id="idPlan" class="txt" type="text" value="<%=idPlan%>"
                                    
                               </div>
                               </div>

                        </div>
                                   


                            <div class="control-group">
                                   <div class="row">
                             <label class="control-label" for="idPrograma">Programa <span class="req">*</span></label>
                            <div class="controls">
                                <select name="idPrograma" id="idPrograma" class="txt">
                                <option value="0">Progama Academico</option>
                                 <%
                                    while (prog.next()) {
                                %>
                                <option value="<%=prog.getString("programa")%>"
                                        <%=(prog.getString("programa").equals(prog) ? "selected" : "")%>
                                        ><%=prog.getString("programa") %>
                                </option>
                                <%  
                                    }
                                %>
                            </select>   
                            </div>
                                   </div>
                           </div>

                           <!--datos de labor-->
                           
                         
                              <div class="control-group">
                                <div class="row">
                             <label class="control-label" for="plan">Plan <span class="req">*</span></label>
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
                           

                            <!--descripcion personal..conocimientos personales-->
                            <!-- Textarea -->
                            <div class="control-group">
                                   <div class="row">
                                  
                                        <label for="name" class="control-label">Descripcion<span class="req">*</span> </label>
                                        <div class="controls">
                                        <textarea type="text" name="descripcion" id="descripcion" value="" size="10"  
                                                  class="txtarea" tabindex="6"></textarea>
                                     </div>
                                   </div>
                            </div>
                         

                           <div class="control-group">
                                  <div class="row">

                            <label class="control-label" for="telefono">Telefono</label> 
                           <div class="controls">
                               <input id="telefono" name="telefono" class="txt" type="text" value="<%=telefono%>" class="txt">
                           </div>
                                  </div>

                           </div>

                      <!--foto-->
                      <!-- File Button --> 
                              <div class="control-group">
                                     <div class="row">
                             <label class="control-label" for="foto">Foto</label>
                            <div class="controls">
                                <input id="foto" name="foto" class="txt" <%=foto%>  type="file" value="<%=foto%>">
                                <br>
                                           <br>
                                           <%
                                               if (foto == null) {
                                                   foto = "";
                                               }
                                               if (foto.equals("")) {
                                           %>
                                           <img src="img/usuario.png" width="120" height="120" alt="Seleccione una foto"/>
                                           <%                            } else {
                                           %>
                                           <img src="<%="img/" + foto%>" width="120" height="120" alt="Seleccione una foto" class="txt"/>
                                           <%
                                               }
                                           %>
                                       </td>
                             </div>
                                     </div>
                               </div>

                             <!--email-->

                           <div class="control-group">
                                       <div class="row">

                                   <label class="control-label" for="email">Email <span class="req">*</span></label>
                                   <div class="controls">
                                    <input id="email" class="txt" name="email" 
                                           class="input-xxlarge" type="text"  >
                                   </div>
                             </div>
                             </div>



                             <div class="control-group">
                                       <div class="row">

                                   <label class="control-label" for="direccion">Direccion</label>
                                   <div class="controls">
                                    <input id="direccion" class="txt" name="direccion"
                                           class="input-xxlarge" type="text"  >
                                   </div>
                             </div>
                             </div>

                             <br>
                         


               <!--opciones del usuario-->
               <center>
               <jsp:include page="Botones.jsp"></jsp:include>
               </center>
             
               <h3><%=mensaje%></h3>

             
               </fieldset>
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
             
                   
       
    </body>
</html>
