<%-- 
    Document   : probandoindex
    Created on : 6/10/2013, 08:10:41 PM
    Author     : Esneyder
--%>
<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="EstiloPrintcipal.jsp"></jsp:include>
        <title>   Softcon | Control de Personal</title>
          <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
       <jsp:include page="encabezado.jsp"></jsp:include>
                         <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
         <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
         
    </head>
    <body>
        <script>
                        $(document).ready(function() {

                   $("body").css("display", "none");
                   $("body").fadeIn(2000);

                   $("a.transicion").click(function(event){
                       event.preventDefault();
                       linkDestino = this.href;
                       $("body").fadeOut(1000, redireccionarPag);      
                   });

                   function redireccionarPag() {
                       window.location = linkDestino;
                   }

               });
    </script>
        <div class="control-group">
           
        <%
            HttpSession sesion = request.getSession();
            Usuario miUsuario = (Usuario) sesion.getAttribute("usuario");
            if (miUsuario == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            }
            if (miUsuario.getIdPerfil() != 1) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
            String foto = miUsuario.getFoto();
            if (foto == null) {
                foto = "";
            }
            if(foto.equals("")) {
                foto = "usuario.png";
            }
        %>
       
       
        <div id="micontenido" style="display:none;">
       <%-- <h6>Bienvenido(a): <%=miUsuario.getNombres() + " " + miUsuario.getApellidos()%></h6> --%>
       <div class="container">
      <div class="span4 userInformation ">
        <h6 ALIGN=RIGHT > Usuario: <%=miUsuario.getNombres() %></h6>
        <img ALIGN=RIGHT  src=" <%="img/" + foto%>" width="45" height="25" class="img-circle"/>
        </div>  
        </div>
        <div class="container-fluid">    
<header>

<div class="navbar navbar-inverse">
  <div class="navbar-inner">
    <div class="container-fluid">
		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</a>
		<div class="nav-collapse collapse">
		<ul class="nav">
                    <li class="active"><a href="Principal.jsp"><i class="icon-home icon-white"></i> Inicio</a></li>
			
			<li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" > Mantenimiento<b class="caret"></b></a>
				<ul class="dropdown-menu">
                                <li><a href="DatosEmpleados.jsp"><i class="icon-user" class="transicion"></i> Administrar Empleados</a></li> 
                                <li class="dropdown-submenu">
                                
				 <li class="dropdown-submenu">
                                     <a tabindex="-1" href="ListarEmpleados.jsp"> <i class="icon-list-alt"></i>  Listado empleados</a>
                        <ul class="dropdown-menu">
                         <li><a href="DatosContEmpleado.jsp"><i class="icon-list-alt"></i> Datos de contacto empleados</a></li>
                          </ul>
                                 <li class="divider"></li>
                       <li><a href="registro-departemento.jsp"><i class="icon-th-large"></i> Administrar departamentos</a></li> 
                        <li class="dropdown-submenu">
                            <a tabindex="-1" href="listado-general_depart.jsp"><i class=" icon-th-list"></i> Listado departamento</a>
                        <ul class="dropdown-menu">
                         <li><a href=""><i class="icon-eye-open"></i> Ver departamento</a></li>
                          <li><a href=""><i class="icon-search"></i> consula validaciones</a></li>
                          
                        </ul>
                            
                            <li class="divider"></li>
                            <li><a href="new-areaDetrabajo.jsp"><i class="icon-th-large"></i> Administrar arear de trabajo</a></li> 
                        <li class="dropdown-submenu">
                            <a tabindex="-1" href="Listado-areas.jsp"><i class=" icon-th-list"></i> Listado areas</a>
                        <ul class="dropdown-menu">
                         <li><a href=""><i class="icon-eye-open"></i> Ver departamento</a></li>
                          <li><a href=""><i class="icon-search"></i> consula validaciones</a></li>
                          
                        </ul>
                        
                      </li>
                       </ul>
                             
                            
			</li>          
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> Labor<b class="caret"></b></a>
				<ul class="dropdown-menu">
                                    <li><a  href="LaborEmpleados.jsp"><i class=" icon-wrench"></i> Administrar Planes</a></li>
                                    <li><a  href="LaborPlanes.jsp"><i class="icon-retweet"></i> Actualizar Planes</a></li>
                                    <li><a href="ListadoPlanes.jsp"><i class="icon-file"></i> Listado de planes</a></li>
                                   
				  
				 
				</ul>
			</li>
			<li class="dropdown">
                            <a href="" class="dropdown-toggle" class="icon-user icon-white" data-toggle="dropdown"></i> Usuarios<b 
                                         class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="index.jsp"><i class="icon-share"></i> Cambiar de Usario</li>
					<li ><a href="ListadoUsuarios.jsp"><i class=" icon-list"></i>  Listar Usuarios</a></li>	           
             <li ><a href="Usuarios.jsp"><i class="icon-th-large"></i> Administrar usuarios</a></li>
              </ul>
          </li>
          
          <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"></i> Registro<b class="caret"></b></a>
				<ul class="dropdown-menu">
                                    <li><a href="RegistroEntrada.jsp"><i class="icon-plus-sign"></i> Registro ingreso</a></li>
                                    <li><a href="registroSalida.jsp"><i class=" icon-resize-full"></i> Registro salida</a></li>
                                    <li><a  href="ListadoRegistro-Ingreso.jsp"><i class="icon-list-alt"></i> Listado registros ingreso</a></li>
                                 
				</ul>
			</li>
                        
                        <li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"></i>  Reportes <b class="caret"></b></a>
				<ul class="dropdown-menu">
                                    <li><a href="#"><i class="icon-ok"></i>  Empleados registrados ingreso</a></li>
				<li><a href="#"><i class="icon-list-alt"></i>  Empleados registraron salida </a></li>
				<li><a href="#"><i class="icon-list-alt"></i>  Actualizar Nomina</a></li>
				</ul>
			</li>
                        
                        
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"></i>  Nomina <b class="caret"></b></a>
				<ul class="dropdown-menu">
				<li><a href="#"><i class="icon-ok"></i>  Calcular Nomina</a></li>
				<li><a href="#"><i class="icon-list-alt"></i>  Reporte Nomina</a></li>
				<li><a href="#"><i class="icon-list-alt"></i>  Actualizar Nomina</a></li>
				</ul>
			</li>
                        
                         
			
                        
                        
                       
                        
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#"></i> Ayuda <b class="caret"></b></a>
				<ul class="dropdown-menu">
				 <li><a href="#" onclick="window.open('Manual.pdf')"><i class="icon-book"></i> Manual del Sistema</a></li>
                               </ul>
			</li>
                        <li><a href="Contacto.jsp">  Contacto</a></li>
        </ul>
    </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
  </div><!-- /.navbar-inner -->
</div><!-- /.navbar -->

       
<div>	

	<Div  class = "page-header" >   
  </div>
</div>


</header>
        
        
            
    
<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="item active">
        <img src="img/rep.jpg">
      <div class="container">
        <div class="carousel-caption">
          <h1>Sistema Control de Personal</h1>
          <p>Software web para el control de personal
          
        </p></div>
      </div>
    </div>
    <div class="item">
      <img src="img/datos.jpg">
      <div class="container">
        <div class="carousel-caption">
          <h1>Sistema Control de Personal</h1>
          <p>Software web para el control de personal
        </div>
      </div>
    </div>
    <div class="item">
      <img src="img/nomina.png">
      <div class="container">
        <div class="carousel-caption">
           <h1>Sistema Control de Personal</h1>
          <p>Software web para el control de personal
        </div>
      </div>
    </div>
  </div>
  <!-- Controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="icon-next"></span>
  </a>  
</div>
<!-- /.carousel -->










<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">  


  <!-- START THE FEATURETTES -->

  <hr class="featurette-divider">

  <div class="featurette">
    <img class="featurette-image img-circle pull-right" src="img/usu.gif">
    <h2 class="featurette-heading">Control de usuarios <span class="text-muted">administración de permisos</span></h2>
    <p class="lead">Permite Administrar los permisos de los usuarios,
        habilitandoles las opciones requeridas para cada rol. Cada perfil posee su propia session lo que hace que la aplicacion se encuentre segura
    de todos los movimientos que se realicen.</p>
  </div>

  <hr class="featurette-divider">

  <div class="featurette">
    <img class="featurette-image img-circle pull-left" src="img/info.gif">
    <h2 class="featurette-heading">Administracion <span class="text-muted"> Registros</span></h2>
    <p class="lead">Permite administrar los datos generales de los empleados asi como el de su labor.
        Cada empleado se le asignara un plan de trabajo en el que se podra llevar estricto control de su respectivi cumplimiento.
    </p>
  </div>

  <hr class="featurette-divider">

  <div class="featurette">
    <img class="featurette-image img-circle pull-right" src="img/asis.gif">
    <h2 class="featurette-heading">Reportes de asistencia <span class="text-muted">información laboral</span></h2>
    <p class="lead">Permite visualizar datos en tiempo real de los empleados.Tambien consultar las asistencias  y posibles sanciones</p>
  </div>

  <hr class="featurette-divider">

  <!-- /END THE FEATURETTES -->


  <!-- FOOTER -->
  <footer>
    <p class="pull-right"><a href="https://twitter.com/EdwinEsneyder">Twitter</a></p><br>

    <p>Sistema de control de Personal <a href="https://www.facebook.com/ealvarezing?ref=tn_tnmn">Facebook</a></p>
    <center>
    <img src="img/logo.png" class="img-rounded"> 
    </center>
   

</div><!-- /.container -->


<%-- --%>
 <div id="registroSalida" class="modal hide fade in" style="display: none; ">
            <div class="modal-header">
            <a class="close" data-dismiss="modal">×</a>
            <h3>Registro salida</h3>
            </div>
            <div class="modal-body">
               	<div class="control-group">
                    <label class="control-label" for="codEmpleado">Codigo Empleado</label>
                    <div class="controls">
                        <input name="codEmpleado" id="codEpleado" type="text" placeholder="Codigo Empleado" class="intpu-xlarge">
                    </div>
                </div>	        
            </div>
            <div class="modal-footer">
            <a href="#" class="btn btn-success">Guardar</a>
            <a href="#" class="btn" data-dismiss="modal">Salir</a>
            </div>
            
            
        </div
        <footer>
         <p>&copy; Softcon 2013</p>
       </footer>
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
