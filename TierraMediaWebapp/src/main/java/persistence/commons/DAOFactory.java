package persistence.commons;

import persistence.AtraccionDAO;
import persistence.UsuarioDAO;
import persistence.impl.AtraccionDAOImpl;
import persistence.impl.UsuarioDAOImpl;

public class DAOFactory {

	public static UsuarioDAO getUsuarioDAO() {
		return new UsuarioDAOImpl();
	}
	
	public static AtraccionDAO getAtraccionDAO() {
		return new AtraccionDAOImpl();
	}
}