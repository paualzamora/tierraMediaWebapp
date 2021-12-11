package model;

import java.util.LinkedList;

public class Usuario {
	private Integer id;
	private String username, password;
	private Boolean admin;
	private String tipoDeAtraccionPreferido;
	private String nombre;
	private double presupuesto;
	private double tiempoDisponible;
	private LinkedList<Producto> itinerario = new LinkedList<Producto>();
	

	public Usuario(Integer id, String nombre, String username, String password,
			String tipoDeAtraccionPreferido, double presupuesto, double tiempoDisponible, Boolean admin) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.admin = admin;
		this.tipoDeAtraccionPreferido = tipoDeAtraccionPreferido;
		this.nombre = nombre;
		this.presupuesto = presupuesto;
		this.tiempoDisponible = tiempoDisponible;
	}

	public Usuario(String tipoDeAtraccionPreferido, String nombre, double presupuesto, double tiempoDisponible) {
		super();
		this.tipoDeAtraccionPreferido = tipoDeAtraccionPreferido;
		this.nombre = nombre;
		this.presupuesto = presupuesto;
		this.tiempoDisponible = tiempoDisponible;
	}

	public String getTipoDeAtraccionPreferido() {
		return tipoDeAtraccionPreferido;
	}

	public double getPresupuesto() {
		return presupuesto;
	}
	
	public boolean checkPassword(String password) {
		// this.password en realidad es el hash del password
		return password.equals(this.password);
	}

	public void setPresupuesto(double presupuesto) {
		this.presupuesto = presupuesto;
	}

	public double getTiempoDisponible() {
		return tiempoDisponible;
	}

	public void setTiempoDisponible(double tiempoDisponible) {
		this.tiempoDisponible = tiempoDisponible;
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public void setStringPreferido(String tipoDeAtraccionPreferido) {
		this.tipoDeAtraccionPreferido = tipoDeAtraccionPreferido;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public String getItinerario() {
		double costoTotal = 0;
		double tiempoTotal = 0;
		String atracciones = "";
		for (Producto p : this.itinerario) {
			costoTotal += p.getCosto();
			tiempoTotal += p.getTiempo();
			if(p.esPromo())
				atracciones += p.getNombre();
			if(!p.esPromo())
				atracciones += p.getNombre() + "/ ";
			}
		return "Costo total = " + costoTotal + ", Tiempo total = " + tiempoTotal + ", Atracciones = " + atracciones;			
		}
	
	public void agregarAItinerario(Producto producto) {
		itinerario.add(producto);
	}

	@Override
	public String toString() {
		return "U/ " + nombre + " [Tipo de atracción preferido = " + tipoDeAtraccionPreferido + ", Presupuesto = "
				+ presupuesto + " monedas, Tiempo disponible = " + tiempoDisponible + " horas]";
	}

	public boolean isNull() {
		return false;
	}

}
