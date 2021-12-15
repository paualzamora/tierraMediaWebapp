package services;

import java.util.List;

import model.Atraccion;
import model.Usuario;
import model.Usuario;
import model.Usuario;
import persistence.UsuarioDAO;
import persistence.UsuarioDAO;
import persistence.commons.DAOFactory;

public class UsuarioService {

	public List<Usuario> list() {
		return DAOFactory.getUsuarioDAO().findAll();
	}

	public Usuario create(String nombre, String username, String password,
			String tipoDeUsuarioPreferido, double presupuesto, double tiempoDisponible, Boolean admin) {
		Usuario usuario = new Usuario(-1, nombre, username, password, tipoDeUsuarioPreferido, presupuesto, tiempoDisponible, admin);
		
		usuario.setPassword(password);

		if (usuario.isValid()) {
			DAOFactory.getUsuarioDAO().insert(usuario);
			// XXX: si no devuelve "1", es que hubo mas errores
		}

		return usuario;
	}
	
	public Usuario update(Integer id, String nombre, String username, String password,
			String tipoDeAtraccionPreferido, double presupuesto, double tiempoDisponible, Boolean admin) {

		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		Usuario usuario = usuarioDAO.find(id);

		usuario.setNombre(nombre);
		usuario.setUsername(username);
		usuario.setPassword(password);
		usuario.setTipoDeAtraccionPreferido(tipoDeAtraccionPreferido);
		usuario.setPresupuesto(presupuesto);
		usuario.setTiempoDisponible(tiempoDisponible);
		usuario.setAdmin(admin);

		if (usuario.isValid()) {
			usuarioDAO.update(usuario);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return usuario;
	}
	
	public void delete(Integer id) {
		Usuario usuario = new Usuario(id, "", "", "", "", 0, 0, false);
		
		UsuarioDAO usuarioDAO = DAOFactory.getUsuarioDAO();
		usuarioDAO.delete(usuario);
	}
	
	public Usuario find(Integer id) {
		return DAOFactory.getUsuarioDAO().find(id);
	}

}
