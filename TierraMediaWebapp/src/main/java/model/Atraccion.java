package model;

import java.util.HashMap;
import java.util.Map;

public class Atraccion extends Producto {
	private String nombre;
	private Integer cupoMaximo;
	private Integer id;
	
	private Map<String, String> errores;
	
	

	public Atraccion(Integer id, String nombre, String tipoDeAtraccion, double costo, double tiempo, int cupo) {
		super(tipoDeAtraccion);
		this.nombre = nombre;
		this.costo = costo;
		this.tiempo = tiempo;
		this.cupoMaximo = cupo;
		this.id = id;
	}


	public Atraccion(String nombre, String tipoDeAtraccion, Double costo, Double tiempo, Integer cupo) {
		super(tipoDeAtraccion);
		this.nombre = nombre;
		this.costo = costo;
		this.tiempo = tiempo;
		this.cupoMaximo = cupo;
	}
	
	public boolean isValid() {
		validar();
		return errores.isEmpty();
	}
	
	public void validar() {
		errores = new HashMap<String, String>();

		if (costo <= 0) {
			errores.put("costo", "Debe ser positivo");
		}
		if (tiempo <= 0) {
			errores.put("tiempo", "Debe ser positivo");
		}
		if (cupoMaximo <= 0) {
			errores.put("cupoMaximo", "Debe ser positivo");
		}
	}
	
	public Map<String, String> getErrores() {
		return errores;
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setCupoMaximo(int cupoMaximo) {
		this.cupoMaximo = cupoMaximo;
	}

	public String getTipo() {
		return tipoDeAtraccion;
	}

	public Integer getCuposOcupados() {
		return cuposOcupados;
	}

	public Integer getCupo(){
		return cupoMaximo - cuposOcupados;
	}
	
	public Integer getCupoMaximo() {
		return cupoMaximo;
	}

	@Override
	public boolean hayCupo() {
		return this.cuposOcupados < this.cupoMaximo;
	}

	@Override
	public void ocuparCupo() {
		this.cuposOcupados += 1;
	}

	@Override
	public String toString() {
		return "A/ " + nombre + " [Tipo de atraccion = " + tipoDeAtraccion + ", Costo = " + costo
				+ " monedas, Tiempo = " + tiempo + " horas, Cupo maximo = " + cupoMaximo + ", Cupos ocupados = "
				+ cuposOcupados + "]";
	}

	public String toStringCorto() {
		return nombre + ", " + costo + " monedas, " + tiempo + " horas]";
	}

}
