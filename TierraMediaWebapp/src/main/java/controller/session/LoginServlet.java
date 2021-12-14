package controller.session;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.LoginService;

@WebServlet("/views/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 8308079314140233763L;
	private LoginService loginService;

	@Override
	public void init() throws ServletException {
		super.init();
		loginService = new LoginService();
	}
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String username = req.getParameter("username");
    	String password = req.getParameter("password");
    	
    	Usuario usuario = loginService.login(username, password);
    	
    	if (!usuario.isNull()) {
    		req.getSession().setAttribute("usuario", usuario);
    		resp.sendRedirect("/TierraMediaWebapp/views/index.jsp");    		
       	} else {
    		req.setAttribute("flash", "Nombre de usuario o contrase�a incorrectos");
    		
    		RequestDispatcher dispatcher = getServletContext()
      		      .getRequestDispatcher("/views/login.jsp");
      		    dispatcher.forward(req, resp);
    	}
    }
}