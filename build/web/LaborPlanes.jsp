

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="clases.Utilidades"%>
<%@page import="clases.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="clases.Datos"%>
<%@page import="clases.LaborPlan"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="servlets.EliminarLabor"%>

<!DOCTYPE html>
<html>
    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                      
                   <jsp:include page="encabezado.jsp"></jsp:include>
                         
                             <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
                         
			        <title>Manteminiento labor</title>

                             <script>
            $(document).ready(function() {
                $("#fechaCulminacion").datepicker({dateFormat: "yy/mm/dd", changeYear: true});
                $("#fechaInicio").datepicker({dateFormat: "yy/mm/dd", changeYear: true});
            });
        </script>
     
                                
               <script>
                $(document).ready(function() {
                    $("#consultar").click(function() {
                        return validarPlan()();
                    });

                    $("#nuevo").click(function() {
                        return validarTodo();
                    });
            
                    $("#modificar").click(function() {
                        return validarTodo();
                    });

                    $("#borrar").click(function() {
                        if(validarUsuario()) {
                            $("<div></div>").html("Esta seguro de borrar el usuario?").
                                dialog({title:"Confirmación",modal:true,buttons:[
                                    {
                                        text: "Si",
                                        click: function() {
                                            $(this).dialog("close");
                                            $.post("EliminarUsuario", {idUsuario: $("#idUsuario").val()}, function(data) {
                                                $("#idUsuario").val("");
                                                $("#nombres").val("");
                                                $("#apellidos").val("");
                                                $("#clave").val("");
                                                $("#confirmacion").val("");
                                                $("#perfil").val("0");
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
                    if(validarUsuario()) {
                        if(validarNombres()) {
                            if(validarApellidos()) {
                                if(validarClave()) {
                                    if(validarConfirmacion()) {
                                        if(validarClaveYConfirmacion()) {
                                            return validarPerfil();
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                }
            
                function validarPlan() {
                    if($("#plan").val() == "") {
                        $("<div></div>").html("Debe ingresar un ID de usuario").
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

              
                function error(){
				alertify.error("Usuario o constraseña incorrecto/a."); 
				return false; 
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

            
                //variables a utilizar
                //______________________________________________
                
                String plan="";
                String horasLabor="";
                String horasMes="";
                String horasSemana="";
                String horasDiarias="";
                String horaEntrada="";
                String horaSalida="";
                String fechaInicio="";
                String fechaCulminacion="";
                String descripcion="";
                String valorHora="";
                
                 if (request.getParameter("plan") != null) {
                plan = request.getParameter("plan");
                 }
                  if (request.getParameter("horasLabor") != null) {
                 horasLabor = request.getParameter("horasLabor");
                 }
                   if (request.getParameter("horasMes") != null) {
                 horasMes = request.getParameter("horasMes");
                 }
                     if (request.getParameter("horasSemana") != null) {
                 horasSemana = request.getParameter("horasSemana");
                 }
                      if (request.getParameter("horasDiarias") != null) {
                 horasSemana = request.getParameter("horasDiarias");
                 }
                           if (request.getParameter("horaEntrada") != null) {
                 horaEntrada = request.getParameter("horaEntrada");
                 }
                  if (request.getParameter("horaSalida") != null) {
                 horaSalida = request.getParameter("horaSalida");
                 }
                   if (request.getParameter("fechaInicio") != null) {
                 fechaInicio = request.getParameter("fechaInicio");
                 }
                   if (request.getParameter("fechaCulminacion") != null) {
                 fechaCulminacion = request.getParameter("fechaCulminacion");
                 }
                    if (request.getParameter("descripcion") != null) {
                 descripcion = request.getParameter("descripcion");
                 }
                      if (request.getParameter("valorHora") != null) {
                 valorHora = request.getParameter("valorHora");
                 }
            
                      //si preciono el boton limpiar
                      if(limpiar){
                          plan="";
                          horasLabor="";
                          horasMes="";
                          horasSemana="";
                          horasDiarias="";
                          horaEntrada="";
                          horaSalida="";
                          fechaInicio="";
                          fechaCulminacion="";
                          descripcion="";
                          valorHora="";
                      }
                      //si preciono el boton consultar
                      if(consultar){
                          Datos miDatos=new Datos();
                          LaborPlan miPlan=miDatos.getLabor(plan);
                          if(miPlan==null){
                                plan="";
                                horasLabor="";
                                horasMes="";
                                horasSemana="";
                                horasDiarias="";
                                horaEntrada="";
                                horaSalida="";
                                fechaInicio="";
                                fechaCulminacion="";
                                descripcion="";
                                valorHora="";
                              mensaje="Consulta no encontrada!!";
                          }else{
                              plan=miPlan.getPlan();
                              horasLabor=miPlan.getHorasLbor();
                              horasMes=miPlan.getHoraMes();
                              horasSemana=miPlan.getHorasSemana();
                              horasDiarias=miPlan.getHorasDirias();
                              horaEntrada=miPlan.getHoraEntrada();
                              horaSalida=miPlan.getHoraSalida();
                              fechaInicio= miPlan.getFechaInicio();
                              fechaCulminacion=miPlan.getFechaCulminacion();
                              descripcion=miPlan.getDescripcion();
                              valorHora= miPlan.getValorHora();
                              mensaje="Plan consultado correctamente!!";
                              }
                          miDatos.cerrarConexion();
                      }
            //si preciono el boton listar
                      
                       if(listar){
                       %>
                       <jsp:forward page="ListadoPlanes.jsp"></jsp:forward>
                      <%   
           }
            //si preciona nuevo
           if(nuevo){
               Datos misDatos=new Datos();
               LaborPlan miPlan=misDatos.getLabor(plan);
               if(miPlan!=null){
                   mensaje="El Plan ya existe";
               }else{
                   miPlan=new LaborPlan(
                           plan,
                           horasLabor,
                           horasMes, 
                           horasSemana,
                           horasDiarias,
                           horaEntrada,
                           horaSalida, 
                           fechaInicio,
                           fechaCulminacion,
                           descripcion,
                           valorHora);
                           
                           
                           
                   misDatos.newLabor(miPlan);
                   mensaje="Felicidades..Plan creado correctamente!!!";
               }
               misDatos.cerrarConexion();
           }
           //si preciono actualizar
           if(modificar){
               Datos misDatos=new Datos();
               LaborPlan miPlan=misDatos.getLabor(plan);
               if(miPlan==null){
                   mensaje="El plan solicitado no existe";
               }else{
                   miPlan=new LaborPlan(
                           plan,
                           horasLabor,
                           horasMes,
                           horasSemana,
                           horasDiarias,
                           horaEntrada,
                           horaSalida,
                           fechaInicio,                          
                           fechaCulminacion,
                           descripcion,
                           valorHora);
                   misDatos.updatePlan(miPlan);
                   mensaje="Plan modificado correctamente!!";
                               
               }
               misDatos.cerrarConexion();
           }
           
           //si presiona el boton eliminar
           if(borrar){
               Datos misDatos=new Datos();
               LaborPlan MiPlan=misDatos.getLabor(plan);
               if(MiPlan==null){
                   mensaje="El plan solicitado no existe en la base de datos";
               }else{
                  misDatos.deleteLabor(plan);
               }
               misDatos.cerrarConexion();
           }
           
           
           //si preciona el boton consultar
           
           
           
            
            %>
           
              <div id="micontenido" style="display:none;">  
            <div class="control-group">
                
            <div id="w">
            <form class="form-horizontal" name="LaborPlanes" id="LaborPlanes" 
                  action="LaborPlanes.jsp"  method="POST" >

	            <fieldset>
                        <img src="img/logo.png" alt="JankoAtWrpSpeed demos" />
                        <hr>
                         <p class="note"><span class="req">*</span>Todos los asteriscos con requeridos</p>
                 <!--plan a configurar-->
                 
                 <div class="row">
                  <div class="control-group">
	                  <label class="control-label" for="plan">Plan <span class="req">*</span></label>
	                  <div class="controls">
                              <input name="plan" id="plan" class="txt"  type="text" >
	                  </div>
                  </div>
                 </div>


                 <!--horas labor-->
                 <div class="row">
                       <div class="control-group">
	                        <label class="control-label" for="horasLabor"> Total labor <span class="req"> *</span></label>
	                        <div class="controls">
	                        	<input name="horasLabor" id="horasLabor" type="text"
                                               class="txt" >
                        </div>
                        </div>    
                 </div>

                        <!--hras mensuales-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="horasMes">Horas Mensuales  <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="horasMes" id="horasMes" class="txt" 
                                                type="text">
                        	</div>
                        </div>
                        </div>

                          

                        <!--horas semanales-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="horasSemana">Horas semanales <span class="req"> *</span></label>
                        	<div class="controls">
                        		<input name="horasSemana" id="horasSemana" class="txt"
                                               type="text"> 

                        	</div>
                                </div>
                        </div>

                       

                        <!---horas diarias-->
                        <div class="row">
                             <div class="control-group">
                        	<label class="control-label" for="horasDia">Horas diarias <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="horasDiarias" id="horasDiarias" 
                                               class="txt" type="text" >

                        	</div>
                        </div>
                        </div>

                        <!--datos de registro-->
                       
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="horasEntrada">Horas entrada <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="horaEntrada" id="horaEntrada" 
                                               class="txt" type="text" >
                        	</div>
                        </div>
                        </div>

                        <!--hora salida-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="horasSalida">Hora Salida <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="horaSalida" id="horaSalida" 
                                               class="txt" type="text">
                        	</div>
                        </div>
                        </div>

                        <!--fecha de inicio a laboral-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="fechaInicio">Fecha inicio <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="fechaInicio" id="fechaInicio" 
                                               class="txt" type="text">
                        	</div>
                        </div>
                        </div>

                        <!--fecha daducidad por semestre-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="fechaCulminacion">fecha Culminacion <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="fechaCulminacion" id="fechaCulminacion" 
                                               class="txt"  type="text">
                        	</div>
                        </div>
                        </div>

                        <!--descripcion del plan-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="descripcionPln">Descripción plan <span class="req">*</span></label>
                        	<div class="controls">
                        		<textarea name="descripcion" id="descripcion" 
                                                  class="txt" type="text" ></textarea>
                        	</div>
                        </div>
                        </div>

                        <!--valor horas del plan-->
                        <div class="row">
                        <div class="control-group">
                        	<label class="control-label" for="valorHora">Valor hora <span class="req">*</span></label>
                        	<div class="controls">
                        		<input name="valorHora" id="valorHora" 
                                               class="txt" type="text" >
                        	</div>

                        </div>
                        </div>
                     <!--opciones del usuario-->
                     
                    <jsp:include page="Botones.jsp"></jsp:include>
                    
                    <hr>
                  
                    <h1><%=mensaje%></h1>
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
	            </fieldset>
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