package model;

import java.util.List;

public class PromocionPorcentual extends Promocion {
	private int descuento;

	public PromocionPorcentual(int idPromo, String tipoPromocion, String tipoDeAtraccion, int descuento) {
		super(idPromo, tipoPromocion, tipoDeAtraccion);
		this.descuento = descuento;
	}
	
	public PromocionPorcentual(String tipoPromocion, String tipoDeAtraccion, int descuento) {
		super(tipoPromocion, tipoDeAtraccion);
		this.descuento = descuento;
	}
	
	public PromocionPorcentual(String tipoPromocion, String tipoDeAtraccion, int descuento, List<Atraccion> atracciones) {
		super(tipoPromocion, tipoDeAtraccion, atracciones);
		this.descuento = descuento;
		this.aplicarPromocion();
	}
	
	@Override 
	protected void aplicarPromocion () {
		for (Atraccion atraccion : this.atracciones) {
			this.costo += atraccion.getCosto();		
		}
		this.costo -= costo * (this.descuento / 100);
	}	

}