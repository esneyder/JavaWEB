package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import clases.Datos;
import clases.Reportes;
import java.util.Date;
import clases.Utilidades;
import clases.Usuario;

public final class ReporteFacturas_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write("\n");
      out.write("        <title>Sistema de Facturación</title>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("                $(\"#fechaInicial\").datepicker({dateFormat: \"yy/mm/dd\", changeYear: true});\n");
      out.write("                $(\"#fechaFinal\").datepicker({dateFormat: \"yy/mm/dd\", changeYear: true});\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            HttpSession sesion = request.getSession();
            Usuario miUsuarioLogueado = (Usuario) sesion.getAttribute("usuario");
            if (miUsuarioLogueado == null) {
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("index.jsp");
        return;
      }
      out.write("\n");
      out.write("        ");
            }
            // Variable que muestra los mensajes del sistema
            String mensaje = "";

            // Identificamos el botón que el usuario presiono
            boolean generar = false;

            if (request.getParameter("generar") != null) {
                generar = true;
            }

            // Obtenemos el valor como fue llamado el formulario
            String fechaInicial = "";
            String fechaFinal = "";

            if (request.getParameter("fechaInicial") != null) {
                fechaInicial = request.getParameter("fechaInicial");
            }
            if (request.getParameter("fechaFinal") != null) {
                fechaFinal = request.getParameter("fechaFinal");
            }

            if (fechaInicial.equals("")) {
                fechaInicial = Utilidades.formatDate(new Date());
            }
            if (fechaFinal.equals("")) {
                fechaFinal = Utilidades.formatDate(new Date());
            }

            // Si presionan botón de generar
            if (generar) {
                String sql = "SELECT factura.idFactura, factura.idCliente, " 
                        + "CONCAT(nombres, ' ', apellidos) AS nombreCompleto, "
                        + "fecha, idLinea, idProducto, descripcion, precio, "
                        + "cantidad,  precio * cantidad AS valor " 
                        + "FROM factura INNER JOIN clientes ON clientes.idCliente = factura.idCliente "
                        + "INNER JOIN detalleFactura ON detalleFactura.idFactura = factura.idFactura "
                        + "WHERE fecha >= '" + fechaInicial + "' AND fecha <= '" + fechaFinal + "'";
                Datos misDatos = new Datos();
                ResultSet rs = misDatos.getResultSet(sql);
                Reportes.reporteFacturas(rs);
                misDatos.cerrarConexion();
        
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("images/Reporte.pdf");
        return;
      }
      out.write("\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("        <h1>Reporte de Facturas</h1>\n");
      out.write("        <form name=\"ReporteFacturas\" id=\"ReporteFacturas\" action=\"ReporteFacturas.jsp\" method=\"POST\">\n");
      out.write("            <table border=\"0\">\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Fecha Inicial:</td>\n");
      out.write("                        <td><input type=\"text\" name=\"fechaInicial\" id=\"fechaInicial\" value=\"");
      out.print(fechaInicial);
      out.write("\" size=\"10\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Fecha Final:</td>\n");
      out.write("                        <td><input type=\"text\" name=\"fechaFinal\" id=\"fechaFinal\" value=\"");
      out.print(fechaFinal);
      out.write("\" size=\"10\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\"><input type=\"submit\" value=\"Generar Reporte\" name=\"generar\" id=\"generar\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <a href=\"javascript:history.back(1)\">Regresar a la página anterior</a><br>\n");
      out.write("        ");

            if (miUsuarioLogueado.getIdPerfil() == 1) {
        
      out.write("\n");
      out.write("        <a href=\"MenuAdministrador.jsp\">Regresar al menú</a>\n");
      out.write("        ");
        } else {
        
      out.write("\n");
      out.write("        <a href=\"MenuEmpleado.jsp\">Regresar al menú</a>\n");
      out.write("        ");
            }
        
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
