<%-- 
    Document   : Contacto
    Created on : 12/11/2013, 04:44:21 PM
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
         <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
         %>
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
        

<div class="container marketing">  


  <!-- START THE FEATURETTES -->

  <hr class="featurette-divider">

  <div class="featurette">
      <img class="featurette-image img-circle pull-right" src="img/yo.jpg">
    <h2 class="featurette-heading">Edwin Esneyder Alvarez  <span class="text-muted">Ingenieria en software</span></h2>
    <p class="lead">Estudiante de cuarto semestre de ingenieriaen software.Me gusta desarrollar aplicaciones
    adquiriendo conocientos díatras día con la ayuda de mis tutores, ustedes docentes del Tecnologico de Antioquia
    comprometidos con el aprendizaje de cada uno de nosotros.
    Atravez del ppi (Proyecto pedagogico integrador) he adquirido conocimientos mucho mas profundos en el area ala que decea 
    decenpeñar cuando con la ayuda de Dios sea egresado de esta queria institución y dedicarme a ejercer cada conocimeinto 
    adquirido el la facultad de ingenieria y compañeros de clase.
    
    </p>
  </div>
  <center>
           
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
