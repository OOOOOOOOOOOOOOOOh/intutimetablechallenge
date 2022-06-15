package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class staff_002dlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"styles-revised.css\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("        <title>Staff Login</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"row\" style=\"width:100%;\">\r\n");
      out.write("                <div class=\"col-sm-4\">\r\n");
      out.write("                    <div id=\"LHS\" class=\"container-md-fluid text-white\">\r\n");
      out.write("                        <img id=\"index-img\" src=\"images/wave.png\">\r\n");
      out.write("                        <br><br><h1>Staff Login</h1>\r\n");
      out.write("                    </div> \r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-sm-8\">\r\n");
      out.write("                    <div id=\"RHS\" class=\"container-fluid\">\r\n");
      out.write("                <form action=\"StaffLoginServlet\" method=\"post\">\r\n");
      out.write("                    <h1>Staff Login</h1>\r\n");
      out.write("                    <div class=\"login-form\">\r\n");
      out.write("                <p>Email Address</p>\r\n");
      out.write("                <input class=\"input-group\"type=\"text\" id=\"email\" name=\"email\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <p>Password</p>\r\n");
      out.write("                <input class=\"input-group\"type=\"password\" id=\"password\" name=\"password\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"hidden\" id=\"login\" name=\"login\" value=\"true\"><br><br>\r\n");
      out.write("                </div>\r\n");
      out.write("                <br>\r\n");
      out.write("                <button id=\"submit\" type=\"submit\" value=\"login\">Login</button>\r\n");
      out.write("               </form>\r\n");
      out.write("            ");
 if (session.getAttribute("userNotFound") != null) { 
      out.write("\r\n");
      out.write("            <p> Account not found! </p>\r\n");
      out.write("            ");
} 
      out.write("\r\n");
      out.write("            <div class =\"register-btn\">\r\n");
      out.write("            <p id=\"registerLnk\">Not a staff member? <a href=\" register.jsp\">Register as a user here!</a></p>\r\n");
      out.write("            <p id=\"registerLnk\">Don't have a staff account? <a href=\" staff-register.jsp\">Register as a staff member here!</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
