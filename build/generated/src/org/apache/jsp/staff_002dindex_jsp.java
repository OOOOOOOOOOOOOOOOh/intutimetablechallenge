package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class staff_002dindex_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Index Page</title>\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"styles-revised.css\">\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        ");
String stafflogin = (String) session.getAttribute("staffLogin");
      out.write("\r\n");
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
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("  \r\n");
      out.write("                    ");
 
            String login = (String) session.getAttribute("login");
        
      out.write("\r\n");
      out.write("    ");
 if (login != null) { 
            uts.isd.model.Staff user = (uts.isd.model.Staff) session.getAttribute("user"); 
            String name = user.getName(); 
    
      out.write("\r\n");
      out.write("     \r\n");
      out.write("            <p>You are logged in as ");
      out.print( name );
      out.write(" </p>\r\n");
      out.write("        <!-- Header -->\r\n");
      out.write("        <header class=\"py-5\">\r\n");
      out.write("            <div class=\"container-fluid px-4 px-lg-5 my-5\">\r\n");
      out.write("                <div class=\"text-center text-white\">\r\n");
      out.write("                    <h1>Home Page</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </header>\r\n");
      out.write("        <!-- Header -->\r\n");
      out.write("\r\n");
      out.write("        <div id=\"catalogue\" class=\"container\">\r\n");
      out.write("            <div class=\"row row-cols-1 row-cols-md-4 g-3\">\r\n");
      out.write("                <!-- Cards Section -->\r\n");
      out.write("                <div id=\"product-list\" class=\"col\">\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <h5 class=\"card-title\">Access Logs</h5>\r\n");
      out.write("                                <p class=\"card-text\">View your previous access logs.</p>\r\n");
      out.write("                                <a href=\"staff-log.jsp\" style=\"background-color: #5666e3;\" class=\"btn btn-primary\">View</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                    </div>     \r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div id=\"product-list\" class=\"col\">\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <h5 class=\"card-title\">My account</h5>\r\n");
      out.write("                                <p class=\"card-text\">View your account information.</p>\r\n");
      out.write("                                <a href=\"staff-account.jsp\" style=\"background-color: #5666e3;\" class=\"btn btn-primary\">View</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"product-list\" class=\"col\">\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <h5 class=\"card-title\">View Exam Sessions</h5>\r\n");
      out.write("                                <p class=\"card-text\">View room layouts and existing exam sessions.</p>\r\n");
      out.write("                                <a href=\"staff-view-examslots.jsp\" style=\"background-color: #5666e3;\" class=\"btn btn-primary\">View</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div id=\"product-list\" class=\"col\">\r\n");
      out.write("                    <div class=\"card\">\r\n");
      out.write("                            <div class=\"card-body\">\r\n");
      out.write("                                <h5 class=\"card-title\">Add A New Exam Session</h5>\r\n");
      out.write("                                <p class=\"card-text\">Add a new exam session.</p>\r\n");
      out.write("                                <a href=\"StaffAddTimeSlotServlet\" style=\"background-color: #5666e3;\" class=\"btn btn-primary\">View</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>     \r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("   ");
} else { 
      out.write("\r\n");
      out.write("   <p style=\"color:white;text-align:center;\">You are not logged in</p>\r\n");
      out.write("                    <div class=\"mt-3\">\r\n");
      out.write("                        <a href=\"login.jsp\"><button id=\"purple-button\" class=\"button btn btn-primary w-100 d-flex justify-content-center align-items-center\">\r\n");
      out.write("                            <span>Login</span>\r\n");
      out.write("                            <i class=\"fa fa-long-arrow-right ms-2\"></i>\r\n");
      out.write("                        </button></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"mt-3\">\r\n");
      out.write("                        <a href=\"register.jsp\"><button id=\"purple-button\" class=\"button btn btn-primary w-100 d-flex justify-content-center align-items-center\">\r\n");
      out.write("                            <span>Register</span>\r\n");
      out.write("                            <i class=\"fa fa-long-arrow-right ms-2\"></i>\r\n");
      out.write("                       </button></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"mt-3\">\r\n");
      out.write("                        <a href=\"staff-login.jsp\"<button id=\"purple-button\" class=\"button btn btn-primary w-100 d-flex justify-content-center align-items-center\">\r\n");
      out.write("                            <span>Staff login</span>\r\n");
      out.write("                            <i class=\"fa fa-long-arrow-right ms-2\"></i>\r\n");
      out.write("                        </button></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("   ");
 } 
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("          </body>   \r\n");
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
