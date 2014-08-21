<%-- 
  
--%>

<%@page import="javax.swing.text.Document"%>
<%@page import="clases.Usuario"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
             <jsp:include page="encabezado.jsp"></jsp:include>
                         
                             <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
  <script>
    $(document).ready(function() {
        // Para colocar efecto a los botones
        $("input:submit").button();
    });
</script>
            <title>Softcon | Administracion de Usuarios</title>
            <script>
                $(document).ready(function() {
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
            
                function validarUsuario() {
                    if($("#idUsuario").val() == "") {
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

                function validarNombres() {
                    if($("#nombres").val() == "") {
                        $("<div></div>").html("Debe un nombre(s) de usuario").
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
                        $("<div></div>").html("Debe un apellido(s) de usuario").
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

                function validarClave() {
                    if($("#clave").val() == "") {
                        $("<div></div>").html("Debe digitar una clave para el usuario").
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

                function validarConfirmacion() {
                    if($("#confirmacion").val() == "") {
                        $("<div></div>").html("Debe digitar una confirmación de la clave").
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

                function validarClaveYConfirmacion() {
                    if($("#clave").val() != $("#confirmacion").val()) {
                        $("<div></div>").html("La clave y la confirmación no concuerdan").
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

                function validarPerfil() {
                    if($("#perfil").val() == "0") {
                        $("<div></div>").html("Debe seleccionar un perfil").
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

            // Obtenemos el valor como fue llamado el formulario
            String idUsuario = "";
            String nombres = "";
            String apellidos = "";
            String clave = "";
            String confirmacion = "";
            String perfil = "";
            String foto = "";

            if (request.getParameter("idUsuario") != null) {
                idUsuario = request.getParameter("idUsuario");
            }
            if (request.getParameter("nombres") != null) {
                nombres = request.getParameter("nombres");
            }
            if (request.getParameter("apellidos") != null) {
                apellidos = request.getParameter("apellidos");
            }
            if (request.getParameter("clave") != null) {
                clave = request.getParameter("clave");
            }
            if (request.getParameter("confirmacion") != null) {
                confirmacion = request.getParameter("confirmacion");
            }
            if (request.getParameter("perfil") != null) {
                perfil = request.getParameter("perfil");
            }
            if (request.getParameter("foto") != null) {
                foto = request.getParameter("foto");
            }

            // Si presiona el botón consultar
            if (consultar) {
                Datos misDatos = new Datos();
                Usuario miUsuario = misDatos.getUsuario(idUsuario);

                if (miUsuario == null) {
                    nombres = "";
                    apellidos = "";
                    clave = "";
                    confirmacion = "";
                    perfil = "";
                    foto = "";
                    mensaje = "Usuario no existe";
                } else {
                    idUsuario = miUsuario.getIdUsuario();
                    nombres = miUsuario.getNombres();
                    apellidos = miUsuario.getApellidos();
                    clave = miUsuario.getClave();
                    confirmacion = miUsuario.getClave();
                    perfil = "" + miUsuario.getIdPerfil();
                    foto = miUsuario.getFoto();
                    mensaje = "Usuario consultado";
                }
                misDatos.cerrarConexion();
            }

            // Si presiona el botón limpiar
            if (limpiar) {
                idUsuario = "";
                nombres = "";
                apellidos = "";
                clave = "";
                confirmacion = "";
                perfil = "";
                foto = "";
                mensaje = "";
            }

            // Si presiona botón de nuevo
            if (nuevo) {
                Datos misDatos = new Datos();
                Usuario miUsuario = misDatos.getUsuario(idUsuario);

                if (miUsuario != null) {
                    mensaje = "Usuario ya existe";
                } else {
                    miUsuario = new Usuario(
                            idUsuario,
                            nombres,
                            apellidos,
                            clave,
                            new Integer(perfil),
                            foto);
                    misDatos.newUsuario(miUsuario);
                    mensaje = "Usuario ingresado";
                }
                misDatos.cerrarConexion();
            }

            // Si presiona botón modificar
            if (modificar) {
                Datos misDatos = new Datos();
                Usuario miUsuario = misDatos.getUsuario(idUsuario);

                if (miUsuario == null) {
                    mensaje = "Usuario no existe";
                } else {
                    miUsuario = new Usuario(
                            idUsuario,
                            nombres,
                            apellidos,
                            clave,
                            new Integer(perfil),
                            foto);
                    misDatos.updateUsuario(miUsuario);
                    mensaje = "Usuario modificado";
                }
                misDatos.cerrarConexion();
            }

            // Si presiona listar
            if (listar) {
        %>
        <jsp:forward page="ListadoUsuarios.jsp"></jsp:forward>
        <%            }
        %>
        <div id="micontenido" style="display:none;">
        <div class="control-group">
        <div id="w">
                <img src="img/logo.png" alt="JankoAtWrpSpeed demos" />
                <hr>
                
                <form name="usuarios" id="usuarios" action="Usuarios.jsp" method="POST" class="form-horizontal">
           
            <p class="note"><span class="req">*</span>Todos los asteriscos con requeridos</p>
            <table border="0">
                <tbody>               
                <div class="control-group">
                    <div class="row">
                     
                         <%--campo id usuario --%>
                        <label for="name" class="control-label">Id Usuario <span class="req">*</span></label>
                        <div class="controls">
                        <input type="text" name="idUsuario" id="idUsuario" value="<%=idUsuario%>" size="10"  class="txt" tabindex="1"  />
                        </div>
                        </div>
                    </div> 
                        
               
            
                
                    <%--campo nombre --%>
                    <div class="control-group">
                     <div class="row">
                         <label for="name" class="control-label">Nombres<span class="req">*</span></label>
                         <div class="controls">
                         <input type="text" name="nombres" id="nombres" value="<%=nombres%>" size="30" class="txt" tabindex="1" />
                        </div>
                     </div>
                    </div>
                        
                        <%--campo apellido --%>
                        <div class="control-group">
                        <div class="row">
                        <label for="name" class="control-label">Apellidos<span class="req">*</span></label>
                        <div class="controls">    
                        <input type="text" name="apellidos" id="apellidos" value="<%=apellidos%>" size="30" class="txt" tabindex="1"/>                        </div>
                            </div>
                        </div>
                           
                            <%--campo clave --%>
                            <div class="control-group">
                            <div class="row">
                                 <label for="name" class="control-label">Password<span class="req">*</span></label>
                                 <div class="controls">
                                 <input type="password" name="clave" id="clave" value="<%=clave%>" size="10" class="txt" tabindex="1"/>
                            </div>
                            </div>
                            </div>
                             <%--campo confirmacion clave--%>
                             <div class="control-group">
                            <div class="row">
                                 <label for="name" class="control-label">Confirmacion password<span class="req">*</span></label>                        
                                 <div class="controls">
                                 <input type="password" name="confirmacion" id="confirmacion" value="<%=confirmacion%>" size="10" class="txt" tabindex="1" /></td>
                          </div>
                            </div>
                             </div>
                            <%-- campo perfil --%>
                            <div class="control-group">
                                        <div class="row">

                                            <label for="name" class="control-label">Perfil<span class="req">*</span></label>  
                                       <div class="controls">
                                            <select name="perfil" id="perfil">
                                                <option value="0" <%=(perfil.equals("") ? "selected" : "")%> >Seleccione perfil...</option>
                                                <option value="1" <%=(perfil.equals("1") ? "selected" : "")%> >Administrador</option>
                                                <option value="2" <%=(perfil.equals("2") ? "selected" : "")%> >Empleado</option>
                                            </select>
                                        </div>
                                            </div>
                            </div>
                                <%--imagen del usuario--%>
                       <div class="control-group">                                                                       
                    <div class="row">
                        <label class="control-label" for="name">Foto</label>  
                                 <div class="controls">
                            <input type="file" name="foto" id="foto" value="<%=foto%>" />
                            <br>
                            <%
                                if (foto == null) {
                                    foto = "";
                                }
                                if (foto.equals("")) {
                            %>
                           
                            <img src="img/usuario.png" width="150" height="150" alt="Seleccione una foto"/>
                            
                            <%                            } else {
                            %>
                            <center>
                            <img src="<%="img/" + foto%>" width="120" height="150" alt="Seleccione una foto"/>
                             </center>
                            <%
                                }
                            %>
                     </div>
                    </div>                      
        </div>
                   
                </tbody>
            </table>
           
            <center>
            <jsp:include page="Botones.jsp"></jsp:include>
            </center>
            
            
           
            <center><h1><%=mensaje%></h1></center>
        <br>
        <center>
        <a href="javascript:history.back(1)">Regresar a la página anterior</a><br>
        <a href="Principal.jsp" class="btn btn-link">Regresar al menú</a>
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
