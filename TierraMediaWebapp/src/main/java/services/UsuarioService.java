package services;

import java.util.List;

import model.Usuario;
import persistence.commons.DAOFactory;

public class UsuarioService {

	public List<Usuario> list() {
		return DAOFactory.getUsuarioDAO().findAll();
	}

	public Usuario create(Integer id, String nombre, String username, String password,
			String tipoDeAtraccionPreferido, double presupuesto, double tiempoDisponible, Boolean admin) {
		Usuario usuario = new Usuario(-1, nombre, username, password, tipoDeAtraccionPreferido, presupuesto, tiempoDisponible, false);
		
		usuario.setPassword(password);

		if (usuario.isValid()) {
			DAOFactory.getUsuarioDAO().insert(usuario);
			// XXX: si no devuelve "1", es que hubo mas errores
		}

		return usuario;
	}

}
