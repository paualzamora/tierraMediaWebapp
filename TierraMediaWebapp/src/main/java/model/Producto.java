package model;

import java.util.List;

public abstract class Producto {
	protected double costo;
	protected double tiempo;
	protected int cuposOcupados;
	protected String tipoDeAtraccion;
	protected List <Atraccion> atracciones; 
	
	public Producto(String tipoDeAtraccion) {
		this.tipoDeAtraccion = tipoDeAtraccion;
	}
	
	public boolean esPromo() {
		return false;
	}
	
	public abstract boolean hayCupo();
	
	public double getCosto() {
		return costo;
	}

	public double getTiempo() {
		return tiempo;
	}

	public String getTipoDeAtraccion() {
		return tipoDeAtraccion;
	}

	public void setTipoDeAtraccion(String tipoDeAtraccion) {
		this.tipoDeAtraccion = tipoDeAtraccion;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}

	public void setTiempo(double tiempo) {
		this.tiempo = tiempo;
	}

	public abstract void ocuparCupo();

	protected abstract String getNombre();


}
