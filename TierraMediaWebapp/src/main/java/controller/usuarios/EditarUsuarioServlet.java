package controller.usuarios;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import services.UsuarioService;

@WebServlet("/views/editUsuario.do")
public class EditarUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 7598291131560345626L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));

		Usuario usuario = usuarioService.find(id);
		req.setAttribute("usuario", usuario);

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/views/editUsuario.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer id = Integer.parseInt(req.getParameter("id"));
		String nombre = req.getParameter("nombre");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String tipoDeAtraccionPreferido = req.getParameter("tipoDeAtraccionPreferido");
		Double presupuesto = Double.valueOf(req.getParameter("presupuesto"));
		Double tiempoDisponible = Double.valueOf(req.getParameter("tiempoDisponible"));
		Boolean admin = Boolean.parseBoolean(req.getParameter("admin"));
	
		Usuario usuario = usuarioService.update(id, nombre, username, password, tipoDeAtraccionPreferido, presupuesto, tiempoDisponible, admin);

		if (usuario.isValid()) {
			resp.sendRedirect("/TierraMediaWebapp/views/usuariosAdmin.do");
		} else {
			req.setAttribute("usuario", usuario);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/editUsuario.jsp");
			dispatcher.forward(req, resp);
		}
	}
}