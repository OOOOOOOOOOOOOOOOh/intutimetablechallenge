package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class account_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>\r\n");
      out.write("        <title>IotBay - My Account</title>\r\n");
      out.write("        \r\n");
      out.write("          ");
String stafflogin = (String) session.getAttribute("staffLogin");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <!-- Navbar -->\r\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("            <!-- Container wrapper -->\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("              <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n");
      out.write("                <!-- Navbar brand -->\r\n");
      out.write("                <a class=\"navbar-brand mt-2 mt-lg-0\" href=\"#\"></a>\r\n");
      out.write("                <!-- Left links -->\r\n");
      out.write("                <ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("                  <li class=\"nav-item\">\r\n");
      out.write("                  ");
 if (stafflogin == null){ 
      out.write("\r\n");
      out.write("                    <a class=\"nav-link\" href=\"index.jsp\">Home Page</a>\r\n");
      out.write("                      ");
} else {
      out.write("\r\n");
      out.write("                      <a class=\"nav-link\" href=\"staff-index.jsp\">Home Page</a>\r\n");
      out.write("                   ");
};
      out.write("\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"device-catalogue.jsp\">Device Catalogue</a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li class=\"nav-item\">\r\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">Orders</a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("                <!-- Left links -->\r\n");
      out.write("              </div>\r\n");
      out.write("              <!-- Right elements -->\r\n");
      out.write("              <div class=\"d-flex align-items-center\">\r\n");
      out.write("                <!-- Shopping Cart -->\r\n");
      out.write("                <a class=\"text-reset me-3\" href=\"#\">\r\n");
      out.write("                  <i class=\"fa fa-shopping-cart\"></i>\r\n");
      out.write("                </a>\r\n");
      out.write("                <!-- Profile -->\r\n");
      out.write("                ");
 if (stafflogin != null){ 
      out.write("\r\n");
      out.write("                    <a class=\"text-reset me-3\" href=\"staff-account.jsp\">\r\n");
      out.write("                ");
} else {
      out.write("\r\n");
      out.write("                    <a class=\"text-reset me-3\" href=\"account.jsp\">\r\n");
      out.write("                ");
};
      out.write("\r\n");
      out.write("                    <i class=\"fa fa-user\"></i>\r\n");
      out.write("                </a>\r\n");
      out.write("                <a href=\"logout.jsp\" class=\"nav-link\">Logout</a>\r\n");
      out.write("              <!-- Right elements -->\r\n");
      out.write("            </div>\r\n");
      out.write("            <!-- Container wrapper -->\r\n");
      out.write("          </nav>\r\n");
      out.write("         <!-- Navbar -->\r\n");
      out.write("         \r\n");
      out.write("    </head>\r\n");
      out.write("    <body style=\"background-color: #5661ba;\">\r\n");
      out.write("            ");

            uts.isd.model.User user = (uts.isd.model.User) session.getAttribute("user");
            String name = user.getName();
            String email = user.getEmail();
            String password = user.getPassword();
            session.setAttribute("emailOld", email);
            
      out.write("\r\n");
      out.write("             \r\n");
      out.write("        <p class=\"margin-1\"><a href=\"account-details.jsp\">View Advanced Account Details</a></p>\r\n");
      out.write("        <h1 style=\"color:white;text-align:center;\">Edit Account</h1>\r\n");
      out.write("            <div class =\"user-registration\">\r\n");
      out.write("                <form style=\"color:white;text-align:center;\" action=\"UserUpdateServlet\" method=\"post\">    \r\n");
      out.write("                    <label style=\"color:white;text-align:center;\" for=\"email\">Email: ");
      out.print( email );
      out.write("</label>\r\n");
      out.write("                    <p style=\"color:white;text-align:center;\">Edit email: </p>\r\n");
      out.write("                    <input style=\"color:black;text-align:center;\" type=\"text\" id=\"email\" name=\"email\" value=\"");
      out.print( email );
      out.write("\"><br><br>\r\n");
      out.write("\r\n");
      out.write("                    <label style=\"color:white;text-align:center;\" for=\"name\">Name: ");
      out.print( name );
      out.write("</label>\r\n");
      out.write("                    <p style=\"color:white;text-align:center;\">Edit name: </p>\r\n");
      out.write("                    <input style=\"color:black;text-align:center;\" type=\"text\" id=\"name\" name=\"name\" value=\"");
      out.print( name );
      out.write("\"><br><br>\r\n");
      out.write("\r\n");
      out.write("                    <label style=\"color:white;text-align:center;\" for=\"password\">Password: ");
      out.print( password );
      out.write("</label>\r\n");
      out.write("                    <p style=\"color:white;text-align:center;\"> Edit password: </p>\r\n");
      out.write("                    <input style=\"color:black;text-align:center;\" type=\"password\" id=\"password\" name=\"password\" value=\"");
      out.print( password );
      out.write("\"><br><br>\r\n");
      out.write("                    \r\n");
      out.write("                    <input style=\"color:black;text-align:center;\" type=\"submit\" value=\"Save\">\r\n");
      out.write("                           ");
 if ((String) session.getAttribute("emailErr") != null) { 
      out.write("\r\n");
      out.write("                             <p>");
      out.print( (String) session.getAttribute("emailErr") );
      out.write("</p>\r\n");
      out.write("                             ");
 } 
      out.write("\r\n");
      out.write("                </form>\r\n");
      out.write("\r\n");
      out.write("                \r\n");
      out.write("            </div>\r\n");
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
