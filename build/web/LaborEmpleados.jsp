<%-- 
    Document   : LaborEmpleados
    Created on : 30/10/2013, 06:47:08 PM
    Author     : Esneyder
--%>
<%@page import="clases.Utilidades"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="clases.LaborPlan"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="clases.Datos"%>
<%@page import="clases.Usuario"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" ></html>
<!DOCTYPE html>
<html>
   <head>
    <title>Softcon | Mantenimiento empleados</title>
    <style type="text/css">
        body { font-family:Lucida Sans, Arial, Helvetica, Sans-Serif; font-size:13px; margin:20px;}
        #main { width:960px; margin: 0px auto; border:solid 1px #b2b3b5; -moz-border-radius:10px; padding:20px; background-color:#fff;}
        #header { text-align:center; border-bottom:solid 1px #b2b3b5; margin: 0 0 20px 0; }
        fieldset { border:none; width:320px;}
        legend { font-size:18px; margin:0px; padding:10px 0px; color:#b0232a; font-weight:bold;}
        label { display:block; margin:15px 0 5px;}
        input[type=text], input[type=password] {
            width:300px;
            padding:10px;
            border:solid 1px #000;}
        .prev, .next { background-color:#5A50E4;
         padding:5px 10px; 
         color:#fff; text-decoration:none;}
        .prev:hover, .next:hover {
         background-color:#000;
         text-decoration:none;}
        .prev { float:left;}
        .next { float:right;}
        #steps { list-style:none;
        width:100%;
        overflow:hidden;
        margin:3px;
        padding:4px;}
        #steps li {font-size:24px;
        float:left;
        padding:10px;
        color:#b0b1b3;}
        #steps li span {font-size:11px;
        display:block;}
        #steps li.current { color:#000;}
        #makeWizard { background-color:#b0232a; color:#fff; padding:5px 10px; text-decoration:none; font-size:18px;}
        #makeWizard:hover { background-color:#000;}
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    <script type="text/javascript" src="formToWizard.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#SignupForm").formToWizard({ submitButton: 'SaveAccount' })
        });
        
        $('#sandbox-container .input-append.date').datepicker({
         });
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
    <script type="text/javascript" src="js/formToWizard.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#SignupForm").formToWizard({ submitButton: 'SaveAccount' })
        });
    </script>
    

<link rel="icon" type="image/png" href="img/favi.png" />
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
     <link href="css/bootstrap.css" rel="stylesheet" type="text/css" /> 
    <link href="css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" type="text/css" href="css/stylesPagina.css">
        
         
           <script>
            $(document).ready(function() {
                $("#fechaCulminacion").datepicker({dateFormat: "yy/mm/dd", changeYear: true});
                $("#fechaInicio").datepicker({dateFormat: "yy/mm/dd", changeYear: true});
            });
        </script>

       
</head>
<body
    
    
   
    
       <%
            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        %>
        <jsp:forward page="index.jsp"></jsp:forward>
        <%            
            }
            
             boolean nuevo = false;
                     if (request.getParameter("nuevo") != null) {
                        nuevo = true;
                    }
                       String mensaje = "";
                     
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
           
           
              
%> 

       <div id="main">
        <div id="header">
            <img src="img/logo.png" alt="JankoAtWrpSpeed demos" />
             </div>
           
           <form id="SignupForm" action="LaborEmpleados.jsp" method="POST">
               
        <fieldset>
           
             <legend>Informacion del plan</legend>
                <div id="w">
                     <%--campo id labor --%>
                    <div class="row">
                         <%--campo id usuario --%>
                        <label for="name">Id Plan <span class="req">*</span></label>
                        <input type="text" name="plan" id="plan" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
                <%--campo total labor --%>
                    
                    <div class="row">
                         <%--campo id usuario --%>
                        <label for="name">Total labor <span class="req">*</span></label>
                        <input type="text" name="horasLabor" id="horasLabor" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
                        
                       <%--campo horas mensuales --%>    
              <div class="row">
                      
                        <label for="name">Horas mes <span class="req">*</span></label>
                        <input type="text" name="horasMes" id="horasMes" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
                
                       <%--campo horas semanales --%>    
              <div class="row"> 
                        <label for="name">Horas semanales <span class="req">*</span></label>
                        <input type="text" name="horasSemana" id="horasSemana" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
              
              <%--campom horas diarrias --%>    
              <div class="row"> 
                        <label for="name">Horas diarias <span class="req">*</span></label>
                        <input type="text" name="horasDiarias" id="horasDiarias" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
             
                   
                </div>
               
         
        </fieldset>
        <fieldset>
            <legend>Datos de ingreso</legend>
            <div id="w">
                   <%--campo hora ingreso--%>
                   
                    <div class="row">
                      
                        <label for="name">Hora ingreso <span class="req">*</span></label>
                       
                        <input type="text" name="horaEntrada" id="horaEntrada" value="" size="10"  class="txt" tabindex="1" requered  />
                    </div>
                   
                        
                         <%--campo hora ingreso--%>
                    <div class="row">
                      
                        <label for="name">Hora salida<span class="req">*</span></label>
                        <input type="text" name="horaSalida" id="horaSalida" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
                      
                        <%--campo fecha inicio --%>
                       <div class="row">
                           <label for="name">Fecha inicio<span class="req">*</span></label>
                        <input type="text" name="fechaInicio" id="fechaInicio" value="" size="10"  class="txt" tabindex="1"  />
                    
                     </div>
                        <%--campo fecha culminacion --%>
                        <%--campo hora salida --%>
                        
                         <div class="row">
                      
                        <label for="name">Fecha culminacion<span class="req">*</span></label>
                        <input type="text" name="fechaCulminacion" id="fechaCulminacion" value="" size="10"  class="txt" tabindex="1"  />
                    </div>
                        <%--campo breve descripcion del plan --%>
                       <div class="row">
                           <label for="name">Descripcion<span class="req">*</span></label>
                           <textarea type="text" name="descripcion" id="descripcion" value="" size="10"  class="txtarea" tabindex="6"></textarea>
                        </div>
                       
                       
                    
                        <%--campo valor de las horas--%>
                       <div class="row">
                           <label for="name">Valor hora<span class="req">*</span></label>
                        <input type="text" name="valorHora" id="valorHora" value="" size="10"  class="txt" tabindex="1"  />
                    
                     </div>
                     
        </fieldset>
                      
      <div class="center">
          <input type="submit" value="Nuevo" name="nuevo" id="nuevo" class="btn btn-primary"  />
      </div>
        </form>
                      
    </div>
                       <h1>
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
                       </h1>
        <br>   
            
           
</body>
</html>
