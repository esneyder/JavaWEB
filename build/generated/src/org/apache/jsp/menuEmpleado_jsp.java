package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import clases.Usuario;

public final class menuEmpleado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("           \n");
      out.write("    \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write("\n");
      out.write("        <title>   Softcon | Control de Personal</title>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"control-group\">\n");
      out.write("           \n");
      out.write("        ");

            HttpSession sesion = request.getSession();
            Usuario miUsuario = (Usuario) sesion.getAttribute("usuario");
            if (miUsuario == null) {
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("index.jsp");
        return;
      }
      out.write("\n");
      out.write("        ");
            }
            if (miUsuario.getIdPerfil() != 1) {
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("index.jsp");
        return;
      }
      out.write("\n");
      out.write("        ");
            
            }
            String foto = miUsuario.getFoto();
            if (foto == null) {
                foto = "";
            }
            if(foto.equals("")) {
                foto = "usuario.png";
            }
        
      out.write("\n");
      out.write("       \n");
      out.write("  \n");
      out.write("       ");
      out.write("\n");
      out.write("       <div class=\"container\">\n");
      out.write("      <div class=\"span4 userInformation \">\n");
      out.write("        <h6 ALIGN=RIGHT > Usuario: ");
      out.print(miUsuario.getNombres() );
      out.write("</h6>\n");
      out.write("        <img ALIGN=RIGHT  src=\" ");
      out.print("img/" + foto);
      out.write("\" width=\"45\" height=\"45\"/>\n");
      out.write("        </div>  \n");
      out.write("        </div>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            \n");
      out.write("<header>\n");
      out.write("\n");
      out.write("<div class=\"row-fluid\">\n");
      out.write("<div class=\"navbar navbar-inverse\">\n");
      out.write("  <div class=\"navbar-inner\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("\t\t<a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".nav-collapse\">\n");
      out.write("\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t\t<span class=\"icon-bar\"></span>\n");
      out.write("\t\t</a>\n");
      out.write("\t\t<div class=\"nav-collapse collapse\">\n");
      out.write("\t\t<ul class=\"nav\">\n");
      out.write("                    <li class=\"active\"><a href=\"Principal.jsp\"><i class=\"icon-home icon-white\"></i> Inicio</a></li>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<li class=\"dropdown\">\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" ><i class=\"icon-wrench icon-white\"></i> Mantenimiento<b class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("                                <li><a href=\"DatosEmpleados.jsp\"><i class=\"icon-th-large\"></i> Administrar Empleados</a></li>   \n");
      out.write("\t\t\t\t<li><a href=\"ListarEmpleados.jsp\"><i class=\"icon-file\"></i> Listado Empleados</a></li>\n");
      out.write("                                <li><a href=\"DatosContEmpleado.jsp\"><i class=\"icon-tags\"></i> Datos de contacto empleados</a></li>\n");
      out.write("                                </ul>\n");
      out.write("\t\t\t</li>          \n");
      out.write("\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"icon-book icon-white\"></i> Labor<b class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("                                    <li><a  href=\"LaborPlanes.jsp\"><i class=\"icon-th-large\"></i> Administrar Planes</a></li>\n");
      out.write("                                    <li><a href=\"ListadoPlanes.jsp\"><i class=\"icon-file\"></i> Listado de planes</a></li>\n");
      out.write("                                    <li><a  data-toggle=\"modal\" href=\"#registroSalida\"><i class=\"icon-file\"></i> Registro salida</a></li>\n");
      out.write("\t\t\t\t  \n");
      out.write("\t\t\t\t \n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li class=\"dropdown\">\n");
      out.write("                            <a href=\"\" class=\"dropdown-toggle\" class=\"icon-user icon-white\" data-toggle=\"dropdown\"><i class=\"icon-user icon-white\"></i> Usuarios<b \n");
      out.write("                                         class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("\t\t\t\t\t<li><a href=\"index.jsp\"><i class=\"icon-chevron-down\"></i> Cambiar de Usario</li>\n");
      out.write("\t\t\t\t\t<li ><a href=\"ListadoUsuarios.jsp\"><i class=\"icon-file\"></i>  Listar Usuarios</a></li>\t           \n");
      out.write("             <li ><a href=\"Usuarios.jsp\"><i class=\"icon-th-large\"></i> Administrar usuarios</a></li>\n");
      out.write("              </ul>\n");
      out.write("          </li>\n");
      out.write("\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"><i class=\"icon-folder-open icon-white\"></i>  Nomina <b class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("\t\t\t\t<li><a href=\"#\"><i class=\"icon-ok\"></i>  Calcular Nomina</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\"><i class=\"icon-list-alt\"></i>  Reporte Nomina</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\"><i class=\"icon-list-alt\"></i>  Actualizar Nomina</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</li>\n");
      out.write("                        \n");
      out.write("\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"><i class=\"icon-folder-open icon-white\"></i> Ayuda <b class=\"caret\"></b></a>\n");
      out.write("\t\t\t\t<ul class=\"dropdown-menu\">\n");
      out.write("\t\t\t\t<li><a href=\"#\"><i class=\"icon-list-alt\"></i>  Manual del Sistema</a></li>\n");
      out.write("\t\t\t\t<li><a href=\"#\"><i class=\"icon-envelope\"></i> Contacto</a></li>\n");
      out.write("                                <li><a href=\"pruebaFormulario.jsp\"><i class=\"icon-envelope\"></i> Asignacion de permisos</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</li>\n");
      out.write("\t\t\t<li><a href=\"\"><i class=\"icon-inbox icon-white\"></i>  Contacto</a></li>\n");
      out.write("        </ul>\n");
      out.write("    </div><!-- /.nav-collapse -->\n");
      out.write("    </div><!-- /.container -->\n");
      out.write("  </div><!-- /.navbar-inner -->\n");
      out.write("</div><!-- /.navbar -->\n");
      out.write("\n");
      out.write("       \n");
      out.write("<div>\t\n");
      out.write("\n");
      out.write("\t<Div  class = \"page-header\" >   \n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("</header>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("\n");
      out.write("<!-- Carousel\n");
      out.write("================================================== -->\n");
      out.write("<div id=\"myCarousel\" class=\"carousel slide\">\n");
      out.write("  <!-- Indicators -->\n");
      out.write("  <ol class=\"carousel-indicators\">\n");
      out.write("    <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("    <li data-target=\"#myCarousel\" data-slide-to=\"1\"></li>\n");
      out.write("    <li data-target=\"#myCarousel\" data-slide-to=\"2\"></li>\n");
      out.write("  </ol>\n");
      out.write("  <div class=\"carousel-inner\">\n");
      out.write("    <div class=\"item active\">\n");
      out.write("        <img src=\"img/biometrico.jpg\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"carousel-caption\">\n");
      out.write("          <h1>Sistema Control de Personal</h1>\n");
      out.write("          <p>Software web para el control de personal\n");
      out.write("          \n");
      out.write("        </p></div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"item\">\n");
      out.write("      <img src=\"img/datos.jpg\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"carousel-caption\">\n");
      out.write("          <h1>Sistema Control de Personal</h1>\n");
      out.write("          <p>Software web para el control de personal\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"item\">\n");
      out.write("      <img src=\"img/nomina.png\">\n");
      out.write("      <div class=\"container\">\n");
      out.write("        <div class=\"carousel-caption\">\n");
      out.write("           <h1>Sistema Control de Personal</h1>\n");
      out.write("          <p>Software web para el control de personal\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <!-- Controls -->\n");
      out.write("  <a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">\n");
      out.write("    <span class=\"icon-prev\"></span>\n");
      out.write("  </a>\n");
      out.write("  <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">\n");
      out.write("    <span class=\"icon-next\"></span>\n");
      out.write("  </a>  \n");
      out.write("</div>\n");
      out.write("<!-- /.carousel -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Marketing messaging and featurettes\n");
      out.write("================================================== -->\n");
      out.write("<!-- Wrap the rest of the page in another container to center all the content. -->\n");
      out.write("\n");
      out.write("<div class=\"container marketing\">  \n");
      out.write("\n");
      out.write("\n");
      out.write("  <!-- START THE FEATURETTES -->\n");
      out.write("\n");
      out.write("  <hr class=\"featurette-divider\">\n");
      out.write("\n");
      out.write("  <div class=\"featurette\">\n");
      out.write("    <img class=\"featurette-image img-circle pull-right\" src=\"img/usu.gif\">\n");
      out.write("    <h2 class=\"featurette-heading\">Control de usuarios <span class=\"text-muted\">administración de permisos</span></h2>\n");
      out.write("    <p class=\"lead\">Permite Adminostrar los permisos de los usuarios, habilitandoles las opciones requeridas para cada rol.</p>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <hr class=\"featurette-divider\">\n");
      out.write("\n");
      out.write("  <div class=\"featurette\">\n");
      out.write("    <img class=\"featurette-image img-circle pull-left\" src=\"img/info.gif\">\n");
      out.write("    <h2 class=\"featurette-heading\">Diseño de informes<span class=\"text-muted\"> personalizados</span></h2>\n");
      out.write("    <p class=\"lead\">Permite diseñar informes aceptando las opciones que decea visualizar en el reporte.\n");
      out.write("    Para el control de os reportes se debe con anterioridahaber diligenciado los campos de la labor,.\n");
      out.write("    Ademas asignarle cada empleado el plan laborar en el cual se va a desenpeñar en le semestre que le sea creada la labor.\n");
      out.write("    </p>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <hr class=\"featurette-divider\">\n");
      out.write("\n");
      out.write("  <div class=\"featurette\">\n");
      out.write("    <img class=\"featurette-image img-circle pull-right\" src=\"img/asis.gif\">\n");
      out.write("    <h2 class=\"featurette-heading\">Reportes de asistencia <span class=\"text-muted\">información laboral</span></h2>\n");
      out.write("    <p class=\"lead\">Permite visualizar datos en tiempo real de los empleados.Tambien consultar las asistencias  y posibles sanciones</p>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <hr class=\"featurette-divider\">\n");
      out.write("\n");
      out.write("  <!-- /END THE FEATURETTES -->\n");
      out.write("\n");
      out.write("\n");
      out.write("  <!-- FOOTER -->\n");
      out.write("  <footer>\n");
      out.write("    <p class=\"pull-right\"><a href=\"#\">Softcon</a></p><br>\n");
      out.write("\n");
      out.write("    <p>Sistema de control de Personal <a href=\"https://www.facebook.com/ealvarezing?ref=tn_tnmn\">Facebook</a></p>\n");
      out.write("    <img src=\"img/tdea.jpg\" class=\"img-rounded\"> \n");
      out.write("   \n");
      out.write("\n");
      out.write("</div><!-- /.container -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" <div id=\"registroSalida\" class=\"modal hide fade in\" style=\"display: none; \">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("            <a class=\"close\" data-dismiss=\"modal\">×</a>\n");
      out.write("            <h3>Registro salida</h3>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("               \t<div class=\"control-group\">\n");
      out.write("                    <label class=\"control-label\" for=\"codEmpleado\">Codigo Empleado</label>\n");
      out.write("                    <div class=\"controls\">\n");
      out.write("                        <input name=\"codEmpleado\" id=\"codEpleado\" type=\"text\" placeholder=\"Codigo Empleado\" class=\"intpu-xlarge\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\t        \n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("            <a href=\"#\" class=\"btn btn-success\">Guardar</a>\n");
      out.write("            <a href=\"#\" class=\"btn\" data-dismiss=\"modal\">Salir</a>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
