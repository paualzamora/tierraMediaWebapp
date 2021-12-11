package model;

import java.util.List;

public class PromocionAbsoluta extends Promocion {

	public PromocionAbsoluta(int idPromo, String tipoPromocion, String tipoDeAtraccion, double costo) {
		super(idPromo, tipoPromocion, tipoDeAtraccion);
		this.costo = costo;
	}
	
	public PromocionAbsoluta(String tipoPromocion, String tipoDeAtraccion, double costo) {
		super(tipoPromocion, tipoDeAtraccion);
		this.costo = costo;
	}
	
	public PromocionAbsoluta(String tipoPromocion, String tipoDeAtraccion, double costo, List<Atraccion> atracciones) {
		super(tipoPromocion, tipoDeAtraccion, atracciones);
		this.costo = costo;
	}

}
