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

@WebServlet("/views/createUsuario.do")
public class CrearUsuarioServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private UsuarioService usuarioService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.usuarioService = new UsuarioService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/views/createUsuario.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String nombre = req.getParameter("nombre");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String tipoPreferido = req.getParameter("tipoDeAtraccionPreferido");
		Integer presupuesto = Integer.parseInt(req.getParameter("presupuesto"));
		Double tiempo = Double.parseDouble(req.getParameter("tiempoDisponible"));
		Boolean admin = Boolean.parseBoolean(req.getParameter("admin"));

		Usuario tmp_usuario = usuarioService.create(nombre, username, password, tipoPreferido, presupuesto, tiempo, admin);

		if (tmp_usuario.isValid()) {
			resp.sendRedirect("/views/usuariosAdmin.do");
		} else {
			req.setAttribute("tmp_usuario", tmp_usuario);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/createUsuario.jsp");
			dispatcher.forward(req, resp);
		}

	}

}

