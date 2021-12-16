package services;


import java.util.HashMap;
import java.util.Map;

import model.Atraccion;
import model.Usuario;
import persistence.AtraccionDAO;
import persistence.UsuarioDAO;
import persistence.commons.DAOFactory;
import persistence.impl.UsuarioDAOImpl;

public class ComprarAtraccionService {

	AtraccionDAO atraccionDAO = DAOFactory.getAtraccionDAO();
	UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
	UsuarioDAOImpl usuarioDAOImpl = new UsuarioDAOImpl();
	
	public Map<String, String> buy(Integer usuarioId, Integer atraccionId) {
		Map<String, String> errores = new HashMap<String, String>();

		Usuario usuario = usuarioDAO.find(usuarioId);
		Atraccion atraccion = atraccionDAO.find(atraccionId);

		if (!atraccion.hayCupo()) {
			errores.put("atraccion", "No hay cupo disponible");
		}
		if (!usuario.puedeComprar(atraccion)) {
			errores.put("usuario", "No tienes dinero o tiempo suficiente");
		}

		if (errores.isEmpty()) {
			usuario.agregarAItinerario(atraccion);
			usuarioDAOImpl.insertItinerario(usuario, atraccion);	

			atraccionDAO.update(atraccion);
			usuarioDAO.update(usuario);
		}

		return errores;

	}

}