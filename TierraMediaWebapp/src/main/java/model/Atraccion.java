package model;

public class Atraccion extends Producto {
	private String nombre;
	private int cupoMaximo;
	private int id;
	
	

	public Atraccion(int id, String nombre, String tipoDeAtraccion, double costo, int cupo) {
		super(tipoDeAtraccion);
		this.nombre = nombre;
		this.costo = costo;
		this.cupoMaximo = cupo;
		this.id = id;
	}


	public Atraccion(String nombre, String tipo, double costo, double tiempo, int cupo) {
		super(tipo);
		this.nombre = nombre;
		this.costo = costo;
		this.tiempo = tiempo;
		this.cupoMaximo = cupo;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getTipo() {
		return tipoDeAtraccion;
	}

	public int getCuposOcupados() {
		return cuposOcupados;
	}

	public int getCupo(){
		return cupoMaximo - cuposOcupados;
	}

	@Override
	public String getNombre() {
		return nombre;
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
