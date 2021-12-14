package controller.atracciones;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Atraccion;
import services.AtraccionService;

@WebServlet("/views/createAtraccion.do")
public class CrearAtraccionServlet extends HttpServlet {

	private static final long serialVersionUID = 3455721046062278592L;
	private AtraccionService atraccionService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.atraccionService = new AtraccionService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = getServletContext()
				.getRequestDispatcher("/views/atraccionesAdmin.do");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		String tipo = req.getParameter("tipo");
		Integer costo = Integer.parseInt(req.getParameter("cost"));
		Double tiempo = Double.parseDouble(req.getParameter("tiempo"));
		Integer cupo = Integer.parseInt(req.getParameter("cupo"));

		Atraccion atraccion = atraccionService.create(nombre, tipo, costo, tiempo, cupo);
		
		if (atraccion.isValid()) {
			resp.sendRedirect("/views/atraccionesAdmin.do");
		} else {
			req.setAttribute("atraccion", atraccion);

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/views/atraccionesAdmin.do");
			dispatcher.forward(req, resp);
		}

	}

}
