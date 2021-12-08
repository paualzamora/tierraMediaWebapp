package controller.session;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = -7039347658790577829L;
	
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.getSession().removeAttribute("user");
		req.setAttribute("flash", "¡Hasta luego!");
		
		RequestDispatcher dispatcher = getServletContext()
  		      .getRequestDispatcher("/login.jsp");
  		    dispatcher.forward(req, resp); 	
    }

}
