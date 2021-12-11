package persistence.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Usuario;
import model.nullobjects.NullUsuario;
import persistence.UsuarioDAO;
import persistence.commons.ConnectionProvider;
import persistence.commons.MissingDataException;

public class UsuarioDAOImpl implements UsuarioDAO {

	public int insert(Usuario usuario) {
		try {
			String sql = "INSERT INTO usuarios (nombre, username, password, tipo_de_atraccion, presupuesto, tiempo_disponible) VALUES (?, ?, ?, ?, ?, ?)";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getUsername());
			statement.setString(3, usuario.getPassword());
			statement.setString(4, usuario.getTipoDeAtraccionPreferido());
			statement.setDouble(5, usuario.getPresupuesto());
			statement.setDouble(6, usuario.getTiempoDisponible());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int update(Usuario usuario) {
		try {
			String sql = "UPDATE usuarios SET presupuesto = ?, tiempo_disponible = ? WHERE id = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setDouble(1, usuario.getPresupuesto());
			statement.setDouble(2, usuario.getTiempoDisponible());
			statement.setDouble(3, usuario.getId());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int delete(Usuario usuario) {
		try {
			String sql = "DELETE FROM usuarios WHERE USERNAME = ?";
			Connection conn = ConnectionProvider.getConnection();

			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, usuario.getUsername());
			int rows = statement.executeUpdate();

			return rows;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public Usuario findByUsername(String username) {
		try {
			String sql = "SELECT * FROM usuarios WHERE username = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, username);
			ResultSet resultados = statement.executeQuery();

			Usuario usuario = NullUsuario.build();

			if (resultados.next()) {
				usuario = toUsuario(resultados);
			}

			return usuario;
		} catch (Exception e) {
			e.printStackTrace();
			throw new MissingDataException(e);
		}
	}

	public Usuario find(Integer id) {
		try {
			String sql = "SELECT * FROM usuarios WHERE ID = ?";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultados = statement.executeQuery();

			Usuario usuario = NullUsuario.build();

			if (resultados.next()) {
				usuario = toUsuario(resultados);
			}

			return usuario;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public int countAll() {
		try {
			String sql = "SELECT COUNT(1) AS TOTAL FROM usuarios";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			resultados.next();
			int total = resultados.getInt("TOTAL");

			return total;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	public List<Usuario> findAll() {
		try {
			String sql = "SELECT * FROM usuarios";
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultados = statement.executeQuery();

			List<Usuario> usuarios = new LinkedList<Usuario>();
			while (resultados.next()) {
				usuarios.add(toUsuario(resultados));
			}

			return usuarios;
		} catch (Exception e) {
			throw new MissingDataException(e);
		}
	}

	private Usuario toUsuario(ResultSet usuarioRegister) throws SQLException {
		return new Usuario(usuarioRegister.getInt(1), usuarioRegister.getString(2), usuarioRegister.getString(3),
				usuarioRegister.getString(4), usuarioRegister.getString(5), usuarioRegister.getDouble(6),
				usuarioRegister.getDouble(7), usuarioRegister.getBoolean(8));
	}

}
