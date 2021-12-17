package controller.itinerarios;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Producto;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/views/itinerario.do")
public class ListaItinerariosServlet extends HttpServlet implements Servlet{
	private static final long serialVersionUID = 1850838381896785072L;
	private UsuarioService usuarioService;
	
	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Usuario usuario = (Usuario) req.getSession().getAttribute("usuario");
		List<Producto> itinerario = usuario.getItinerario();
		
		req.setAttribute("itinerario", itinerario);
		System.out.println(itinerario);

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/views/itinerario.jsp");
		dispatcher.forward(req, resp);

	}

}
