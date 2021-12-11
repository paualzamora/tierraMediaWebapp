package model;

import java.util.LinkedList;
import java.util.List;

public class PromocionAxB extends Promocion {

	public PromocionAxB(int idPromo, String tipoPromocion, String tipoDeAtraccion) {
		super(idPromo, tipoPromocion, tipoDeAtraccion);
	}
	
	public PromocionAxB(String tipoPromocion, String tipoDeAtraccion) {
		super(tipoPromocion, tipoDeAtraccion);
	}
	
	public PromocionAxB(String tipoPromocion, String tipoDeAtraccion, List<Atraccion> atracciones) {
		super(tipoPromocion, tipoDeAtraccion, atracciones);
		this.aplicarPromocion();
	}

	@Override 
	protected void aplicarPromocion () {
		List <Atraccion> atraccionesPagas = new LinkedList <Atraccion> (); 
		for (int i = 0; i < (this.atracciones.size()-1); i++) {
			atraccionesPagas.add(this.atracciones.get(i));
		}
		for (Atraccion atraccion : atraccionesPagas) {
			this.costo += atraccion.getCosto();
		}
	}

}
