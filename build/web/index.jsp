
<%-- 
     Document   : MenuAdmin
    Created on : 15/10/2013, 05:48:14 PM
    Author     : Esneyder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
         <link href="css/estilLogueo.css" rel="stylesheet" type="text/css" /> 
      
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<!--Scripts-->
 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="js/bootstrap.js" type="text/javascript"></script>
       
            <title>Softcon | Sistema de control de personal</title>
            <script>
                $(document).ready(function() {
                    $("#ValidarUsuario").submit(function() {
                        $.post("ValidarUsuario", $("#ValidarUsuario").serialize(), function(data) {
                            perfil = jQuery.trim(data);
                            if (perfil == "1")
                                document.location.href = "Principal.jsp";
                            else if (perfil == "2")
                                document.location.href = "MenuEmp.jsp";
                            else
                                $("#mensaje-ingreso").html("<h3>Usuario o clave no válido</h3>");
                        });
                        return false;
                    });
                });
            </script>
           <script type="text/javascript">
            $(document).ready(function(){
              $(document).ready(function () {
                $('#micontenido').fadeIn(2000);
              });
            });
            </script>
            <%--efecto cargar pagina--%>
                 
        </head>
        <body>
           
        <%
            session.invalidate();
        %>
       
        <br>
        <br>
          <br>
        <br>
        <div id="micontenido" style="display:none;">
      <div class="container">

      <form class="form-signin" action="ValidarUsuario"
               method="POST" name="ValidarUsuario" id="ValidarUsuario"> 
          <img ALIGN=RIGHT  src="img/favi.png" width="45" height="25" class="img-circle"/>
          <h4 class="form-signin-heading" class="icon-bar">Bienvenidos</h4>
        <input type="password" class="input-block-level" placeholder="Usuario" name="usuario" id="usuario" required="">
        <input type="password" class="input-block-level" placeholder="Password" name="clave" id="clave" required="">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Recordarme
        </label>
        <center>
        <button class="btn  btn-primary" type="submit">   Ingresar </button>
     
        </center>
      </form>

    </div> <!-- /container -->
        </div>
        
        
        <center>   <div id="mensaje-ingreso"></div></center>
        
        
        
     <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>
    </body>
</html>
