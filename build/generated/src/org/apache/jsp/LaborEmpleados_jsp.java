package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LaborEmpleados_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
      out.write("        <style type=\"text/css\">\n");
      out.write("        body { font-family:Lucida Sans, Arial, Helvetica, Sans-Serif; font-size:13px; margin:20px;}\n");
      out.write("        #main { width:960px; margin: 0px auto; border:solid 1px #b2b3b5; -moz-border-radius:10px; padding:20px; background-color:#f6f6f6;}\n");
      out.write("        #header { text-align:center; border-bottom:solid 1px #b2b3b5; margin: 0 0 20px 0; }\n");
      out.write("        fieldset { border:none; width:320px;}\n");
      out.write("        legend { font-size:18px; margin:0px; padding:10px 0px; color:#b0232a; font-weight:bold;}\n");
      out.write("        label { display:block; margin:15px 0 5px;}\n");
      out.write("        input[type=text], input[type=password] { width:300px; padding:5px; border:solid 1px #000;}\n");
      out.write("        .prev, .next { background-color:#b0232a; padding:5px 10px; color:#fff; text-decoration:none;}\n");
      out.write("        .prev:hover, .next:hover { background-color:#000; text-decoration:none;}\n");
      out.write("        .prev { float:left;}\n");
      out.write("        .next { float:right;}\n");
      out.write("        #steps { list-style:none; width:100%; overflow:hidden; margin:0px; padding:0px;}\n");
      out.write("        #steps li {font-size:24px; float:left; padding:10px; color:#b0b1b3;}\n");
      out.write("        #steps li span {font-size:11px; display:block;}\n");
      out.write("        #steps li.current { color:#000;}\n");
      out.write("        #makeWizard { background-color:#b0232a; color:#fff; padding:5px 10px; text-decoration:none; font-size:18px;}\n");
      out.write("        #makeWizard:hover { background-color:#000;}\n");
      out.write("    </style>\n");
      out.write("    <script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"js/formToWizard.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        $(document).ready(function(){\n");
      out.write("            $(\"#SignupForm\").formToWizard({ submitButton: 'SaveAccount' })\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "encabezado.jsp", out, false);
      out.write("\n");
      out.write("        <title>Mantenimoento de planes</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"main\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <form class=\"form-horizontal\" id=\"labores\" name=\"labores\" method=\"POST\" action=\"LaborEmpleados.jsp\">\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend>Account information</legend>\n");
      out.write("                        <label for=\"Name\">Name</label>\n");
      out.write("                        <input id=\"Name\" type=\"text\" />\n");
      out.write("                        <label for=\"Email\">Email</label>\n");
      out.write("                        <input id=\"Email\" type=\"text\" />\n");
      out.write("                        <label for=\"Password\">Password</label>\n");
      out.write("                        <input id=\"Password\" type=\"password\" />\n");
      out.write("                        \n");
      out.write("                    </fieldset>\n");
      out.write("                    <fieldset>\n");
      out.write("                        \n");
      out.write("                    </fieldset>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
